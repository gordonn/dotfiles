#!/bin/bash

# Directory where your Rofi colors.rasi file is located
ROFI_DIR="$HOME/.config/rofi/shared"

# Path to your colors.rasi file
COLORS_FILE="$ROFI_DIR/colors.rasi"

# Available themes
THEMES=("gruvbox" "onedark" "catppuccin")

# Check if the theme argument was provided
if [ -z "$1" ]; then
    echo "No theme specified. Available themes: ${THEMES[@]}"
    exit 1
fi

# Check if the provided theme is valid
THEME="$1"
if [[ ! " ${THEMES[@]} " =~ " ${THEME} " ]]; then
    echo "Invalid theme. Available themes: ${THEMES[@]}"
    exit 1
fi

# Update the @import line in colors.rasi to use the selected theme, keeping the ~ intact
sed -i "1s|@import \"~/.config/rofi/colors/.*\.rasi\"|@import \"~/.config/rofi/colors/${THEME}.rasi\"|" "$COLORS_FILE"

# No Rofi window popup, only edit the file
echo "Switched Rofi theme to ${THEME}."

