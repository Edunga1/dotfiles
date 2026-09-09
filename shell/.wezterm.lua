local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'

config.window_close_confirmation = 'NeverPrompt'

config.window_background_opacity = 0.7

return config
