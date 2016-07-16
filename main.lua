engine = require('engine')
local tileSet = require('tileset')
local tileMap = require('tilemap')
local Sprite = require('sprite')

function love.load()

	essafera = Sprite:new(nil, 'Assets/walk.png', 37, 0.01)
	bixao = Sprite:new(nil, 'Assets/andando.png', 37, 0.01)

	--tileset = tileSet:new(nil, 'Assets/spritesheet.png', 64, 64)

	--tilemap = tileMap:new(nil, 'Assets/map.csv', tileset)
	--love.window.setMode(tilemap.rows*tilemap.tileset.tileWidth, tilemap.cols*tilemap.tileset.tileHeight)
	--engine:setup()
	--engine:switch('titleScene')
end

function love.draw()
	bixao:draw(0,0)
	essafera:draw(200,200)
	--tileset:draw(0,0,0)
	--tileset:draw(1,64,0)
	--tileset:draw(2,64+64,0)
	--tilemap:draw()
end

function love.update(dt)
	bixao:update(dt)
end

function love.keypressed(k)
	if (k == 'escape') then
		love.event.quit()
	end
	if (k == 'p' and engine.stateName~='pauseScene') then
		engine:push('pauseScene')
	end

end
