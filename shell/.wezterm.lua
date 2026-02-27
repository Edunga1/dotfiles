local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'

config.window_close_confirmation = 'NeverPrompt'

config.keys = {
  { key = 'LeftArrow', mods = 'OPT', action = wezterm.action.SendKey { key = 'b', mods = 'ALT' } },
  { key = 'RightArrow', mods = 'OPT', action = wezterm.action.SendKey { key = 'f', mods = 'ALT' } },
}


return config
