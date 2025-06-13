#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Uninstall Cask
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🍺
# @raycast.argument1 { "type": "text", "placeholder": "cask name" }
# @raycast.packageName Brew
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Uninstall a Cask
# @raycast.author Mehdi Amrane
# @raycast.authorURL https://github.com/mehdiamrane

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed"
    exit 1
fi

# Check if the cask is installed
if ! brew list --cask "$1" &> /dev/null; then
    echo "❌ Cask '$1' is not installed"
    exit 1
fi

# Uninstall the cask
if brew uninstall --cask "$1"; then
    echo "✅ Successfully uninstalled $1"
else
    echo "❌ Failed to uninstall $1"
    exit 1
fi 