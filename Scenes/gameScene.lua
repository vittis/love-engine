local gameScene = {}

local Engine = require('engine')

local x, y

function gameScene:init()
  x, y = 50, 50
  love.graphics.setBackgroundColor(255, 235, 205)
end

function gameScene:update()
  if (love.keyboard.isDown('up')) then
    y=y-10
  end
  if (love.keyboard.isDown('down')) then
    y=y+10
  end
  if (love.keyboard.isDown('left')) then
    x=x-10
  end
  if (love.keyboard.isDown('right')) then
    x=x+10
  end
end

function gameScene:draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle('fill', x, y, 200, 200)
end

function gameScene:keypressed(k)
	if (k == 'space') then
		engine:switch('titleScene')
	end
end

return gameScene
