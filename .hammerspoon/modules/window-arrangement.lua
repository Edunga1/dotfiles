local function move_win(xx, yy, ww, hh)
  return function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local max = win:screen():frame()
      f.x = max.x + (max.w/2) * xx
      f.y = max.y + (max.h/2) * yy
      f.w = max.w / ww
      f.h = max.h / hh
      win:setFrame(f)
  end
end

local left = 0
local right = 1

local top = 0
local mid = 1

local half_width = 2
local full_width = 1
local half_height = 2
local full_height = 1

local mod = {'control', 'shift'}
hs.hotkey.bind(mod, 'left', move_win(left, top, half_width, full_height))
hs.hotkey.bind(mod, 'right', move_win(right, top, half_width, full_height))
hs.hotkey.bind(mod, 'up', move_win(left, top, full_width, half_height))
hs.hotkey.bind(mod, 'down', move_win(left, mid, full_width, half_height))