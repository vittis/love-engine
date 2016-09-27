--Global table
engine = require('engine')

gameScene = {}
titleScene = {}
pauseScene = {}
introScene = {}
--cenas
require('Scenes.titleScene')
require('Scenes.gameScene')
require('Scenes.pauseScene')
require('Scenes.introScene')
--classes
require('sprite')
require('tileset')
require('tilemap')
require('rect')
require('gameobject')
require('player')
Camera = require "hump.camera"

function love.load()
  engine:init()
  engine:switch(gameScene)
end

function love.draw()
end

function love.update(dt)

end

function love.keypressed(k)
  if (k == 'escape') then
    love.event.quit()
  end
  if (k == 'p' and engine.currentState.name ~= 'pauseScene') then
    engine:push(pauseScene)
  end
end
