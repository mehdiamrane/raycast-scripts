#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Wayback Machine
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🏛️
# @raycast.argument1 { "type": "text", "placeholder": "url" }
# @raycast.packageName Internet Archive
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description View a URL in the Internet Archive's Wayback Machine

# Construct the Wayback Machine URL
archive_url="https://web.archive.org/web/*/$1"

# Close Raycast window by simulating Escape key
# Note: key code 53 corresponds to the Escape key in macOS
# This is needed to automatically close the Raycast window after execution
if ! osascript -e 'tell application "System Events" to key code 53' &>/dev/null; then
    echo "Failed to close Raycast window automatically"
    # Continue execution even if window closing fails
fi

# Open the URL in the default browser
if ! open "$archive_url"; then
    echo "Failed to open URL in browser"
    exit 1
fi