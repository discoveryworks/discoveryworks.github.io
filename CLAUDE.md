# CLAUDE.md - Guidelines for Discovery Works Website

## Build Commands
- **Local preview**: `npx http-server` or `python -m http.server`
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