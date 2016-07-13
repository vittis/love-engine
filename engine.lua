local engine = {}

engine.state = {}

function engine:setState(state)
	self.state = state
	state:init()
end

function engine:update(dt)
	self.state:update(dt)
end

function engine:draw()
	self.state:draw()

end

return engine
