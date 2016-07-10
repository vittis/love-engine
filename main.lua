x=0
y=0
function love.load()
	mainFont = love.graphics.newFont("KeepCalm.ttf", 60);
	love.graphics.setFont(mainFont);

	love.graphics.setBackgroundColor(255, 235, 205)
	width, height = love.graphics.getDimensions()
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
	love.graphics.print("Jogo Bom", width/2-130, 0, 0)

    love.graphics.setColor(255, 0, 0)

	love.graphics.line(love.graphics.getWidth()/2, love.graphics.getHeight()/2, x, y)

end

function love.update(dt)
	x, y = love.mouse.getPosition()
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