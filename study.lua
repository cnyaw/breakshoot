local LINES_PER_PAGE = 5
local CHARS_PER_LINE = 8
local CHARS_PER_PAGE = LINES_PER_PAGE * CHARS_PER_LINE
local ZHUYIN_SZ = 8

local obj_left_touch_area
local obj_right_touch_area
local obj_exit = 17
local dummy_chars = 18
local dummy_info = 25

local function GetZhuyinAccent(text)
  if (0 ~= #text % 3) then
    local a,b = string.byte(text, #text - 1, #text)
    local accent_char = string.char(a,b)
    if ('˙' == accent_char) then
      return 2                          -- Draw accent symbol on top of zhuyin.
    else
      return 1                          -- Draw accent symbol on middle of zhuyin.
    end
  else
    return 0                            -- No accent.
  end
end

local function GenCharZhuyin(o, index)
  local text = GetCharZhuyin(index)
  Graphics.SetAntiAlias(0)
  local o = Good.GenTextObj(o, text, ZHUYIN_SZ)
  Graphics.SetAntiAlias(1)
  Good.SetPos(o, CHAR_SZ, 0)
  local accent = GetZhuyinAccent(text)
  local nc = Good.GetChildCount(o)
  if (0 ~= accent) then
    nc = nc - 1
  end
  local offsety = (CHAR_SZ - nc * ZHUYIN_SZ) / 2
  for i = 0, nc - 1 do
    Good.SetPos(Good.GetChild(o, i), 0, offsety + i * (2 + ZHUYIN_SZ))
  end
  if (1 == accent) then
    Good.SetPos(Good.GetChild(o, nc), 1.5 * ZHUYIN_SZ, CHAR_SZ / 2)
  elseif (2 == accent) then
    Good.SetPos(Good.GetChild(o, nc), ZHUYIN_SZ/2, offsety - ZHUYIN_SZ)
  end
end

local function GenCharsOfLine(index, x)
  local offsety = (SCR_H - (CHARS_PER_LINE * CHAR_SZ + CHAR_SZ/2)) / 2
  local y = AutoIncrementor(offsety - CHAR_SZ, CHAR_SZ)
  for i = 1, CHARS_PER_LINE do
    local char_index = i + index - 1
    local o = GenCharObj(char_index)
    Good.AddChild(dummy_chars, o)
    GenCharZhuyin(o, char_index)
    if (5 == i) then
      y(CHAR_SZ/2)
    end
    Good.SetPos(o, x, y())
  end
end

local function GenCharsOfPage(index)
  Good.KillAllChild(dummy_chars)
  local LINE_W = 2 * CHAR_SZ
  local offsetx = SCR_W - (SCR_W - LINES_PER_PAGE * LINE_W) / 2
  local x = AutoIncrementor(offsetx + CHAR_SZ/2, -LINE_W)
  for i = 1, LINES_PER_PAGE do
    GenCharsOfLine(index + (i - 1) * CHARS_PER_LINE, x())
  end
end

local function GenNextPage(param)
  GenCharsOfPage(param.i)
  Good.KillAllChild(dummy_info)
  local curr_page = 1 + math.floor(param.i / CHARS_PER_PAGE)
  local total_page = math.floor(MAX_CHAR / CHARS_PER_PAGE)
  Graphics.SetFont(Graphics.FIXED_FONT)
  local o = Good.GenTextObj(dummy_info, string.format('%d / %d', curr_page, total_page), 2)
  SetTextObjColor(o, 0xff808080)
  -- Set arrow btns visibility.
  if (MAX_CHAR > param.i + CHARS_PER_PAGE) then
    Good.SetVisible(param.l, Good.VISIBLE)
  else
    Good.SetVisible(param.l, Good.INVISIBLE)
  end
  if (0 < param.i - CHARS_PER_PAGE) then
    Good.SetVisible(param.r, Good.VISIBLE)
  else
    Good.SetVisible(param.r, Good.INVISIBLE)
  end
end

Study = {}

Study.OnCreate = function(param)
  obj_left_touch_area, obj_right_touch_area = FindTouchAreaObj(param._id)
  Stge.RunScript('star')
  Graphics.SetFont(Graphics.SYSTEM_FONT)
  param.l = Good.GenTextObj(obj_left_touch_area, '<', 32)
  Good.SetPos(param.l, 16, 176)
  param.r = Good.GenTextObj(obj_right_touch_area, '>', 32)
  Good.SetPos(param.r, 96, 176)
  param.i = 1
  GenNextPage(param)
end

Study.OnStep = function(param)
  if (Input.IsKeyPressed(Input.ESCAPE)) then
    Good.GenObj(-1, 24)                 -- Back to select.
    return
  end
  if (Input.IsKeyPressed(Input.LBUTTON)) then
    local x,y = Input.GetMousePos()
    if (PtInObj(x, y, obj_exit)) then
      Good.GenObj(-1, 24)               -- Back to select.
      return
    elseif (PtInObj(x, y, obj_left_touch_area)) then
      if (MAX_CHAR > param.i + CHARS_PER_PAGE) then
        param.i = param.i + CHARS_PER_PAGE
        GenNextPage(param)
      end
    elseif (PtInObj(x, y, obj_right_touch_area)) then
      if (0 < param.i - CHARS_PER_PAGE) then
        param.i = param.i - CHARS_PER_PAGE
        GenNextPage(param)
      end
    end
  end
  if (nil == param.init_stars) then
    GenBkgndStars()
    param.init_stars = true
  end
end
