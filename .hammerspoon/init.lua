hs.hotkey.bind({'cmd', 'shift'}, 'r', function() hs.reload() end)

require('modules.inputsource-aurora')
require('modules.window-resize')

-- Initialize the window manager
local hyper = {"ctrl", "shift"}
hs.loadSpoon("MiroWindowsManager")
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"},
  nextscreen = {hyper, "n"}
})
