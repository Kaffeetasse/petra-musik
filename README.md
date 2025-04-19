# Petra - Musikerin Website

A personal website for Petra, a professional musician from Bempflingen, Germany, specializing in musical accompaniment for weddings, funerals, and events.

## Project Overview

This is a static website built with [Hugo](https://gohugo.io/), using the [Ananke](https://github.com/theNewDynamic/gohugo-theme-ananke) theme. The site is primarily in German and features a modern, light, and conservative design suitable for a professional musician.

## Site Structure

- **Home Page**: Introduction to Petra and her services
- **Contact Page**: Contact information and form
- **Gallery Page**: Images of performances and events
- **Imprint Page**: Legal information

## Technologies Used

- [Hugo](https://gohugo.io/) - Static site generator
- [Ananke Theme](https://github.com/theNewDynamic/gohugo-theme-ananke) - Hugo theme

## Setup Instructions

### Prerequisites

- [Hugo](https://gohugo.io/getting-started/installing/) (Extended version recommended)
- Git

### Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd petra
   ```

2. Initialize and update the theme submodule:
   ```bash
   git submodule update --init --recursive
   ```

3. Start the Hugo development server:
   ```bash
   hugo server -D
   ```

4. Open your browser and navigate to http://localhost:1313

### Building for Production

To build the site for production:

```bash
hugo --minify
```

The generated static files will be in the `public` directory, ready to be deployed to any static hosting service.

### Deployment to GitHub Pages

This repository includes a GitHub Actions workflow that automatically builds and deploys the site to GitHub Pages when changes are pushed to the main branch.

To set up GitHub Pages deployment:

1. Push the repository to GitHub
2. Go to your repository's Settings
3. Navigate to Pages section
4. Under "Build and deployment", select "GitHub Actions" as the source
5. The site will be automatically built and deployed when you push to the main branch

## Customization

- **Content**: Edit files in the `content/` directory
- **Images**: Add image files to `static/images/`
- **Styling**: Customize styles in `assets/` or through Hugo parameters in `hugo.toml`

