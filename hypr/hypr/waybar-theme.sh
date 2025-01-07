#!/bin/bash

# Directory where your Waybar style.css is located
WAYBAR_DIR="$HOME/.config/waybar"

# Path to your style.css file
STYLE_FILE="$WAYBAR_DIR/style.css"

# Themes directory where all your theme CSS files are stored
THEMES_DIR="$WAYBAR_DIR/themes"

# Available themes
THEMES=("gruvbox" "tokyonight" "onedark")

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

# Update the first line in style.css to use the selected theme
sed -i "1s|@import url('themes/.*\.css');|@import url('themes/${THEME}.css');|" "$STYLE_FILE"

# Reload Waybar using hyprctl
hyprctl reload

echo "Switched Waybar theme to ${THEME}."
