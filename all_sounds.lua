local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local function goToSound(event)
	print(event.target.id)
	composer.gotoScene("sound", {params = {soundID = event.target.id}})
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

	letters = {
		"a", "a", "a", "an", "ar", "aw", 
		"b", "bl", 
		"c", "ch", "ck", "cr", 
		"d", 
		"e", "e", "ea", "ei", "et", "ew", 
		"f", "fr", 
		"g", "g", "gh", "gn",
		"h", 
		"i", "i", "i", "igh", "il", "ind", "ir",
		"k", "kn", 
		"l", "le", "lt",
		"m", "mp",
		"n", "ng", "nt",
		"o", "o", "oi", "oo", "or", "ost", "ou", "ow",
		"p", "ph", "pl",  
		"q",
		"r",
		"s", "sc", "scr", "sh", "sk", "sm", "sp", "spr", "st", "sw",
		"t", "th", "th",
		"u", "u", "ur", 
		"w", "wr", 
		"x",
		"y",
		"ey",
		"z",
		"a", "a", "ai", "ar", "au", "ay", 
		"b", "br",
		"c", "ch", "cl",
		"d", "dr",
		"e", "ea", "ee", "er", "et",
		"f", "fl", "ft",
		"g", "gh", "gl", "gr",
		"h",   
		"i", "i", "ie", "il", "ild", "ion",
		"j",
		"k",
		"l", "ld", "lf",
		"m", "mb",
		"n", "nd", "nk", 
		"o", "o", "oa", "old", "oo", "or", "ost", "ow", "oy",
		"p", "ph", "pr", 
		"r", 
		"s", "s", "sc", "sh", "sk", "sl", "sn", "spl", "st", "str", 
		"t", "tch", "th", "tr",
		"u", "u",
		"v",
		"wh",
		"x",
		"y",
		"y",
		"z"
	}

	if composer.getVariable("all_sounds_table") == nil then
		composer.setVariable("all_sounds_table", letters)
	end

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