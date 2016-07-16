tileset = {tileWidth=0, tileHeight=0, fileName="empty", tileset, rows, cols}

local Sprite = require('sprite')

function tileset:new(o, fileName, tileWidth, tileHeight)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.tileset = Sprite:new(nil, fileName)
  self.tileWidth = tileWidth
  self.tileHeight = tileHeight

  self.rows = self.tileset.height/tileHeight;
  self.cols = self.tileset.width/tileWidth;

  return o
end

function tileset:draw(index, x, y, r)
  if(index >= 0) then
  		local i = index/self.cols;
  		local j = index%self.cols;

  		self.tileset:setQuad(j*self.tileWidth,i*self.tileHeight, self.tileWidth, self.tileHeight);
  		self.tileset:draw(x, y, r)
  end
end

return tileset
