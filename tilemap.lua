local csv = require('csv')

Tilemap = {}
Tilemap.__index = Tilemap

function Tilemap:new(file, tileset)
  local self = setmetatable({}, Tilemap)

  self.tileset = tileset
  local f = csv.open(file)
  self.rows = 0
  self.cols = 0
  self.tileMatrix = {}

  for fields in f:lines() do
    self.rows = self.rows + 1
    for k,v in pairs(fields) do
      table.insert(self.tileMatrix, tonumber(fields[k]))
    end
  end
  self.cols = #self.tileMatrix/self.rows
  f:close()

  self.tilesetBatch = love.graphics.newSpriteBatch(tileset.atlas, self.rows * self.cols)

  for j=0, self.rows-1 do
    for i=0, self.cols-1 do
      self.tilesetBatch:add(self.tileset.tiles[self:At(i, j)], i*self.tileset.tileWidth, j*self.tileset.tileHeight)
    end
  end

  self.tilesetBatch:flush()

  return self
end

function Tilemap:At(x, y, z)
  z = z or 0
  local aux = x + y*self.cols + z*self.rows*self.cols

  return self.tileMatrix[aux+1];
end

function Tilemap:draw()
  love.graphics.draw(self.tilesetBatch)
end
