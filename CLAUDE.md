# CLAUDE.md - Guidelines for Discovery Works Website

## Build Commands
- **Install dependencies**: `bundle install`
- **Local preview**: `bundle exec jekyll serve` (Jekyll site available at http://localhost:4000)
- **Build**: `bundle exec jekyll build`
- **Deploy**: Push to `main` branch (GitHub Pages auto-deploys)

## Style Guidelines

### HTML
- Use semantic HTML5 elements
- Indent with 2 spaces
- Lowercase element names and attributes
- Use double quotes for attribute values

### CSS
- Use CSS variables for colors (`--color-*`)
- Follow BEM naming convention for classes
- Mobile-first responsive design with media queries
- Keep style blocks organized by component/section

### Assets
- Use SVG for logos and icons when possible
- Optimize images before committing
- Follow naming convention: lowercase with hyphens

### Git Workflow
- Write descriptive commit messages
- Create feature branches from `main`
- Keep commits small and focused
- Test locally before pushing

## Creating Standalone Pages

To create standalone pages (like privacy policies, terms of service, etc.) that are accessible by URL but not in navigation:

### 1. Create the page file
- Create a `.md` file in the root directory (e.g., `privacy.md`, `terms.md`)
- Use the filename as the URL path (e.g., `privacy.md` → `/privacy/`)

### 2. Add front matter
```yaml
---
layout: default
title: "Page Title"
permalink: /url-path/
---
```

### 3. Page structure
- Use standard markdown for content
- Include proper headings hierarchy (start with `#`)
- Add last updated date if appropriate: `{{ site.time | date: "%B %d, %Y" }}`

### 4. Navigation control
- Pages are automatically excluded from navigation (nav links are in `_config.yml`)
- To add to navigation, uncomment and modify `nav_links` in `_config.yml`
- Use descriptive URLs (`/privacy/`, `/terms/`, `/contact/`)

### 5. Common standalone pages
- Privacy policies: `/privacy/`
- Terms of service: `/terms/`
- Contact pages: `/contact/`
- About pages: `/about/`