local obj_paddle = 4
local obj_left_touch_area
local obj_right_touch_area
local obj_player = 5
local obj_exit = 16
local dummy_bounce_blocks = 29

local myclock = 0
local myscore = 0                       -- Hit count of bullets.
local total_bullets = 0

local function GenInfoText(parent, x, y, s, size, color)
  size = size or 2
  color = color or 0xff808080
  local o = Good.GenTextObj(parent, s, size)
  SetTextObjColor(o, color)
  Good.SetPos(o, x, y)
end

local function UpdateStateInfo()
  Good.KillAllChild(obj_right_touch_area)
  local dummy = Good.GenDummy(obj_right_touch_area)
  Graphics.SetFont(Graphics.FIXED_FONT)
  local y = AutoIncrementor(0, 16)
  GenInfoText(dummy, 0, y(), string.format('T%d', math.floor(myclock/60)))
  GenInfoText(dummy, 0, y(), string.format('S%d/%d', myscore, total_bullets))
  GenInfoText(dummy, 0, y(), string.format('A%d', Stge.GetTaskCount()))
  GenInfoText(dummy, 0, y(), string.format('B%d', Stge.GetParticleCount()))
  GenInfoText(dummy, 0, y(), string.format('O%d', Good.GetChildCount(Good.GetLevelId())))
end

local function IsBoss(p)
  return 1000 == Stge.GetUserData(p, 2)
end

local function IsBullet(p)
  return 0 == Stge.GetUserData(p, 0)
end

local function IsObj(p)
  return 300 == Stge.GetUserData(p, 0)
end

local function HittestParticles(param)
  local hit = false
  local p = Stge.GetFirstParticle()
  while (-1 ~= p) do
    local nextp = Stge.GetNextParticle(p)
    if (IsBullet(p)) then
      local o = HittestParticleByPaddle(param, p, obj_paddle, 'BouncingBlock')
      if (-1 ~= o) then
        Good.AddChild(dummy_bounce_blocks, o)
        hit = true
        myscore = myscore + 1
      end
    end
    p = nextp
  end
  if (hit) then
    UpdateStateInfo()
  end
end

local function HittestObjectByBounceBlocks(p)
  local px, py = Stge.GetPos(p)
  local sz = CHAR_SZ
  if (not IsObj(p)) then
    sz = CHAR_SZ/2
  end
  local nc = Good.GetChildCount(dummy_bounce_blocks)
  for i = 0, nc - 1 do
    local o = Good.GetChild(dummy_bounce_blocks, i)
    local x, y = Good.GetPos(o)
    if (PtInRect(x, y, px - sz/2, py - sz/2, px + sz/2, py + sz/2)) then
      Good.KillObj(o)
      return true
    end
  end
  return false
end

local function HittestObjects(param)
  local p = Stge.GetFirstParticle()
  while (-1 ~= p) do
    local nextp = Stge.GetNextParticle(p)
    if (IsObj(p) and HittestObjectByBounceBlocks(p)) then
      GenHitFxByParticle(p)
      local hp = Stge.GetUserData(p, 1)
      hp = hp - 1
      if (0 >= hp) then
        Stge.KillParticle(p)
      else
        Stge.SetUserData(p, 1, hp)
      end
    end
    p = nextp
  end
end

BouncingBlock = {}

BouncingBlock.OnStep = function(param)
  if (DefaultBouncingBlockOnStep(param)) then
    UpdateStateInfo()
  end
end

Main = {}

Main.OnCreate = function(param)
  obj_left_touch_area, obj_right_touch_area = FindTouchAreaObj(param._id)
  Stge.SetPlayer(obj_player)
  Stge.RunScript('star')
  param.obj_i = MyIncrementor()
  param.bullet_i = MyIncrementor()
  param.deltax = 0
  myclock = 0
  myscore = 0
  total_bullets = 0
end

Main.OnStep = function(param)
  if (Input.IsKeyPressed(Input.ESCAPE)) then
    Good.GenObj(-1, 24)                 -- Back to select.
    return
  end
  if (nil == param.init_stars) then
    param.stars = GenBkgndStars()
    SetTopmost(obj_paddle)
    Stge.RunScript('stage1')
    local x, y = Good.GetPos(obj_paddle)
    MoveStars(param.stars, x)
    param.init_stars = true
  end
  if (Input.IsKeyPressed(Input.LBUTTON)) then
    local x,y = Input.GetMousePos()
    if (PtInObj(x, y, obj_exit)) then
      Good.GenObj(-1, 24)               -- Back to select.
      return
    end
  end
  MovePaddle(param, obj_paddle, obj_left_touch_area, obj_right_touch_area)
  -- Hittest.
  HittestParticles(param)
  HittestObjects(param)
  -- Increment total clock.
  myclock = myclock + 1
  if (0 == (myclock % 60)) then
    UpdateStateInfo()
  end
end

Main.OnNewParticle = function(param, p, i)
  if (nil == param.init_stars) then
    return
  end
  local o
  if (IsEffect(p)) then
    o = GenColorObj(-1, 1, 1, 0xffffffff)
  else
    local sz = CHAR_SZ
    local i
    if (IsObj(p)) then
      if (IsBoss(p)) then
        i = math.random(MAX_CHAR)
      else
        i = param.obj_i()
      end
    else
      sz = CHAR_SZ/2
      i = param.bullet_i()
      total_bullets = total_bullets + 1
    end
    o = GenScaleCharObj(i, sz)
  end
  Stge.BindParticle(p, o, i)
  UpdateStateInfo()
end

Main.OnKillParticle = function(param, p, i)
  Good.KillObj(Stge.GetParticleBind(p, i))
  UpdateStateInfo()
end
