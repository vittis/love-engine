local utf8 = require("utf8")
function love.load()
	love.window.setTitle("Jogo Bom")
	mainFont = love.graphics.newFont("KeepCalm.ttf", 60);
	love.graphics.setBackgroundColor(255, 235, 205)
	width, height = love.graphics.getDimensions()
	love.keyboard.setKeyRepeat(true)
	text = ""
end

function love.draw()
	love.graphics.setFont(mainFont);
    love.graphics.setColor(0, 0, 0)
	love.graphics.print("Jogo Bom", width/2-130, 0, 0)

	love.graphics.print(text, 50, 200, 0, 1/2)
end

function love.update(dt)
    fps = love.timer.getFPS();

end

function love.textinput(t)
    text = text .. t
end


function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end	
    if k == 'backspace' then
	    	if love.keyboard.hasTextInput() then
	    	-- get the byte offset to the last UTF-8 character in the string.
	        local byteoffset = utf8.offset(text, -1)
	        if byteoffset then
	            -- remove the last UTF-8 character.
	            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
	            text = string.sub(text, 1, byteoffset - 1)
	        end
	    end
    end
    if k == 'tab' then
    	love.keyboard.setTextInput(not love.keyboard.hasTextInput())
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