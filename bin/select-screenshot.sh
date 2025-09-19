#!/bin/bash

# Temp file for screenshot
FILE=$(mktemp /tmp/screenshot-XXXXXX.png)

# Run slurp to select area
GEOM=$(slurp)
if [ -z "$GEOM" ]; then
    # User pressed Esc, cancel
    rm -f "$FILE"
    exit 0
fi

# Take screenshot of selected area
grim -g "$GEOM" "$FILE"

# Copy to clipboard
wl-copy < "$FILE"

# Show notification only if screenshot was actually taken
notify-send -u normal -i "$FILE" "Screenshot!" "Screenshot saved to clipboard."

# Clean up temp file after short delay
( sleep 5 && rm -f "$FILE" ) &

