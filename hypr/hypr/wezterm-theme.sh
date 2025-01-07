#!/bin/bash

# Directory where your Rofi colors.rasi file is located
ROFI_DIR="$HOME/.config/rofi/shared"
ROFI_COLORS_FILE="$ROFI_DIR/colors.rasi"

# WezTerm Lua config file
WEZTERM_LUA="$HOME/.wezterm.lua"

# Available themes
THEMES=("gruvbox" "onedark" "catppuccin")

# WezTerm color schemes
WEZTERM_SCHEMES=("Gruvbox dark, medium (base16)" "OneDark (base16)" "catppuccin-mocha")

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

# Update the Rofi colors.rasi file
sed -i "1s|@import \"~/.config/rofi/colors/.*\.rasi\"|@import \"~/.config/rofi/colors/${THEME}.rasi\"|" "$ROFI_COLORS_FILE"
echo "Switched Rofi theme to ${THEME}."

# Update the WezTerm color scheme
if [ "$THEME" == "gruvbox" ]; then
    sed -i "s|config.color_scheme =.*|config.color_scheme = 'Gruvbox dark, medium (base16)';|" "$WEZTERM_LUA"
elif [ "$THEME" == "onedark" ]; then
    sed -i "s|config.color_scheme =.*|config.color_scheme = 'OneDark (base16)';|" "$WEZTERM_LUA"
elif [ "$THEME" == "catppuccin" ]; then
    sed -i "s|config.color_scheme =.*|config.color_scheme = 'catppuccin-mocha';|" "$WEZTERM_LUA"
fi

# Reload WezTerm (optional: restart WezTerm, but this step may require the user to restart manually)
echo "Switched WezTerm theme to ${THEME}. Please restart WezTerm to apply the changes."
