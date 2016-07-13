local titleState = {}

function state:init()

end

function state.update()
	x, y = love.mouse.getPosition()
end

function state.draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Jogo Bom", width/2-130, 0, 0)

    love.graphics.setColor(255, 0, 0)

	love.graphics.line(love.graphics.getWidth()/2, love.graphics.getHeight()/2, x, y)
end

return state
