pauseScene.name = 'pauseScene'

local W, H

function pauseScene:enter(from)
  W, H = love.graphics.getWidth(), love.graphics.getHeight()
  self.from = from
end

function pauseScene:draw()
  self.from:draw()
  love.graphics.setColor(0,0,0, 100)
  love.graphics.rectangle('fill', 0,0, W,H)
  love.graphics.setColor(255,255,255)
  love.graphics.printf('PAUSE', 0, H/2, W, 'center')
end

function pauseScene:keypressed(k)
    if k == 'p' then
        engine:pop()
    end
end
