local composer = require("composer")
local scene = composer.newScene()

local function goToLogin()
	composer.gotoScene("login")
end

local function goToCoin()
	composer.gotoScene("coin")
end

function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {110/255, 199/255, 212/255}

	local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondBackground.fill = {213/255, 236/255, 237/255}

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)

	backButton:addEventListener("tap", goToCoin)
	homeButton:addEventListener("tap", goToLogin)

	local scrollLeft = display.newImage(curScene, "images/scroll-left.png", curScene.x + 50, curScene.y + 60)

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene