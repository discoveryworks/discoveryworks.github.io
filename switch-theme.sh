#!/bin/bash

# Theme switcher script for Discovery Works
# Usage: ./switch-theme.sh [kross|minimal-mistakes|vonge]

if [ $# -eq 0 ]; then
    echo "Usage: $0 [kross|minimal-mistakes|vonge]"
    echo "Current theme: $(grep 'current_theme:' _config.yml | cut -d' ' -f2)"
    exit 1
fi

THEME=$1

if [ "$THEME" != "kross" ] && [ "$THEME" != "minimal-mistakes" ] && [ "$THEME" != "vonge" ]; then
    echo "Error: Theme must be 'kross', 'minimal-mistakes', or 'vonge'"
    exit 1
fi

# Set the remote theme based on selection
case $THEME in
    "kross")
        REMOTE_THEME="themefisher/kross-jekyll"
        ;;
    "minimal-mistakes")
        REMOTE_THEME="mmistakes/minimal-mistakes"
        ;;
    "vonge")
        REMOTE_THEME="CloudCannon/vonge-jekyll-bookshop-template"
        ;;
esac

# Update _config.yml
sed -i.bak "s/current_theme: .*/current_theme: $THEME  # Options: 'kross', 'minimal-mistakes', 'vonge'/" _config.yml
sed -i.bak "s|remote_theme: .*|remote_theme: \"$REMOTE_THEME\"|" _config.yml

echo "✅ Theme switched to: $THEME"
echo "📦 Remote theme: $REMOTE_THEME"
echo "🔄 Run 'bundle install' then restart Jekyll server to see changes"