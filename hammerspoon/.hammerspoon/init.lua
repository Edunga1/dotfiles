hs.hotkey.bind({'cmd', 'shift'}, 'r', function() hs.reload() end)

-- Generate the annotations for HammerSpoon modules on load
-- path: ~/.hammerspoon/Spoons/EmmyLua.spoon/annotations
-- ref. https://www.hammerspoon.org/Spoons/EmmyLua.html
hs.loadSpoon('EmmyLua')

require('modules.inputsource-aurora')
require('modules.window-resize')

-- Initialize the window manager
local hyper = {'ctrl', 'shift'}
hs.loadSpoon('MiroWindowsManager')
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, 'up'},
  right = {hyper, 'right'},
  down = {hyper, 'down'},
  left = {hyper, 'left'},
  fullscreen = {hyper, 'f'},
  nextscreen = {hyper, 'n'}
})
