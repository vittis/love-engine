titleState = require('titleState')
engine = require('engine')


function love.load()
	engine:setState(titleState)
end

function love.draw()
  engine:draw()
end

function love.update(dt)
	engine:update(dt)
end

function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end
end

--[[ Funcao q confirma a saida com um popup
function love.quit()
    opcaoSelecionada = love.window.showMessageBox("Atenção", "Realmente deseja sair?",
			{"Sim", "Não"})
		if opcaoSelecionada == 1 then
			return false --aborta o quit
		else
			return true
		end
end]]
