-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the config
local config = wezterm.config_builder()

config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 12
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

config.colors = {
  foreground = '#fbf1c7',
  background = '#282828',
  cursor_bg = '#665c54',
  cursor_fg = '#665c54',
  cursor_border = '#665c54',
  selection_fg = '#282828',
  selection_bg = '#665c54',

  split = '#665c54',

  ansi = {'#1d2021', '#cc241d', '#b8bb26', '#fabd2f', '#458588', '#b16286', '#83a598', '#bdae93',},
  brights = {'#665c54', '#fb4934', '#b8bb26', '#fabd2f', '#458588', '#b16286', '#8ec07c', '#fbf1c7'},
}

config.window_padding = {
  left = "20px",
  right = "18px",
  top = "20px",
  bottom = "15px",
}

return config
