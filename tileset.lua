Tileset = {}
Tileset.__index = Tileset

function Tileset:new(fileName, tileWidth, tileHeight)
  local self = setmetatable({}, Tileset)

  self.atlas = love.graphics.newImage(fileName)
  self.tileWidth = tileWidth
  self.tileHeight = tileHeight
  self.rows = self.atlas:getHeight()/tileHeight;
  self.cols = self.atlas:getWidth()/tileWidth;
  self.tiles = {}

  for index=0, self.rows*self.cols do
    local i = math.floor(index/self.cols)
    local j = index%self.cols
    self.tiles[index] = love.graphics.newQuad(j*tileWidth,i*tileHeight, tileWidth, tileHeight, self.atlas:getDimensions())
  end

  return self
end

function Tileset:draw(index, x, y, r)
  if(index >= 0) then
      love.graphics.draw(self.atlas, self.tiles[index], x, y, r)
  end
end
