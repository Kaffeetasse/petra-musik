#!/bin/bash

# Script to remove unnecessary metadata from images in static folder
# Uses exiftool to strip EXIF data while preserving essential image information

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if exiftool is installed
if ! command -v exiftool &> /dev/null; then
    print_error "exiftool is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt-get install libimage-exiftool-perl"
    echo "  macOS: brew install exiftool"
    echo "  CentOS/RHEL: sudo yum install perl-Image-ExifTool"
    exit 1
fi

# Base directory
STATIC_DIR="static"

if [ ! -d "$STATIC_DIR" ]; then
    print_error "Static directory not found: $STATIC_DIR"
    exit 1
fi

print_status "Starting metadata removal from images in $STATIC_DIR"

# Counter for processed files
processed_count=0
total_size_before=0
total_size_after=0

# Function to process a single image file
process_image() {
    local file="$1"
    local extension="${file##*.}"
    
    # Get file size before processing
    local size_before=$(stat -c%s "$file" 2>/dev/null || echo 0)
    total_size_before=$((total_size_before + size_before))
    
    print_status "Processing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Remove metadata based on file type
    case "${extension,,}" in
        jpg|jpeg)
            # For JPEG files, remove all metadata except essential image info
            exiftool -overwrite_original -all= -tagsfromfile @ -colorspace -icc_profile "$file" 2>/dev/null || {
                print_warning "Failed to process $file, restoring backup"
                mv "${file}.backup" "$file"
                return 1
            }
            ;;
        png)
            # For PNG files, remove all metadata
            exiftool -overwrite_original -all= "$file" 2>/dev/null || {
                print_warning "Failed to process $file, restoring backup"
                mv "${file}.backup" "$file"
                return 1
            }
            ;;
        gif)
            # For GIF files, remove all metadata
            exiftool -overwrite_original -all= "$file" 2>/dev/null || {
                print_warning "Failed to process $file, restoring backup"
                mv "${file}.backup" "$file"
                return 1
            }
            ;;
        webp)
            # For WebP files, remove all metadata
            exiftool -overwrite_original -all= "$file" 2>/dev/null || {
                print_warning "Failed to process $file, restoring backup"
                mv "${file}.backup" "$file"
                return 1
            }
            ;;
        svg)
            # For SVG files, skip metadata removal (they're XML-based)
            print_status "Skipping SVG file: $file (XML-based format)"
            rm "${file}.backup"
            return 0
            ;;
        *)
            print_warning "Unsupported file type: $file"
            rm "${file}.backup"
            return 1
            ;;
    esac
    
    # Get file size after processing
    local size_after=$(stat -c%s "$file" 2>/dev/null || echo 0)
    total_size_after=$((total_size_after + size_after))
    
    # Calculate size difference
    local size_diff=$((size_before - size_after))
    
    if [ $size_diff -gt 0 ]; then
        local percentage=$(awk "BEGIN {printf \"%.1f\", $size_diff * 100 / $size_before}")
        print_status "  Reduced by $(numfmt --to=iec $size_diff) (${percentage}%)"
    else
        print_status "  No size reduction"
    fi
    
    # Remove backup if successful
    rm "${file}.backup"
    
    processed_count=$((processed_count + 1))
    return 0
}

# Find and process all supported image files
find "$STATIC_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.svg" \) | while read -r file; do
    process_image "$file"
done

# Calculate total savings
total_saved=$((total_size_before - total_size_after))

print_status "Metadata removal completed!"
print_status "Files processed: $processed_count"

if [ $total_saved -gt 0 ]; then
    print_status "Total size reduced by: $(numfmt --to=iec $total_saved)"
    if [ $total_size_before -gt 0 ]; then
        percentage=$(awk "BEGIN {printf \"%.1f\", $total_saved * 100 / $total_size_before}")
        print_status "Overall reduction: ${percentage}%"
    fi
else
    print_status "No significant size reduction achieved"
fi

print_status "All images have been processed. Original files backed up temporarily during processing."
