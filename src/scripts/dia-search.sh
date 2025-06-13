#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Dia — New Tab Search
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ../assets/dia.png
# @raycast.argument1 { "type": "text", "placeholder": "Search query", "optional": false }
# @raycast.packageName Dia
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Open Dia browser in a new tab and perform a search

# Close Raycast window by simulating Escape key
osascript -e 'tell application "System Events" to key code 53' &>/dev/null

# Check if Dia is already running using osascript
if osascript -e 'tell application "System Events" to (name of processes) contains "Dia"' | grep -q "true"; then
    # Dia is already running, use shorter delay
    DELAY=0.25
else
    # Dia is not running, use longer delay
    DELAY=5
fi

# Open Dia and then use AppleScript to open new tab and perform search
open -a "Dia"

# Wait appropriate time for Dia to open/focus
sleep $DELAY

# Open new tab and perform search
osascript <<EOF
tell application "System Events"
    # Save current clipboard content
    set oldClipboard to the clipboard
    
    # Set the search query to clipboard
    set the clipboard to "$1"
    
    tell process "Dia"
        # Open new tab
        keystroke "t" using {command down}
        
        # Wait a moment for the new tab to open
        delay 0.25
        
        # Paste the search query
        keystroke "v" using {command down}
        
        # Wait a moment for the text to be pasted
        delay 0.25
        
        # Press Enter
        keystroke return
    end tell
    
    # Restore original clipboard content
    set the clipboard to oldClipboard
end tell
EOF
