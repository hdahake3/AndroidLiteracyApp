local composer = require("composer")
local scene = composer.newScene()

local function goToCoin()
	composer.removeScene("vowels_menu")
	composer.gotoScene("coin")
end

local function goToMenu()
	composer.removeScene("vowels_menu")
	composer.gotoScene("menu")
end

local function goToAllSounds()
	composer.removeScene("vowels_menu")
	composer.gotoScene("all_sounds")
end

local function goToSoundSubMenu(event)
	composer.removeScene("vowels_menu")
	composer.gotoScene("sound_submenu", {params = {menuID = event.target.id, prevScene = "vowels_menu"}})
end

function scene:create(event)
	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

	local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
    secondBackground.fill = {1, 1, 1}

	local vowelBackground = display.newImage(curScene, "images/second_vowels_details.png", display.contentCenterX + 30, display.contentCenterY)
	local origWidth = vowelBackground.width
	local origHeight = vowelBackground.height

	vowelBackground.width = vowelBackground.width * (display.actualContentHeight / vowelBackground.height)
	vowelBackground.height = display.actualContentHeight

	if vowelBackground.width > display.actualContentWidth - 60 then
		vowelBackground.height = vowelBackground.height * ((display.actualContentWidth - 60) / vowelBackground.width)
		vowelBackground.width = display.actualContentWidth - 60
	end

	local widthRatio = vowelBackground.width / origWidth
	local heightRatio = vowelBackground.height / origHeight

	local vowelTypes = {
		"short", 
		"long", 
		"pairs", 
		"sounds_of_y", 
		"with_r", 
		"schwas"
	}

	boxWidths = {250, 230, 250, 400, 280, 300}

	for i = 1, #vowelTypes, 1 do 
		local listeningRect = display.newRect(curScene, display.contentCenterX - 35, display.contentCenterY - 105 + (i - 1) * 48, boxWidths[i], 100)
		listeningRect.anchorX = 0
		listeningRect.width = listeningRect.width * widthRatio
		listeningRect.height = listeningRect.height * heightRatio
		listeningRect:setFillColor(black)
		listeningRect.alpha = 0
		listeningRect.isHitTestable = true
		listeningRect.id = vowelTypes[i]
		listeningRect:addEventListener("tap", goToSoundSubMenu)
	end

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	bankButton:addEventListener("tap", goToCoin)
	backButton:addEventListener("tap", goToMenu)
	homeButton:addEventListener("tap", goToMenu)
	puzzleButton:addEventListener("tap", goToAllSounds)

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)


return scene