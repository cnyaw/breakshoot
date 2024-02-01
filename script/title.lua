local SW, SH = Good.GetWindowSize()
local CW, CH = 9, 18
local STR_TITLE = 'Touch to Start'

local function LoadStgeCharScript(c, W, H, script_name, ch)
  Graphics.FillRect(c, 0, 0, W, H, 0)
  Graphics.DrawText(c, 0, 0, ch, 1)
  local script = 'script ' .. script_name
  for x= 0, W-1 do
    for y= 0, H-1 do
      local p = Graphics.GetPixel(c, x, y)
      if (0 ~= p) then
        script = script .. string.format(' fire(title_char,$1+%d,$2+%d)', CW * x, CH * y)
      end
    end
  end
  script = script .. ' end'
  Stge.LoadScript(script)
end

local function LoadStgeTitleScript(c, W, H, script_name, text)
  for i = 1, #text do
    LoadStgeCharScript(c, W, H, 'char_' .. i, string.sub(text,i,i))
  end
  local script = string.format('script %s sleep(0.2)', script_name)
  local offsetx = (SW - #text * W * CW) / 2 + CW/2
  for i = 1, #text do
    local x = math.floor(offsetx + (i - 1) * W * CW - SW/2)
    script = script .. string.format(' fork(char_%d,%d,%d)', i, x, -100)
  end
  script = script .. ' sleep(1) userdata(1) fire(title_hint) end'
  Stge.LoadScript(script)
end

Blank = {}

Blank.OnStep = function(param)
  if (nil == param.k) then
    local loop = ArAddLoop()
    ArAddMoveTo(loop, 'Alpha', 1, 255)
    ArAddMoveTo(loop, 'Alpha', 0.2, 0)
    param.k = ArAddAnimator({loop})
  else
    ArStepAnimator(param, param.k)
  end
end

Title = {}

Title.OnCreate = function(param)
  param.is_ready = false
  param.obj_i = MyIncrementor()
  Stge.RunScript('star')
end

Title.OnStep = function(param)
  if (param.is_ready and Input.IsKeyPressed(Input.LBUTTON)) then
    Good.GenObj(-1, 24)                 -- Goto select.
  end
  if (nil == param.init_stars) then
    GenBkgndStars()
    param.init_stars = true
    local script_name = 'title_text'
    if (-1 == Stge.RunScript(script_name)) then
      local CW5x8,CH5x8 = 5,8
      local c = Graphics.GenCanvas(CW5x8, CH5x8)
      Graphics.SetFont(Graphics.FIXED_FONT)
      LoadStgeTitleScript(c, CW5x8, CH5x8, script_name, 'BREAKSHOOT')
      Graphics.KillCanvas(c)
      Graphics.SetFont(Graphics.SYSTEM_FONT)
      Stge.RunScript(script_name)
    end
  end
end

Title.OnNewParticle = function(param, p)
  if (nil == param.init_stars) then
    return
  end
  if (1 == Stge.GetUserData(p, 0)) then
    Graphics.SetFont(Graphics.FIXED_FONT)
    local o = Good.GenTextObj(-1, STR_TITLE, 3, 'Blank')
    Graphics.SetFont(Graphics.SYSTEM_FONT)
    local w = GetTextObjWidth(o)
    Good.SetPos(o, (SW - w)/2, 220)
    SetTextObjColor(o, 0xffffffff)
    param.is_ready = true
    return
  end
  local o = GenCharObj(param.obj_i())
  local oc = Good.GetChild(o, 0)
  ScaleToSize(oc, CW, CH)
  Stge.BindParticle(p, o)
end

Title.OnKillParticle = function(param, p)
  Good.KillObj(Stge.GetParticleBind(p))
end
