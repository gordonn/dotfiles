#!/bin/bash

# Kill all instances of waybar
killall waybar

# Wait for a moment to ensure waybar is terminated
sleep 0.5

# Restart waybar using hyprctl dispatch
hyprctl dispatch exec waybar
