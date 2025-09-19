#!/bin/bash

# Directory to save screenshots
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Filename with timestamp
FILE="$DIR/Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"

# Take full screenshot
grim "$FILE"

# Show notification (image first, then text)
notify-send -u normal -i "$FILE" "Screenshot!" "Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
