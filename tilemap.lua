local csv = require('csv')

tilemap = {tileset, tileMatrix={}, rows=0, cols=0}

function tilemap:new(o, file,  tileset)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.tileset = tileset

  local f = csv.open('Assets/map.csv')
  local tileMatrix = {}

  for fields in f:lines() do
    self.rows = self.rows + 1
    for k,v in pairs(fields) do
      table.insert(self.tileMatrix, tonumber(fields[k]))
    end
  end
  self.cols = #self.tileMatrix/self.rows
  f:close()

  return o
end

function tilemap:at(x, y, z)
  z = z or 0
  local aux = x+1 + y*self.rows + z*self.rows*self.cols
  --print(self.tileMatrix[aux])
  return self.tileMatrix[aux];
end

function tilemap:draw()
		for j=0, self.cols-1 do
			for i=0, self.rows-1 do
        self.tileset:draw(self:at(i, j), i*self.tileset.tileWidth, j*self.tileset.tileHeight)
         --tileSet->Render(At(i,j,k), cameraX + i*tileSet->GetTileWidth(), cameraY + j*tileSet->GetTileHeight());
			end
		end
end


return tilemap
