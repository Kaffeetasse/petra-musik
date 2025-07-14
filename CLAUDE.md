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
  - `contact.md` - Contact page with form
  - `gallery.md` - Image gallery
  - `imprint.md` - Legal imprint page
- **Layouts**: `layouts/` directory contains custom Hugo templates
  - `index.html` - Custom homepage layout with hero section and services
  - `_default/` - Base templates extending Ananke theme
  - `partials/` - Reusable template components
- **Static Assets**: `static/` directory for images, CSS, JS, icons
  - `css/custom.css` - Custom styling overrides
  - `js/main.js` - Mobile menu and navigation functionality
  - `images/` - Site images including favicon and petra.jpg
  - `icons/` - SVG icons for services (wedding, funeral, event)

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

## Development Notes

- Site is primarily German language (`de-DE`)
- Uses custom layouts that extend Ananke theme
- Mobile-first responsive design
- SEO-optimized with proper meta tags
- Custom JavaScript for mobile menu functionality
- No external dependencies beyond Hugo and theme