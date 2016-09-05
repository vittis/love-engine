gameScene.name = 'gameScene'
local sp2
local tileset
local tilemap
--gamestate callback
function gameScene:init()
  player = Player(0, 0)

  love.graphics.setBackgroundColor(255, 235, 205)

  sp2 = Sprite:_init('Assets/barco.png', 4, 0.3)

  tileset = Tileset:new('Assets/spritesheet.png', 64, 64)
  tilemap = Tilemap:new('Assets/mapteste.csv', tileset)
end
function titleScene:enter(previous)
end
function gameScene:draw()
  love.graphics.setColor(255, 255, 255)
  tilemap:draw()
  sp2:draw(200, 150)

  player:draw()
end

function gameScene:update(dt)
  player:update(dt)
  sp2:update(dt)
end

function gameScene:keypressed(k)
	if (k == 'space') then
		engine:switch(titleScene)
	end
end
