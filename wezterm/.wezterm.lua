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

config.color_scheme = "Gruvbox dark, medium (base16)"

config.window_padding = {
	left = "16pt",
	right = "12pt",
	top = "18pt",
	bottom = "15pt",
}

return config
