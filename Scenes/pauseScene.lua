pause = {}

engine = require('engine')
local W, H

function pause:enter(from)
  W, H = love.graphics.getWidth(), love.graphics.getHeight()
  self.from = from
end

function pause:draw()
  self.from:draw()
  love.graphics.setColor(0,0,0, 100)
  love.graphics.rectangle('fill', 0,0, W,H)
  love.graphics.setColor(255,255,255)
  love.graphics.printf('PAUSE', 0, H/2, W, 'center')
end

function pause:keypressed(k)
    if k == 'p' then
        return engine:pop()
    end
end

return pause
