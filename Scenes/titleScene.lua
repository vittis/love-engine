titleScene.name = 'titleScene'

local x, y
local width, height = love.graphics.getDimensions()

--Gamestate callback
function titleScene:init()
	x, y = 50,50
	self.mainFont = love.graphics.newFont("KeepCalm.ttf", 60);
	love.graphics.setFont(self.mainFont);
	love.graphics.setBackgroundColor(255, 235, 205)
end

function titleScene:enter(previous)
end

function titleScene:update(dt)
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
	x=x+1
end

function titleScene:draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Jogo Bom", width/2-130, 0, 0)

  love.graphics.setColor(255, 0, 0)

	love.graphics.line(love.graphics.getWidth()/2, love.graphics.getHeight()/2, x, y, 50, 50)
end

function titleScene:keypressed(k)
	if (k == 'space') then
		engine:switch(gameScene)
	end
end
