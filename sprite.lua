sprite = {texture="noImage", quad, width=0, height=0, framecount=1, frameTime=1, currentFrame=0, timeElapsed=0, rows=1, cols=1}

function sprite:new(o, fileName, frameCount, frameTime, rows, cols)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.texture = love.graphics.newImage(fileName)
  self.width, self.height = self.texture:getDimensions()
  self.quad = love.graphics.newQuad(0, 0, self.width, self.height, self.texture:getDimensions())
  self.frameCount = frameCount or 1
  self.frameTime = frameTime or 1
  if(self.rows == 1) then
			self:setQuad(0,0, self.width/self.frameCount, self.height);
	else
			self:setQuad(0,0, self.width/self.cols, self.height/self.rows);
	end
  return o
end

function sprite:update(dt)
  self.timeElapsed = self.timeElapsed + dt
  if (self.timeElapsed > self.frameTime) then
    self.currentFrame = self.currentFrame + 1
    if (self.currentFrame == self.frameCount) then
      self.currentFrame = 0
    end
    self:setFrame(self.currentFrame)
    self.timeElapsed=0
  end
end

function sprite:setFrame(frame)
  self.currentFrame = frame
  local frameWidth = self.width/self.cols;
	local frameHeight = self.height/self.rows;
  if (self.rows == 1) then
    self:setQuad((self.width/self.frameCount)*self.currentFrame,0, self.width/self.frameCount, self.height)
  else
    self:setQuad((self.currentFrame%self.cols)*self.frameWidth, (self.currentFrame/self.cols)*self.frameHeight, self.frameWidth, self.frameHeight)
  end
end

function sprite:setQuad(a, b, width, height)
  self.quad = love.graphics.newQuad(a, b, width, height, self.texture:getDimensions())
end

function sprite:draw(x, y, r, sx, sy, ox, oy, kx, ky)
  love.graphics.draw(self.texture, self.quad, x, y, r, sx, sy, ox, oy, kx, ky)
end

--function sprite:draw(quad, x, y, r, sx, sy, ox, oy, kx, ky)
--  love.graphics.draw(self.texture, quad, x, y, r, sx, sy, ox, oy, kx, ky)
--end

return sprite
