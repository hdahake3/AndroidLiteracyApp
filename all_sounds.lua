local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local function goToSound(event)
	print(event.target.id)
	composer.gotoScene("sound", {params = {soundID = event.target.id, prevScene = "all_sounds"}})
end

local function goToMenu()
	composer.removeScene("all_sounds")
	composer.gotoScene("menu")
end

local function goToCoin()
	composer.removeScene("all_sounds")
	composer.gotoScene("coin")
end

function scene:create(event)

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {110/255, 199/255, 212/255}


	local scrollView = widget.newScrollView(
	    {
	        top = display.screenOriginY,
	        left = display.screenOriginX + 60,
	        width = display.actualContentWidth - 60,
	        height = display.actualContentHeight,
	        verticalScrollDisabled = true,
	        isBounceEnabled = true,
	        rightPadding = 20
	    }
	)

	letters = composer.getVariable("all_sounds_table")

	for i = 1, 78, 1 do

		local box = display.newRect(curScene, scrollView.x - 200 + (i - 1) * 120, (display.contentCenterY - display.safeScreenOriginY) / 2, 105, 136.5)
		box:setFillColor(236/255, 249/255, 239/255)
		scrollView:insert(box)

		local boxText = display.newText(curScene, letters[i], box.x, box.y, "fonts/ComicNeue-Bold.ttf", 50, "center")
		boxText:setFillColor(black)
		scrollView:insert(boxText)
		
		box.id = i
		box:addEventListener("tap", goToSound)

	end

	for i = 79, 155, 1 do

		local box = display.newRect(curScene, scrollView.x - 200 + (i - 79) * 120, (display.contentCenterY - display.safeScreenOriginY) / (2 / 3), 105, 136.5)
		box:setFillColor(236/255, 249/255, 239/255)
		scrollView:insert(box)

		local boxText = display.newText(curScene, letters[i], box.x, box.y, "fonts/ComicNeue-Bold.ttf", 50, "center")
		boxText:setFillColor(black)
		scrollView:insert(boxText)

		box.id = i
		box:addEventListener("tap", goToSound)

	end

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	backButton:addEventListener("tap", goToMenu)
	homeButton:addEventListener("tap", goToMenu)
	bankButton:addEventListener("tap", goToCoin)

	sceneGroup:insert(scrollView)
	sceneGroup:insert(curScene)

end

scene:addEventListener( "create", scene )


return scene