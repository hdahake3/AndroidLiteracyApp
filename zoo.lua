local composer = require("composer")
local scene = composer.newScene()
--function used to return to login screen
local function goToLogin()
	composer.gotoScene("login")
end

--function used to open up menu
local function goToMenu()
	composer.gotoScene("menu")
end

--function used for coin interaction
function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	display.setDefault("background", 110/255, 199/255, 212/255)

	local secondGradeBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondGradeBackground.fill = {213/255, 236/255, 237/255}

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
    local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 290)
	bankButton:scale(0.90, 0.90)
	
	backButton:addEventListener("tap", goToMenu)
	homeButton:addEventListener("tap", goToLogin)
	
	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene