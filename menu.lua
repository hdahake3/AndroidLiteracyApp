local composer = require("composer")
local scene = composer.newScene()

local function goToCoin()
	composer.removeScene("menu")
	composer.gotoScene("coin")
end

local function goToLogin()
	composer.removeScene("menu")
	composer.gotoScene("login")
end

local function goToAllSounds()
	composer.removeScene("menu")
	composer.gotoScene("all_sounds")
end

local function goToConsonantsMenu()
	composer.removeScene("menu")
	composer.gotoScene("consonants_menu")
end

local function goToVowelsMenu()
	composer.removeScene("menu")
	composer.gotoScene("vowels_menu")
end

function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

    local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
    secondBackground.fill = {1, 1, 1}

	local secondGradeBackground = display.newImage(curScene, "images/second_categories.png", display.contentCenterX + 30, display.contentCenterY)
	secondGradeBackground.height = secondGradeBackground.height * ((display.actualContentWidth - 60) / secondGradeBackground.width)
	secondGradeBackground.width = display.actualContentWidth - 60

	if secondGradeBackground.height > display.actualContentHeight then 
		secondGradeBackground.width = secondGradeBackground.width * (display.actualContentHeight / secondGradeBackground.height)
		secondGradeBackground.height = display.actualContentHeight
	end

	local consonantSound = audio.loadSound("sounds/consonants.mp3")

	local function playConsonantSound()
		audio.play(consonantSound)
		goToConsonantsMenu()
	end

	local consonantButton = display.newImage(curScene, "images/second_consonants.png", curScene.x + 285, curScene.y + 120)
	consonantButton:scale(0.4, 0.4)
	consonantButton:addEventListener("tap", playConsonantSound)

	local vowelSound = audio.loadSound("sounds/vowels.mp3")

	local function playVowelSound()
		audio.play(vowelSound)
		goToVowelsMenu()
	end

	local vowelButton = display.newImage(curScene, "images/second_vowels.png", curScene.x + 285, curScene.y + 230)
	vowelButton:scale(0.4, 0.4)
	vowelButton:addEventListener("tap", playVowelSound)

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	bankButton:addEventListener("tap", goToCoin)
	backButton:addEventListener("tap", goToLogin)
	homeButton:addEventListener("tap", goToLogin)
	puzzleButton:addEventListener("tap", goToAllSounds)

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene