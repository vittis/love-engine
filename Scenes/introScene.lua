introScene.name = 'introScene'

local W, H
local camera
local alpha=0

function introScene:enter(from)
  W, H = love.graphics.getWidth(), love.graphics.getHeight()
  self.from = from

  camera = Camera(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0.9)
end

function introScene:update(dt)
  if (camera.scale<0.95) then
    camera:zoomTo(camera.scale+dt*0.025)
  elseif (camera.scale<1) then
    camera:zoomTo(camera.scale+dt*0.05)
  end
  if (camera.scale>1) then
    love.timer.sleep(0.1)
    engine:pop()
  end
  if alpha < 200 then
    alpha=alpha+dt*300
  end
end

function introScene:draw()
  camera:attach()
  self.from:draw()
  camera:detach()

  love.graphics.setColor(0, 0, 0, 200-alpha)
  love.graphics.rectangle('fill', 0, 0, W, H)

  love.graphics.rectangle('fill', 0, 0, W, H)

end


function introScene:keypressed(k)
    if k == 'f' then
        engine:pop()
    end
end
