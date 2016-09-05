Player         = {}
Player.__index = Player

setmetatable(Player, {
  __index = GameObject,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

local PLAYER_NAME     = "Vitu"
local PLAYER_IMAGE = "Assets/zeus.png"
local PLAYER_VELOCITY = 7
--local PLAYER_HEALTH   = 1
--local PLAYERSTATE_IDLE     = 0
--local PLAYERSTATE_WALKING  = 1
--local PLAYERSTATE_CLIMBING = 2
--local PLAYERSTATE_DEAD     = 3
--local GRAVITY = 350
--local PLAYER_FACINGRIGHT   = true

function Player:_init(x, y)
  GameObject:_init(x, y)

  self.name     = PLAYER_NAME
  self.sprite   = Sprite:_init(PLAYER_IMAGE, 4, 0.3)
  self.velocity = PLAYER_VELOCITY
  self.box      = Rect(x, y, self.sprite:getWidth(), self.sprite:getHeight())

end

function Player:update(dt)
  self.sprite:update(dt)
  --input
  if (love.keyboard.isDown('up')) then
    self.box.y = self.box.y - self.velocity
  end
  if (love.keyboard.isDown('down')) then
    self.box.y = self.box.y + self.velocity
  end
  if (love.keyboard.isDown('left')) then
    self.box.x = self.box.x - self.velocity
  end
  if (love.keyboard.isDown('right')) then
    self.box.x = self.box.x + self.velocity
  end
end

function Player:draw()
  self.sprite:draw(self.box.x, self.box.y)
end
