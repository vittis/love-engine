local gameState = {}

function gameState:init()
  print("gameState iniciado")
end

function gameState:update()

end

function gameState:render()
    love.graphics.circle("fill", 0 , 0, 5,  5)
end



return gameState
