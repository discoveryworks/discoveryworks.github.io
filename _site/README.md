# Discovery Works

🌸 Why use Discovery Works?
=============================
We built this site to showcase our software labs and share our exploration of how humans and computers work together. It's a place to discover the tools and experiments we create.

🌸🌸 Who benefits from this?
=============================
- Developers looking for interesting tools and utilities
- People interested in human-computer interaction
- Anyone curious about experimental software projects

🌸🌸🌸 What does it do?
=============================
Discovery Works is a Jekyll-based website that showcases our software projects across three distinct labs:
- **Vibe Coding Labs** - Development tools and utilities that enhance the coding experience
- **Pizza Labs** - Fun experimental projects where we explore playful interactions and game mechanics
- **NeuroSpicy Labs** - Accessibility and productivity tools designed with neurodivergent users in mind

The site uses Jekyll Collections to manage projects as individual markdown files, making it easy to add or update projects without touching HTML.

🌸🌸🌸🌸 How do I use it?
=============================

### Prerequisites
- Ruby and Bundler installed

### Development
```bash
# Install dependencies
bundle install

# Start local development server
bundle exec jekyll serve

# Visit http://localhost:4000
```

### Deployment
Push to `main` branch - GitHub Pages auto-deploys.

🌸🌸🌸🌸🌸 Extras
=============================

## Content Management

### Adding New Projects
Create a new file in `_projects/`:
```yaml
---
title: "Project Name"
description: "Brief description of what it does"
lab: "vibe-coding"  # or "pizza" or "neurospicy"
url: "https://github.com/you/project"
order: 7
---

Optional additional content about the project...
```

### Managing Labs
Edit `_data/labs.yml` to update lab titles and descriptions:
```yaml
lab-key:
  title: "Lab Display Name"
  description: "What this lab focuses on"
  intro: "Optional intro text"
```

### Blog Posts
Add posts to `_posts/` with filename format `YYYY-MM-DD-title.md`:
```yaml
---
layout: default
title: "Post Title"
date: 2025-01-15
categories: [development, tools]
---

Post content here...
```

Built with Jekyll and deployed via GitHub Pages.