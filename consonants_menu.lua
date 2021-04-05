local composer = require("composer")
local scene = composer.newScene()

local function goToCoin()
	composer.removeScene("menu")
	composer.gotoScene("coin")
end

local function goToMenu()
	composer.removeScene("consonants_menu")
	composer.gotoScene("menu")
end

local function goToAllSounds()
	composer.removeScene("menu")
	composer.gotoScene("all_sounds")
end

function scene:create(event)
	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

	local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
    secondBackground.fill = {1, 1, 1}

	local consonantBackground = display.newImage(curScene, "images/second_consonants_details.png", display.contentCenterX + 30, display.contentCenterY)
	local origWidth = consonantBackground.width
	local origHeight = consonantBackground.height

	consonantBackground.width = consonantBackground.width * (display.actualContentHeight / consonantBackground.height)
	consonantBackground.height = display.actualContentHeight

	if consonantBackground.width > display.actualContentWidth - 60 then
		consonantBackground.height = consonantBackground.height * ((display.actualContentWidth - 60) / consonantBackground.width)
		consonantBackground.width = display.actualContentWidth - 60
	end

	local widthRatio = consonantBackground.width / origWidth
	local heightRatio = consonantBackground.height / origHeight

	boxWidths = {410, 360, 510, 400, 360, 390, 210, 530, 480}
	boxHeights = {75, 72, 63, 59, 60, 62, 60, 60, 60}
	boxDistance = {36, 37, 35.3, 33.4, 32.2, 31.8, 31.4, 31.1, 31}

	for i = 1, #boxWidths, 1 do 
		local listeningRect = display.newRect(curScene, display.contentCenterX - 100, display.contentCenterY - 110 + (i - 1) * boxDistance[i], boxWidths[i], boxHeights[i])
		listeningRect.anchorX = 0
		listeningRect.width = listeningRect.width * widthRatio
		listeningRect.height = listeningRect.height * heightRatio
		listeningRect:setFillColor(black)
		listeningRect.alpha = 0

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