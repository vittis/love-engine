local engine = {}

engine.Gamestate = require('hump.gamestate')

engine.previousState = {}
engine.currentState = {}

function engine:init()
	self.Gamestate.registerEvents()
end

function engine:switch(state)
  self.previousState = self.currentState
  self.currentState = state
	self.Gamestate.switch(state)
end

function engine:push(state)
  self.previousState = self.currentState
  self.currentState = state
  self.Gamestate.push(state)
end
function engine:pop()
  self.currentState = self.previousState
  self.Gamestate.pop()
end

return engine
