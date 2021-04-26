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
	local function goToPuzzle()
		composer.removeScene("sound")
		composer.gotoScene("puzzle", {params = {soundID = event.params.soundID, prevScene = event.params.prevScene, menuID = event.params.menuID, prevPrevScene = event.params.prevPrevScene,
			puzzlePieceProgress = nil}})
	end

	local function goToSound(event2)
		composer.removeScene("sound")
		composer.gotoScene("sound", {params = {soundID = event2.target.soundID, prevScene = event.params.prevScene, menuID = event.params.menuID, prevPrevScene = event.params.prevPrevScene}})
	end

	local function goToPrev()
		composer.removeScene("sound")
		composer.gotoScene(event.params.prevScene, {params = {menuID = event.params.menuID, prevScene = event.params.prevPrevScene}})
	end


	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {110/255, 199/255, 212/255}

    local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondBackground.fill = {1, 1, 1}


	local letters = composer.getVariable("all_sounds_table")
	local phoneme_sounds = composer.getVariable("phoneme_sound_table")

	local phoneme_sound = audio.loadSound("sounds/phoneme_sounds/" .. phoneme_sounds[event.params.soundID])

	local aniScale = 1.1

	local function resetSoundImage(obj)
		obj:scale(1 / aniScale, 1 / aniScale)
	end

	local function playPhonemeSound(event2)
		print(phoneme_sounds[event.params.soundID])
		audio.play(event2.target.sound)
		transition.to(event2.target, {xScale = 1.1, yScale = 1.1, onComplete = resetSoundImage})
	end

	local soundText = display.newText(curScene, letters[event.params.soundID], display.contentCenterX + 30, (display.contentCenterY - display.safeScreenOriginY) / 2.5, "fonts/ComicNeue-Bold.ttf", 100, "center")
	soundText:setFillColor(black)
	soundText.sound = phoneme_sound
	soundText:addEventListener("tap", playPhonemeSound)


	print(letters[event.params.soundID])


	local leftScroll = display.newImage(curScene, "images/back.png", soundText.x - display.actualContentWidth * (1 / 4), soundText.y + 7)
	leftScroll.soundID = (event.params.soundID - 2) % 155 + 1
	leftScroll:addEventListener("tap", goToSound)

	local rightScroll = display.newImage(curScene, "images/back.png", soundText.x + display.actualContentWidth * (1 / 4), soundText.y + 7)
	rightScroll.rotation = 180
	rightScroll.soundID = event.params.soundID % 155 + 1
	rightScroll:addEventListener("tap", goToSound)

	local soundImages = composer.getVariable("sounds_table")

	local function playSoundSound(event2)
		audio.play(event2.target.sound)
		transition.to(event2.target.soundImage, {xScale = aniScale, yScale = aniScale, onComplete = resetSoundImage})
		transition.to(event2.target.soundImageText, {xScale = aniScale, yScale = aniScale, onComplete = resetSoundImage})
	end

	for i = 1, 3, 1 do
		local soundGroup = display.newGroup()
		curScene:insert(soundGroup)

		local soundImage = display.newImage(curScene, "images/sound_images/" .. soundImages[event.params.soundID][i] .. ".png", display.contentCenterX + 30 + i * display.actualContentWidth * (1 / 4) - display.actualContentWidth * (1 / 2), 
							(display.contentCenterY - display.safeScreenOriginY) / (3 / 4))
		soundImage.width = display.actualContentWidth * (1 / 4)
		soundImage.height = soundImage.width


		local soundImageText = display.newText(curScene, soundImages[event.params.soundID][i], soundImage.x, soundImage.y + soundImage.height / 2 + 15, "fonts/ComicNeue-Bold.ttf", 30, "center")
		while soundImageText.width > soundImage.width do 
			soundImageText.size = soundImageText.size - 1
		end

		soundImageText:setFillColor(black)

		soundGroup:insert(soundImage)
		soundGroup:insert(soundImageText)

		local soundSound = audio.loadSound("sounds/word_sounds/" .. soundImages[event.params.soundID][i] .. ".mp3")
		soundGroup.sound = soundSound
		soundGroup:addEventListener("tap", playSoundSound)

		soundGroup.soundImage = soundImage
		soundGroup.soundImageText = soundImageText

	end


	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)
	local quizButton = display.newImage(curScene, "images/quiz.png", display.screenOriginX + 30, (bankButton.y - homeButton.y) / 2 + homeButton.y)

	backButton:addEventListener("tap", goToPrev)
	homeButton:addEventListener("tap", goToMenu)
	bankButton:addEventListener("tap", goToCoin)
	puzzleButton:addEventListener("tap", goToAllSounds)
	quizButton:addEventListener("tap", goToPuzzle)

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)


return scene