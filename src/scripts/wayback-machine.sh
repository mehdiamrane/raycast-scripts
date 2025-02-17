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
osascript -e 'tell application "System Events" to key code 53'

# Open the URL in the default browser
open "$archive_url"