#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Make Custom Scripts Executable
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⚙️
# @raycast.packageName Custom Scripts
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Make all scripts in the scripts directory executable

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Make all .sh files in the scripts directory executable
find "$SCRIPT_DIR" -name "*.sh" -type f -exec chmod +x {} \;

echo "✅ All scripts are now executable" 