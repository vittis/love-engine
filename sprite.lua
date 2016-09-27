Sprite         = {}
Sprite.__index = Sprite

function Sprite:_init(image, frameCount, frameTime)
  local self = setmetatable({}, Sprite)

  self.image        = love.graphics.newImage(image)
  self.scaleX       = 1
  self.scaleY       = 1
  self.frames       = {}
  self.frameCount    = frameCount or 1
  self.currentFrame = 1
  self.timeElapsed  = 0
  self.frameTime    = frameTime or 1

  for i=1, self.frameCount, 1 do
    self.frames[i] = love.graphics.newQuad(
      (i-1)*(self.image:getWidth() / self.frameCount),
      0,
      self.image:getWidth() / self.frameCount,
      self.image:getHeight(),
      self.image:getDimensions()
     )
  end

  return self
end

function Sprite:update(dt)
  self.timeElapsed = self.timeElapsed + dt

  if self.timeElapsed > self.frameTime then
    if self.currentFrame < self.frameCount then
      self.currentFrame = self.currentFrame + 1
    else
      self.currentFrame = 1
    end
    self.timeElapsed = 0
  end
end

function Sprite:draw(x, y, angle)
  love.graphics.draw(
    self.image,
    self.frames[self.currentFrame],
    x-self:getWidth()/2, y-self:getHeight()/2, angle,
    self.scaleX, self.scaleY
  )
end

function Sprite:getWidth()
  return self.image:getWidth()/self.frameCount
end

function Sprite:getHeight()
  return self.image:getHeight()
end
