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

	local coinBag = display.newImage(curScene, "images/coins.png", display.screenOriginX + display.actualContentWidth - 45, display.screenOriginY + display.actualContentHeight - 45)
	local coins = display.newText(curScene, 25, coinBag.x, coinBag.y + 14, "Comic Sans MS", 22)
	coinBag:scale(0.15, 0.15)

	local headCoins = display.newGroup() 

	for i = 0, 2, 1 do
		local goldCoin = display.newImage(headCoins, "images/coin_gold.png", curScene.x + 180, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)
	end

	local headText = display.newText(headCoins, "Head", curScene.x + 180, curScene.y + 285, "Comic Sans MS", 22)
	headText:setFillColor(black)
	curScene:insert(headCoins)

	local bodyCoins = display.newGroup()

	for i = 0, 1, 1 do
		local goldCoin = display.newImage(bodyCoins, "images/coin_gold.png", curScene.x + 270, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)

	end

	local bodyText = display.newText(bodyCoins, "Body", curScene.x + 270, curScene.y + 285, "Comic Sans MS", 22)
	bodyText:setFillColor(black)
	curScene:insert(bodyCoins)

	local tailCoins = display.newGroup()

	for i = 0, 0, 1 do
		local goldCoin = display.newImage(tailCoins, "images/coin_gold.png", curScene.x + 360, curScene.y + 250 - i * 20)
		goldCoin:scale(0.1, 0.1)
	end

	local tailText = display.newText(tailCoins, "Tail", curScene.x + 360, curScene.y + 285, "Comic Sans MS", 22)
	tailText:setFillColor(black)
	curScene:insert(tailCoins)

	local segmentedAnimalImages = {
		{"bug-head", "bug-middle", "bug-tail"},
		{"ant-head", "ant-middle", "ant-tail"},
		{"cat-head", "cat-middle", "cat-tail"},
		{"cub-head", "cub-middle", "cub-tail"},
		{"dog-head", "dog-middle", "dog-tail"},
		{"elk-head", "elk-middle", "elk-tail"},
		{"bat-head", "bat-middle", "bat-tail"},
		{"aerialist-head", "aerialist-middle", "aerialist-tail"},
		{"clown-head", "clown-middle", "clown-tail"}
	}

	for i = 1, #segmentedAnimalImages, 1 do
		for j = 1, 3, 1 do
			segmentedAnimalImages[i][j] = "images/" .. segmentedAnimalImages[i][j] .. ".png"
		end
	end

	local currentAnimal = {nil, nil, nil}


	local function combineAnimal()
		transition.to(currentAnimal[1], {time = 1500, x = curScene.x + 280})
		transition.to(currentAnimal[3], {time = 1500, x = curScene.x + 280})
	end

	local function buyHead(event)
		if currentAnimal[1] == nil and event.x < curScene.x + 223 then
			currentAnimal[1] = display.newImage(curScene, segmentedAnimalImages[event.target.id][1], curScene.x + 260, curScene.y + 230)
			currentAnimal[1]:scale(0.1, 0.1)
			display.remove(event.target)
			display.remove(headCoins)
			coins.text = coins.text - 3

			if currentAnimal[1] and currentAnimal[2] and currentAnimal[3] then
				combineAnimal()
			end
		end
	end

	local function buyBody(event)
		if currentAnimal[2] == nil and event.x < curScene.x + 320 and event.x > curScene.x + 240 then
			currentAnimal[2] = display.newImage(curScene, segmentedAnimalImages[event.target.id][2], curScene.x + 280, curScene.y + 230)
			currentAnimal[2]:scale(0.1, 0.1)
			display.remove(event.target)
			display.remove(bodyCoins)
			coins.text = coins.text - 2

			if currentAnimal[1] and currentAnimal[2] and currentAnimal[3] then
				combineAnimal()
			end
		end
	end

	local function buyTail(event)
		if currentAnimal[3] == nil and event.x > curScene.x + 337 then
			currentAnimal[3] = display.newImage(curScene, segmentedAnimalImages[event.target.id][3], curScene.x + 300, curScene.y + 230)
			currentAnimal[3]:scale(0.1, 0.1)
			display.remove(event.target)
			display.remove(tailCoins)
			coins.text = coins.text - 1

			if currentAnimal[1] and currentAnimal[2] and currentAnimal[3] then
				combineAnimal()
			end
		end
	end

	local curAnimal = 1

	local testHead = display.newImage(curScene, segmentedAnimalImages[curAnimal][1], curScene.x + 260, curScene.y + 80)
	testHead:scale(0.1, 0.1)
	testHead:addEventListener("tap", buyHead)
	testHead.id = curAnimal

	local testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal][3], curScene.x + 300, curScene.y + 80)
	testTail:scale(0.1, 0.1)
	testTail:addEventListener("tap", buyTail)
	testTail.id = curAnimal

	local testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal][2], curScene.x + 280, curScene.y + 80)
	testBody:scale(0.1, 0.1)
	testBody:addEventListener("tap", buyBody)
	testBody.id = curAnimal

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
		testHead:addEventListener("tap", buyHead)
		testHead.id = curAnimal + 1

		display.remove(testTail)
		testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal + 1][3], curScene.x + 300, curScene.y + 80)
		testTail:scale(0.1, 0.1)
		testTail:addEventListener("tap", buyTail)
		testTail.id = curAnimal + 1

		display.remove(testBody)
		testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal + 1][2], curScene.x + 280, curScene.y + 80)
		testBody:scale(0.1, 0.1)
		testBody:addEventListener("tap", buyBody)
		testBody.id = curAnimal + 1

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
		testHead:addEventListener("tap", buyHead)
		testHead.id = curAnimal - 1

		display.remove(testTail)
		testTail = display.newImage(curScene, segmentedAnimalImages[curAnimal - 1][3], curScene.x + 300, curScene.y + 80)
		testTail:scale(0.1, 0.1)
		testTail:addEventListener("tap", buyTail)
		testTail.id = curAnimal - 1

		display.remove(testBody)
		testBody = display.newImage(curScene, segmentedAnimalImages[curAnimal - 1][2], curScene.x + 280, curScene.y + 80)
		testBody:scale(0.1, 0.1)
		testBody:addEventListener("tap", buyBody)
		testBody.id = curAnimal - 1

		curAnimal = curAnimal - 1

		if curAnimal <= 1 then
			scrollLeft.isVisible = false
		end
	end

	scrollRight:addEventListener("tap", scrollAnimalRight)
	scrollLeft:addEventListener("tap", scrollAnimalLeft)
	

	


	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene