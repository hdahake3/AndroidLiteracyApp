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
	local rightScroll = display.newImage(curScene, "images/back.png", soundText.x + display.actualContentWidth * (1 / 4), soundText.y + 7)
	rightScroll.rotation = 180

	soundImages = {
		{"ape", "make", "cake"},
		{"bat", "cat", "ax"},
		{"sofa", "zebra", "afraid"},
		{"ant", "man", "van"},
		{"bare", "mare", "hare"},
		{"saw", "hawk", "paws"},
		{"boy", "bubble", "boat"},
		{"blow", "blue", "blush"},
		{"cat", "canary", "cake"},
		{"chest", "cheese", "chisel"},
		{"kick", "truck", "backpack"},
		{"crab", "cry", "croc"},
		{"bird", "cold", "friend"},
		{"me", "he", "we"},
		{"camel", "oven", "kitten"},
		{"head", "bear", "pears"},
		{"veil", "eight", "weigh"},
		{"net", "jet", "yeti"},
		{"flew", "blew", "chew"},
		{"scarf", "thief", "chef"},
		{"frog", "fry", "fro"},
		{"goose", "goat", "gold"},
		{"giraffe", "gingerbread man", "fridge"},
		{"high", "right", "eight"},
		{"gnaw", "gnome", "gnat"},
		{"hug", "hardhat", "hide"},
		{"ice", "five", "lion"},
		{"mittens", "hit", "fish"},
		{"taxi", "yeti", "skis"},
		{"high", "thigh", "right"},
		{"milk", "lily", "tilt"},
		{"kind", "find", "blind"},
		{"bird", "girl", "shirt"},
		{"key", "kayak", "kangaroo"},
		{"knot", "knee", "knit"},
		{"owl", "goal", "sail"},
		{"poodle", "whale", "tricycle"},
		{"colt", "belt", "halt"},
		{"swim", "clam", "storm"},
		{"ump", "chimp", "camp"}
	}

	for i = 1, 3, 1 do
		local soundImage = display.newImage(curScene, "images/" .. soundImages[event.params.soundID][i] .. ".png", display.contentCenterX + 30 + i * display.actualContentWidth * (1 / 4) - display.actualContentWidth * (1 / 2), 
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