local function resize_win(width, height)
  return function()
    print(width, height)
    local win = hs.window.focusedWindow()
    local new = win:frame()
    local max = win:screen():frame()

    new.w = new.w + width
    new.h = new.h + height

    win:setFrame(new)
  end
end

local left = -50
local right = 50
local top = -100
local down = 100

local mod = {'ctrl', 'shift', 'option'}
hs.hotkey.bind(mod, 'left', resize_win(left, 0))
hs.hotkey.bind(mod, 'right', resize_win(right, 0))
hs.hotkey.bind(mod, 'up', resize_win(0, top))
hs.hotkey.bind(mod, 'down', resize_win(0, down))
