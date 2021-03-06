local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local function goToMenu()
	composer.removeScene("sound_submenu")
	composer.gotoScene("menu")
end

local function goToCoin()
	composer.removeScene("sound_submenu")
	composer.gotoScene("coin")
end

function scene:create(event)

	local function goToPrev()
		composer.removeScene("sound_submenu")
		composer.gotoScene(event.params.prevScene)
	end

	local function goToSound(event2)
		composer.removeScene("sound_submenu")
		composer.gotoScene("sound", {params = {soundID = event2.target.id, prevScene = "sound_submenu", menuID = event.params.menuID, prevPrevScene = event.params.prevScene}})
	end

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

	local scrollView = widget.newScrollView(
	    {
	        top = display.screenOriginY,
	        left = display.screenOriginX + 60,
	        width = display.actualContentWidth - 60,
	        height = display.actualContentHeight,
	        horizontalScrollDisabled = true,
	        isBounceEnabled = true,
	        backgroundColor = {110/255, 199/255, 212/255}

	    }
	)

	local soundLetterImages = composer.getVariable("submenu_table")

	for i = 1, #soundLetterImages[event.params.menuID][1][1], 1 do 
		local box = display.newRoundedRect(curScene, display.actualContentWidth / 6 - 10, scrollView.y - 90 + (i - 1) * 135, display.actualContentWidth / 4, (display.actualContentWidth / 4) * (25/31), 10)
		scrollView:insert(box)
		box.id = soundLetterImages[event.params.menuID][3][1][i]
		box:addEventListener("tap", goToSound)

		local boxText = display.newText(curScene, soundLetterImages[event.params.menuID][1][1][i], box.x, box.y, "fonts/ComicNeue-Bold.ttf", 50, "center")
		boxText:setFillColor(black)
		boxText.x = (box.x - box.width / 2) + box.width * 0.25
		scrollView:insert(boxText)

		local boxImage = display.newImage(curScene, "images/sound_images/" .. soundLetterImages[event.params.menuID][2][1][i] .. ".png", box.x, box.y)
		boxImage.width = box.width / 1.8
		boxImage.height = boxImage.width
		boxImage.x = box.x + box.width * 0.20
		scrollView:insert(boxImage)
	end

	for i = 1, #soundLetterImages[event.params.menuID][1][2], 1 do 
		local box = display.newRoundedRect(curScene, display.actualContentWidth / 2.2 - 10, scrollView.y - 90 + (i - 1) * 135, display.actualContentWidth / 4, (display.actualContentWidth / 4) * (25/31), 10)
		scrollView:insert(box)
		box.id = soundLetterImages[event.params.menuID][3][2][i]
		box:addEventListener("tap", goToSound)

		local boxText = display.newText(curScene, soundLetterImages[event.params.menuID][1][2][i], box.x, box.y, "fonts/ComicNeue-Bold.ttf", 50, "center")
		boxText:setFillColor(black)
		boxText.x = (box.x - box.width / 2) + box.width * 0.25
		scrollView:insert(boxText)

		local boxImage = display.newImage(curScene, "images/sound_images/" .. soundLetterImages[event.params.menuID][2][2][i] .. ".png", box.x, box.y)
		boxImage.width = box.width / 1.8
		boxImage.height = boxImage.width
		boxImage.x = box.x + box.width * 0.20
		scrollView:insert(boxImage)
	end

	for i = 1, #soundLetterImages[event.params.menuID][1][3], 1 do 
		local box = display.newRoundedRect(curScene, display.actualContentWidth / 1.35 - 10, scrollView.y - 90 + (i - 1) * 135, display.actualContentWidth / 4, (display.actualContentWidth / 4) * (25/31), 10)
		scrollView:insert(box)
		box.id = soundLetterImages[event.params.menuID][3][3][i]
		box:addEventListener("tap", goToSound)

		local boxText = display.newText(curScene, soundLetterImages[event.params.menuID][1][3][i], box.x, box.y, "fonts/ComicNeue-Bold.ttf", 50, "center")
		boxText:setFillColor(black)
		boxText.x = (box.x - box.width / 2) + box.width * 0.25
		scrollView:insert(boxText)

		local boxImage = display.newImage(curScene, "images/sound_images/" .. soundLetterImages[event.params.menuID][2][3][i] .. ".png", box.x, box.y)
		boxImage.width = box.width / 1.8
		boxImage.height = boxImage.width
		boxImage.x = box.x + box.width * 0.20
		scrollView:insert(boxImage)
	end


	print(event.params.menuID)

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	backButton:addEventListener("tap", goToPrev)
	homeButton:addEventListener("tap", goToMenu)
	bankButton:addEventListener("tap", goToCoin)

	sceneGroup:insert(scrollView)
	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene