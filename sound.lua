local composer = require("composer")
local scene = composer.newScene()

local function goToMenu()
	composer.removeScene("sound")
	composer.gotoScene("menu")
end

local function goToCoin()
	composer.removeScene("sound")
	composer.gotoScene("coin")
end

local function goToAllSounds()
	composer.removeScene("sound")
	composer.gotoScene("all_sounds")
end

local function goToSound(event)
	composer.removeScene("sound")
	composer.gotoScene("sound", {params = {soundID = event.target.soundID}})
end

function scene:create(event)
	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {110/255, 199/255, 212/255}

    local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondBackground.fill = {1, 1, 1}


	local letters = composer.getVariable("all_sounds_table")

	local soundText = display.newText(curScene, letters[event.params.soundID], display.contentCenterX + 30, (display.contentCenterY - display.safeScreenOriginY) / 2.5, "fonts/ComicNeue-Bold.ttf", 100, "center")
	soundText:setFillColor(black)

	print(letters[event.params.soundID])


	local leftScroll = display.newImage(curScene, "images/back.png", soundText.x - display.actualContentWidth * (1 / 4), soundText.y + 7)
	leftScroll.soundID = (event.params.soundID - 2) % 155 + 1
	leftScroll:addEventListener("tap", goToSound)

	local rightScroll = display.newImage(curScene, "images/back.png", soundText.x + display.actualContentWidth * (1 / 4), soundText.y + 7)
	rightScroll.rotation = 180
	rightScroll.soundID = event.params.soundID % 155 + 1
	rightScroll:addEventListener("tap", goToSound)

	soundImages = composer.getVariable("sounds_table")

	for i = 1, 3, 1 do
		local soundImage = display.newImage(curScene, "images/sound_images/" .. soundImages[event.params.soundID][i] .. ".png", display.contentCenterX + 30 + i * display.actualContentWidth * (1 / 4) - display.actualContentWidth * (1 / 2), 
							(display.contentCenterY - display.safeScreenOriginY) / (3 / 4))
		soundImage.width = display.actualContentWidth * (1 / 4)
		soundImage.height = soundImage.width

		local soundImageText = display.newText(curScene, soundImages[event.params.soundID][i], soundImage.x, soundImage.y + soundImage.height / 2 + 15, "fonts/ComicNeue-Bold.ttf", 30, "center")
		while soundImageText.width > soundImage.width do 
			soundImageText.size = soundImageText.size - 1
		end

		soundImageText:setFillColor(black)
	end


	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	backButton:addEventListener("tap", goToAllSounds)
	homeButton:addEventListener("tap", goToMenu)
	bankButton:addEventListener("tap", goToCoin)
	puzzleButton:addEventListener("tap", goToAllSounds)

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)


return scene