---
layout: project
title: "Pizza Ping"
description: "Network latency monitor. (But with more pizza.)"
icon: "/assets/projects/pizza-ping/icon-120.png"
icon_2x: "/assets/projects/pizza-ping/icon-180.png"
lab: "pizza"
repo: "https://github.com/discoveryworks/pizza-ping"
download_url: "https://github.com/discoveryworks/pizza-ping/releases/download/v1.0.0/PizzaPing-v1.0.0.zip"
installation_instructions: "brew tap discoveryworks/pizzalabs && brew install --cask pizza-ping"
order: 6
status: "active"
---

Network latency monitor available on multiple platforms. (But with more pizza.)

## Pizza Ping for Mac
A clean, ad-free macOS menu bar app that continuously monitors your network connection by pinging public DNS servers. Shows current latency with a pizza emoji and colored status indicator (🍕🟢/🟡/🔴/🚫).

Install via Homebrew, or download the Lite version (no wifi name) on the Mac App Store.

## Pizza Ping iOS (with Widget and Lock Screen widget)
Use this iOS app to quickly check your network connection by pinging public DNS servers. Includes Widget and Lock Screen widget for continuous monitoring.

## Pizza Ping WatchOS (with Complication)
Use this Apple Watch app to quickly check your network connection by pinging public DNS servers. Includes a Complication for continuous monitoring.
 WatchOS (with Complication)

---

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
