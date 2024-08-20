-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the config
local config = wezterm.config_builder()

config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 12
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.line_height = 1.1
config.audible_bell = "Disabled"

config.colors = {
	foreground = "#fbf1c7",
	background = "#282828",
	cursor_bg = "#665c54",
	cursor_fg = "#665c54",
	cursor_border = "#665c54",
	selection_fg = "#282828",
	selection_bg = "#665c54",

	split = "#665c54",

	ansi = { "#282828", "#cc241d", "#b8bb26", "#fabd2f", "#458588", "#b16286", "#83a598", "#32302f" },
	brights = { "#665c54", "#fb4934", "#b8bb26", "#fabd2f", "#458588", "#b16286", "#8ec07c", "#fbf1c7" },
}

config.window_padding = {
	left = "14pt",
	right = "15pt",
	top = "17pt",
	bottom = "14pt",
}

return config
