# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static website for Petra, a professional musician from Bempflingen, Germany, built with Hugo using the Ananke theme. The site is in German and showcases her services for weddings, funerals, and events.

## Development Commands

### Local Development
```bash
# Start development server
hugo server -D

# Start with drafts included
hugo server -D --buildDrafts

# Access site at http://localhost:1313
```

### Building
```bash
# Build for production
hugo --minify

# Build with drafts
hugo --buildDrafts --minify
```

### Theme Management
```bash
# Update theme submodule
git submodule update --init --recursive

# Update theme to latest version
git submodule update --remote themes/ananke
```

## Architecture

### Site Structure
- **Hugo Configuration**: `hugo.toml` - Site configuration, menu structure, language settings
- **Content**: `content/` directory contains all page content in Markdown
  - `_index.md` - Homepage content
  - `about.md` - About page ("Über mich")
  - `contact.md` - Contact page with form
  - `gallery.md` - Image gallery
  - `imprint.md` - Legal imprint page
- **Layouts**: `layouts/` directory contains custom Hugo templates
  - `index.html` - Custom homepage layout with hero section and services
  - `_default/` - Base templates extending Ananke theme
    - `baseof.html` - Base template structure
    - `single.html` - Single page template
  - `contact/single.html` - Contact page specific template
  - `gallery/single.html` - Gallery page with image grid and lightbox
  - `page/` - Page-specific templates
  - `partials/` - Reusable template components
    - `head-additions.html` - Custom head additions
    - `site-scripts.html` - Site-specific JavaScript
- **Static Assets**: `static/` directory for images, CSS, JS, icons
  - `css/` - Stylesheets
    - `custom.css` - Custom styling overrides
    - `fonts.css` - Font definitions
  - `js/main.js` - Mobile menu and navigation functionality
  - `images/` - Site images including favicon and gallery photos
  - `icons/` - SVG icons for services (wedding, funeral, event)
  - `fonts/` - Custom font files

### Theme Integration
- Uses Ananke theme as Git submodule in `themes/ananke/`
- Custom layouts override theme defaults while maintaining compatibility
- Custom CSS in `static/css/custom.css` extends theme styling
- German language configuration with custom menu structure

### Key Features
- Responsive design with mobile navigation
- Hero section with call-to-action
- Services showcase with custom icons
- Contact form integration
- Custom favicon and branding
- Smooth scrolling navigation

## Deployment

### GitHub Pages
- Automated deployment via GitHub Actions (`.github/workflows/hugo-deploy.yml`)
- Builds with Hugo 0.147.9
- Deploys to custom domain: www.petramusik.de
- Triggered on pushes to main branch

### Manual Deployment
```bash
# Build and deploy manually
hugo --minify
# Upload public/ directory to hosting provider
```

## Content Management

### Adding New Pages
```bash
# Create new page
hugo new page-name.md

# Create new post
hugo new posts/post-name.md
```

### Image Management
- Place images in `static/images/` directory
- Reference in content as `/images/filename.jpg`
- Use appropriate alt text for accessibility
- Use descriptive filenames (e.g., `petra-club-performance.jpg` instead of `IMG_1234.jpg`)

### Gallery System
- **Gallery Content**: `content/gallery.md` contains only introductory text
- **Gallery Template**: `layouts/gallery/single.html` contains hardcoded image grid
- **Gallery Images**: Located in `static/images/` with descriptive filenames
- **Adding Gallery Images**: 
  1. Copy images to `static/images/` with descriptive names
  2. Add new `<div class="gallery-item">` blocks to `layouts/gallery/single.html`
  3. Include proper alt text and captions for accessibility
  4. Gallery includes lightbox functionality for image viewing
- **Current Gallery Images**:
  - `petra-headshot.jpg` - Professional headshot
  - `petra-concert-lighting.jpg` - Concert with professional lighting
  - `petra-piano-elegant.jpg` - Elegant piano performance
  - `petra-club-performance.jpg` - Intimate club setting
  - `petra-festival-performance.jpg` - Large outdoor festival
  - `petra-acoustic-performance.jpg` - Intimate acoustic performance
  - `petra-professional-studio.jpg` - Professional studio photo
  - `petra-band-performance.jpg` - Backstage moment with band

## Development Notes

- Site is primarily German language (`de-DE`)
- Uses custom layouts that extend Ananke theme
- Mobile-first responsive design
- SEO-optimized with proper meta tags
- Custom JavaScript for mobile menu functionality
- No external dependencies beyond Hugo and theme

## Important File Locations

### Source Images
- `pics/` - Original source images with descriptions in `pics/description.md`
- Use `pics/description.md` to understand image content before adding to gallery

### Configuration Files
- `hugo.toml` - Main site configuration
- `.github/workflows/hugo-deploy.yml` - GitHub Actions deployment
- `.devcontainer/devcontainer.json` - Development container setup

### Custom Templates
- Gallery uses hardcoded HTML in `layouts/gallery/single.html`, not markdown
- Contact page has custom form styling in `layouts/contact/single.html`
- Homepage uses completely custom layout in `layouts/index.html`

## Best Practices

### Image Workflow
1. Review `pics/description.md` for image context
2. Copy images to `static/images/` with descriptive names
3. For gallery: Add to `layouts/gallery/single.html` template
4. For content: Reference as `/images/filename.jpg` in markdown

### Content Updates
- Keep content in German
- Maintain professional tone appropriate for musician services
- Update both content and corresponding templates when needed
