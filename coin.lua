local composer = require("composer")
local scene = composer.newScene()

local function goToLogin()
	composer.gotoScene("login")
end

local function goToMenu()
	composer.gotoScene("menu")
end

function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	display.setDefault("background", 110/255, 199/255, 212/255)

	local secondGradeBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondGradeBackground.fill = {213/255, 236/255, 237/255}

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local zooButton = display.newImage(curScene, "images/zoo.png", display.screenOriginX + 30, curScene.y + 290)
	zooButton:scale(0.90, 0.90)
	
	backButton:addEventListener("tap", goToMenu)
	homeButton:addEventListener("tap", goToLogin)

	for i = 0, 5, 1 do
		local goldCoin = display.newImage(curScene, "images/coin_gold.png", curScene.x + 230, curScene.y + 200 - i * 20)
		goldCoin:scale(0.1, 0.1)

		local silverCoin = display.newImage(curScene, "images/coin_silver.png", curScene.x + 300, curScene.y + 200 - i * 20)
		silverCoin:scale(0.1, 0.1)
		silverCoin.width = goldCoin.width
		silverCoin.height = goldCoin.height
	end

	

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene