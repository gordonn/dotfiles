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
config.enable_wayland = false

config.color_scheme = 'Gruvbox dark, medium (base16)';

config.window_padding = {
	left = "24pt",
	right = "21pt",
	top = "24pt",
	bottom = "24pt",
}

-- Event handler to change padding when Neovim is the active application
wezterm.on("update-right-status", function(window, pane)
	local process_name = pane:get_foreground_process_name()

	-- Check if the process is Neovim
	if process_name and process_name:match("nvim") then
		window:set_config_overrides({
			window_padding = {
				left = "24pt",
				right = "21pt",
				top = "24pt",
				bottom = "10pt", -- Adjust the padding here for Neovim
			},
		})
	else
		-- Revert to default padding when not in Neovim
		window:set_config_overrides({
			window_padding = {
				left = "24pt",
				right = "21pt",
				top = "24pt",
				bottom = "24pt",
			},
		})
	end
end)

return config
