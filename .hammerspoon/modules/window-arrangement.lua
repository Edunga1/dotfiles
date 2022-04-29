-- ctrl + shift + direction keys to arrange windows

local function move_win(xx, yy, ww, hh)
  -- unused
  function maximize(old, new, max)
    if new ~= old then return end
    new.w = max.w
    new.h = max.h
  end
  function moveWindowToNextMonitor(old, new)
    if new ~= old then return false end
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
    return true
  end
  return function()
    local win = hs.window.focusedWindow()
    local old = win:frame()
    local new = win:frame()
    local max = win:screen():frame()
    new.x = math.floor(max.x + (max.w/2) * xx)
    new.y = math.floor(max.y + (max.h/2) * yy)
    new.w = math.floor(max.w / ww)
    new.h = math.floor(max.h / hh)

    if moveWindowToNextMonitor(old, new) then return end

    win:setFrame(new)
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
