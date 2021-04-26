-----------------------------------------------------------------------------------------
--
-- login.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()

local function goToMenu()
	composer.removeScene("login")
	composer.gotoScene("menu")
end

function scene:create( event )
 
    local sceneGroup = self.view
    
    local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

	local loginKeysImages = {
		'a',
		'b',
		'c',
		'd',
		'e',
		'f',
		'g',
		'h',
		'i',
		'j',
		'k',
		'l',
		'm',
		'n',
		'o',
		'p',
		'q',
		'r',
		's',
		't',
		'u',
		'v',
		'w',
		'x',
		'y',
		'z',
		'0',
		'1',
		'2',
		'3',
		'4',
		'5',
		'6',
		'7',
		'8',
		'9'
	}

	for i = 1, #loginKeysImages, 1 do
		loginKeysImages[i] = "images/" .. loginKeysImages[i] .. ".png"
	end

	local loginKeys = display.newGroup()

	local loginArray = {0, 0, 0, 0, 0}

	local loginDeleteButtonEvent = function(event)
		loginArray[event.target.id] = 0
		display.remove(event.target)
	end


	local loginButtonEvent = function(event)
		for i = 1, #loginArray, 1 do 
			if loginArray[i] == 0 then
				local curImage = display.newRoundedRect(loginKeys, 40 + (i - 1) * 65, loginKeys.y + 220, 47.6, 47.6, 4, 4)
				curImage.fill = {type = "image", filename = loginKeysImages[event.target.id]}
				curImage.id = i
				loginArray[i] = 1
				curImage:addEventListener("tap", loginDeleteButtonEvent)
				break
			end
		end

	    print(event.target.id)
	end

	for i = 1, #loginKeysImages, 1 do 
		
		local curImage = display.newRoundedRect(loginKeys, 32 + ((i - 1) % 9) * 52, 32 + math.floor((i - 1) / 9) * 52, 47.6, 47.6, 4)
		curImage.fill = {type = "image", filename = loginKeysImages[i]}
		curImage.id = i
		curImage:addEventListener("tap", loginButtonEvent)

	end

	loginKeys.y = loginKeys.y + 30

	local parentTeacher = display.newImage(loginKeys, 'images/parent_teacher.png', display.contentCenterX, loginKeys.y - 45)
	parentTeacher:scale(0.3, 0.3)

	for i = 1, 5, 1 do
		local curImage = display.newImage(loginKeys, 'images/empty_login.png', 40 + (i - 1) * 65, loginKeys.y + 220)
		curImage:scale(0.3, 0.3)
	end


	local loginButton = display.newImage(loginKeys, 'images/login.png', loginKeys.x + 400, loginKeys.y + 220)
	loginButton:scale(0.3, 0.3)
	loginButton:addEventListener("tap", goToMenu)

	
	
	if composer.getVariable("coins") == nil then
		composer.setVariable("coins", 10)
	end

	sceneGroup:insert(loginKeys)

end

scene:addEventListener( "create", scene )


return scene