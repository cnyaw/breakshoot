local obj_exit = 8

Select = {}

Select.OnCreate = function(param)
  local label = {'Shoot', 'Study', 'Breakout'}
  param.o = {}
  local W = SCR_W/3;
  for i = 1, 3 do
    local o = GenScaleCharObj(i, 72)
    Good.SetPos(o, (i - 1) * W + (W - 72), SCR_H/2)
    param.o[i] = Good.GetChild(o, 0)
    Graphics.SetFont(Graphics.FIXED_FONT)
    local o0 = Good.GenTextObj(o, label[i], 2)
    Good.SetPos(o0, -20, 48)
  end
  Stge.RunScript('star')
end

Select.OnStep = function(param)
  if (Input.IsKeyPressed(Input.ESCAPE)) then
    Good.GenObj(-1, 9)                  -- Back to title.
    return
  end
  if (Input.IsKeyPressed(Input.LBUTTON)) then
    local x,y = Input.GetMousePos()
    if (PtInObj(x, y, obj_exit)) then
      Good.GenObj(-1, 9)                -- Back to title.
      return
    elseif (PtInObj(x, y, param.o[1], 1)) then
      Good.GenObj(-1, 0)
    elseif (PtInObj(x, y, param.o[2], 1)) then
      Good.GenObj(-1, 13)
    elseif (PtInObj(x, y, param.o[3], 1)) then
      Good.GenObj(-1, 19)
    end
  end
  if (nil == param.init_stars) then
    GenBkgndStars()
    param.init_stars = true
  end
end
