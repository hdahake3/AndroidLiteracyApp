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


	local segmentedAnimalImages = {
		{"images/bug-head.png", "images/bug-middle.png", "images/bug-tail.png"},
		{"images/ant-head.png", "images/ant-middle.png", "images/ant-tail.png"},
		{"images/cat-head.png", "images/cat-middle.png", "images/cat-tail.png"},
		{"images/cub-head.png", "images/cub-middle.png", "images/cub-tail.png"},
		{"images/dog-head.png", "images/dog-middle.png", "images/dog-tail.png"},
		{"images/elk-head.png", "images/elk-middle.png", "images/elk-tail.png"},
		{"images/bat-head.png", "images/bat-middle.png", "images/bat-tail.png"},
		{"images/aerialist-head.png", "images/aerialist-middle.png", "images/aerialist-tail.png"},
		{"images/clown-head.png", "images/clown-middle.png", "images/clown-tail.png"}
	}

	local currentAnimal = {nil, nil, nil}

	local function buyHead(event)
		
	end

	local curAnimal = 1

	local testHead = display.newImage(curScene, segmentedAnimalImages[curAnimal][1], curScene.x + 260, curScene.y + 80)
	testHead:scale(0.1, 0.1)

	local testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal][3], curScene.x + 300, curScene.y + 80)
	testTail:scale(0.1, 0.1)

	local testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal][2], curScene.x + 280, curScene.y + 80)
	testBody:scale(0.1, 0.1)

	local scrollLeft = display.newImage(curScene, "images/scroll-left.png", curScene.x + 100, curScene.y + 90)
	local scrollRight = display.newImage(curScene, "images/scroll-right.png", curScene.x + 450, curScene.y + 90)

	scrollLeft.isVisible = false

	local function scrollAnimalRight()
		if curAnimal >= #segmentedAnimalImages then
			return
		end

		if scrollLeft.isVisible == false then
			scrollLeft.isVisible = true
		end

		display.remove(testHead)
		testHead = display.newImage(curScene, segmentedAnimalImages[curAnimal + 1][1], curScene.x + 260, curScene.y + 80)
		testHead:scale(0.1, 0.1)

		display.remove(testTail)
		testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal + 1][3], curScene.x + 300, curScene.y + 80)
		testTail:scale(0.1, 0.1)

		display.remove(testBody)
		testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal + 1][2], curScene.x + 280, curScene.y + 80)
		testBody:scale(0.1, 0.1)

		curAnimal = curAnimal + 1

		if curAnimal >= #segmentedAnimalImages then
			scrollRight.isVisible = false
		end
	end

	local function scrollAnimalLeft()
		if curAnimal <= 1 then
			return
		end

		if scrollRight.isVisible == false then
			scrollRight.isVisible = true
		end

		display.remove(testHead)
		testHead = display.newImage(curScene, segmentedAnimalImages[curAnimal - 1][1], curScene.x + 260, curScene.y + 80)
		testHead:scale(0.1, 0.1)

		display.remove(testTail)
		testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal - 1][3], curScene.x + 300, curScene.y + 80)
		testTail:scale(0.1, 0.1)

		display.remove(testBody)
		testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal - 1][2], curScene.x + 280, curScene.y + 80)
		testBody:scale(0.1, 0.1)

		curAnimal = curAnimal - 1

		if curAnimal <= 1 then
			scrollLeft.isVisible = false
		end
	end

	scrollRight:addEventListener("tap", scrollAnimalRight)
	scrollLeft:addEventListener("tap", scrollAnimalLeft)
	

	local coinBag = display.newImage(curScene, "images/coins.png", display.screenOriginX + display.actualContentWidth - 45, display.screenOriginY + display.actualContentHeight - 45)
	local coins = display.newText(curScene, 25, coinBag.x, coinBag.y + 14, "Comic Sans MS", 22)
	coinBag:scale(0.15, 0.15)

	for i = 0, 2, 1 do
		local goldCoin = display.newImage(curScene, "images/coin_gold.png", curScene.x + 180, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)

	end

	local headText = display.newText(curScene, "Head", curScene.x + 180, curScene.y + 285, "Comic Sans MS", 22)
	headText:setFillColor(black)

	for i = 0, 1, 1 do
		local goldCoin = display.newImage(curScene, "images/coin_gold.png", curScene.x + 270, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)

	end

	local bodyText = display.newText(curScene, "Body", curScene.x + 270, curScene.y + 285, "Comic Sans MS", 22)
	bodyText:setFillColor(black)

	for i = 0, 0, 1 do
		local goldCoin = display.newImage(curScene, "images/coin_gold.png", curScene.x + 360, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)
	end

	local tailText = display.newText(curScene, "Tail", curScene.x + 360, curScene.y + 285, "Comic Sans MS", 22)
	tailText:setFillColor(black)


	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene