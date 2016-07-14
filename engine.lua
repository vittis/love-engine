local engine = {}

engine.GS = require('hump/gamestate')

engine.previousStateName = 'empty'
engine.stateName = 'empty'

function engine:setup()
	self.GS.registerEvents()
end

function engine:switch(stateFileName)
	local finalStateFileName
  local f=io.open(stateFileName..'.lua',"r")
  if f~=nil then
  	io.close(f)
		finalStateFileName = stateFileName
  else
		finalStateFileName = 'Scenes/' .. stateFileName
	end
	self.previousStateName = engine.stateName
	self.stateName = stateFileName
	self.GS.switch(require(finalStateFileName))
end

function engine:push(stateFileName)
	local finalStateFileName
	local f=io.open(stateFileName..'.lua',"r")
	if f~=nil then
		io.close(f)
		finalStateFileName = stateFileName
	else
		finalStateFileName = 'Scenes/' .. stateFileName
	end
	self.previousStateName = engine.stateName
	self.stateName = stateFileName
	self.GS.push(require(finalStateFileName))
end

function engine:pop()
	self.GS.pop()
	self.stateName = self.previousStateName
end

function engine:getCurrentState()
	return self.GS.current()
end


return engine
