---
layout: project
title: "🍕Pizza Ping"
description: "Network latency monitor. (But with more pizza.)"
lab: "pizza"
repo: "https://github.com/discoveryworks/pizza-ping"
download_url: "https://github.com/discoveryworks/pizza-ping/releases/download/v1.0.0/PizzaPing-v1.0.0.zip"
installation_instructions: "brew tap discoveryworks/pizzalabs && brew install --cask pizza-ping"
order: 6
status: "active"
---

Network latency monitor. (But with more pizza.)

A clean, ad-free macOS menu bar app that continuously monitors your network connection by pinging public DNS servers. Shows current latency with a pizza emoji and colored status indicator (🍕🟢/🟡/🔴/🚫).

## Installation

### Homebrew (Recommended)
```bash
brew tap discoveryworks/pizzalabs
brew install --cask pizza-ping
```

### Direct Download
[Download Pizza Ping v1.0.0](https://github.com/discoveryworks/pizza-ping/releases/download/v1.0.0/PizzaPing-v1.0.0.zip) (770KB)

Unzip and drag to Applications folder.

## Features
- Menu bar status with WiFi network name
- Automatic pings every 5 minutes
- Rotating DNS servers (Google, Cloudflare, Quad9)
- CSV history logging
- Requires macOS 15.1+

Built with Swift/SwiftUI. Free and open source.
