engine = require('engine')

function love.load()
	engine:setup()
	engine:switch('titleScene')
end

function love.draw()
end

function love.update(dt)
end

function love.keypressed(k)
	if (k == 'x') then
		print(engine.stateName)
	end
	if (k == 'p' and engine.stateName~='pauseScene') then
		engine:push('pauseScene')
	end

end
