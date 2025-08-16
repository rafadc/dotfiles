#!/bin/bash

# Check for required dependencies
if ! command -v aerospace &> /dev/null; then
    echo "Error: 'aerospace' command not found. Please install it first."
    exit 1
fi

# Ensure correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <monitor-name> <app-name> <window-title>"
    exit 1
fi

MONITOR_NAME="$1"
APP_NAME="$2"
WINDOW_TITLE="$3"

# Fetch the list of monitors and find the corresponding monitor ID
MONITOR_ID=$(aerospace list-monitors --json | jq -r --arg name "$MONITOR_NAME" '.[] | select(.["monitor-name"] == $name) | .["monitor-id"]')

# Check if a valid monitor ID was found
if [ -z "$MONITOR_ID" ]; then
    echo "Error: No monitor found with name '$MONITOR_NAME'"
    exit 1
fi

# Fetch the list of windows and find the window ID based on app name and window title
WINDOW_ID=$(aerospace list-windows --all --json | jq -r --arg app "$APP_NAME" --arg title "$WINDOW_TITLE" \
    '.[] | select(.["app-name"] == $app and .["window-title"] == $title) | .["window-id"]')

# Check if we found a matching window
if [ -z "$WINDOW_ID" ]; then
    echo "Error: No window found with app name '$APP_NAME' and title '$WINDOW_TITLE'"
    exit 1
fi

# Move the window to the specified monitor
echo "Moving window from app '$APP_NAME' with title '$WINDOW_TITLE' (ID: $WINDOW_ID) to monitor '$MONITOR_NAME'..."
aerospace move-node-to-monitor --window-id "$WINDOW_ID" "$MONITOR_NAME"

if [ $? -eq 0 ]; then
    echo "Window successfully moved!"
else
    echo "Error: Failed to move window."
fi
