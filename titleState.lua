local titleState = {}

local x, y
local width, height = love.graphics.getDimensions()

function titleState:init()
	titleState.mainFont = love.graphics.newFont("KeepCalm.ttf", 60);

	love.graphics.setFont(self.mainFont);
	love.graphics.setBackgroundColor(255, 235, 205)
end

function titleState.update()
	x, y = love.mouse.getPosition()
end

function titleState.draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Jogo Bom", width/2-130, 0, 0)

  love.graphics.setColor(255, 0, 0)

	love.graphics.line(love.graphics.getWidth()/2, love.graphics.getHeight()/2, x, y)
end

return titleState
