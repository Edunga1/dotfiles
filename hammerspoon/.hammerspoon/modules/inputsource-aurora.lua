-- highlights the top if input source is changed

local boxes = {}
local inputEnglish = "com.apple.keylayout.ABC"
local box_height = 25
local box_alpha = 0.35
local GREEN = hs.drawing.color.osx_green

local function draw_rectangle(target_draw, x, y, width, height, fill_color)
  target_draw:setSize(hs.geometry.rect(x, y, width, height))
  target_draw:setTopLeft(hs.geometry.point(x, y))
  target_draw:setFillColor(fill_color)
  target_draw:setFill(true)
  target_draw:setAlpha(box_alpha)
  target_draw:setLevel(hs.drawing.windowLevels.overlay)
  target_draw:setStroke(false)
  target_draw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
  target_draw:show()
end

local function create_box(screen)
  local frame = screen:fullFrame()
  local box = hs.drawing.rectangle(hs.geometry.rect(0,0,0,0))
  draw_rectangle(box, frame.x, frame.y, frame.w, box_height, GREEN)
  table.insert(boxes, box)
end

local function reset_boxes()
  hs.fnutils.each(boxes, function(box)
    if box ~= nil then
      box:delete()
    end
  end)
  boxes = {}
end

local function show_aurora()
  reset_boxes()
  hs.fnutils.each(hs.screen.allScreens(), function(screen)
    create_box(screen)
  end)
end

local function hide_aurora()
  reset_boxes()
end

-- 입력소스 변경 이벤트에 이벤트 리스너를 달아준다
hs.keycodes.inputSourceChanged(function()
  hide_aurora()
  if hs.keycodes.currentSourceID() ~= inputEnglish then
    show_aurora()
  end
end)
