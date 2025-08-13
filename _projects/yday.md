---
layout: project
title: "yday"
description: "Git retrospective analysis tool - smart views of recent development work"
lab: "neurospicy"
url: "https://github.com/discoveryworks/yday"
order: 2
status: "active"
---

Git retrospective analysis tool that provides semantic summaries of recent development work across multiple repositories.

## Why yday?

1. Still working your way through that first ☕️, and can't remember where you left off yesterday?
2. When work isn't explicitly planned, we can DRY up the tracking by using the commit itself to fill in a lot of the blanks.

## Features

- **Multi-repo analysis**: Gathers commits across multiple repositories in your workspace
- **Semantic summaries**: Meaningful chunks of work across commits
- **Multiple views**: Including Alastair timeline format
- **Smart time windows**: Monday morning shows Friday's work (not Sunday's nothing)
- **Shadow work tracking**: Retroactively adds unplanned work to your backlog

## Installation

```bash
npm install -g yday
```

## Usage

Show commits from the last work day:
```bash
yday
```

Alastair Method timeline:
```bash
yday --alastair
```

The tool started as a quick way to check recent work, fundamentally about **retrospective analysis** of development work.