gameScene.name = 'gameScene'
local sp2
local tileset
local tilemap

local t, shakeDuration, shakeMagnitude = 0, -1, 0
Camera = require "hump.camera"
--gamestate callback
function gameScene:init()
  player = Player(0, 0)

  love.graphics.setBackgroundColor(255, 235, 205)

  sp2 = Sprite:_init('Assets/barco.png', 4, 0.3)

  tileset = Tileset:new('Assets/spritesheet.png', 64, 64)
  tilemap = Tilemap:new('Assets/mapteste.csv', tileset)

  camera = Camera(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0.9)
end

function gameScene:update(dt)
  player:update(dt)
  sp2:update(dt)
  if (camera.scale<1) then
    camera:zoomTo(camera.scale+dt*0.05)
  end
  
  if t < shakeDuration then
      t = t + dt
  end
end

function gameScene:draw()
  camera:attach()

  if t < shakeDuration then
    local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
    local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
    love.graphics.translate(dx, dy)
  end
  love.graphics.setColor(255, 255, 255)
  tilemap:draw()
  sp2:draw(300, 300)
  player:draw()

  camera:detach()
end

function gameScene:keypressed(k)
	if (k == 'space') then
		engine:switch(titleScene)
	end
  if (k == 'q') then
		startShake(0.2,1)
	end
end

function startShake(duration, magnitude)
    t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
end
--function titleScene:enter(previous)
--end
