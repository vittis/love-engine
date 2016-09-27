gameScene.name = 'gameScene'
--Variaveis locais da cena
local sp2
local tileset
local tilemap
local t, shakeDuration, shakeMagnitude = 0, -1, 0
local startShake
local gameTime=0
--------------------------
function gameScene:enter(previous)
  if (engine.previousState.name ~= 'introScene') then
    engine:push(introScene)
  end
end
--------------------------
function gameScene:init()
  player = Player(0, 0)

  love.graphics.setBackgroundColor(255, 235, 205)

  sp2 = Sprite:_init('Assets/barco.png', 4, 0.3)

  tileset = Tileset:new('Assets/spritesheet.png', 64, 64)
  tilemap = Tilemap:new('Assets/mapteste.csv', tileset)
end
--------------------------
function gameScene:update(dt)
  gameTime = gameTime + dt

  player:update(dt)
  sp2:update(dt)
  if t < shakeDuration then
      t = t + dt
  end
end

function gameScene:draw()
  love.graphics.setColor(255, 255, 255)

  for i=0, tilemap.rows+1 do
    for j=0, tilemap.cols+1 do
      if (j==0 or j==tilemap.cols+1 or i ==0 or i==tilemap.rows+1) then
        tileset:draw(26, -64+(j*64), -64+(i*64))
      end
    end
  end
  tilemap:draw()

  if t < shakeDuration then
    local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
    local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
    love.graphics.translate(dx, dy)
  end
  sp2:draw(300, 300)
  player:draw()


  love.graphics.print(string.format("%1.0f",gameTime), 100, 100)

end

function gameScene:keypressed(k)
	if (k == 'space') then
		engine:switch(titleScene)
	end
  if (k == 'q') then
		startShake(0.2,1)
	end
end

startShake = function (duration, magnitude)
    t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
end
