local composer = require("composer")
local scene = composer.newScene()



function scene:create(event)
	local function goToSound()
		composer.removeScene("puzzle")
		composer.gotoScene("sound", {params = {soundID = event.params.soundID, prevScene = event.params.prevScene, menuID = event.params.menuID, prevPrevScene = event.params.prevPrevScene}})
	end

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local background = display.newRect(curScene, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {110/255, 199/255, 212/255}

    local secondBackground = display.newRect(curScene, display.contentCenterX + 30, display.contentCenterY, display.actualContentWidth - 60, display.actualContentHeight)
	secondBackground.fill = {1, 1, 1}

	local puzzleBackground = display.newRect(curScene, display.screenOriginX + 190, curScene.y + 190, 0.4 * 450, 0.4 * 600)
	puzzleBackground:setFillColor(211/255, 236/255, 238/255)

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

	local soundText = display.newText(curScene, letters[event.params.soundID], display.screenOriginX + 190, curScene.y + 30, "fonts/ComicNeue-Bold.ttf", 100, "center")
	soundText:setFillColor(black)
	soundText.sound = phoneme_sound
	soundText:addEventListener("tap", playPhonemeSound)

	local soundImages = composer.getVariable("sounds_table")
	local puzzleImages = composer.getVariable("puzzle_table")

	local puzzlePieces = {}

	local puzzlePieceProgressCur = {}

	if event.params.puzzlePieceProgress then
		puzzlePieceProgressCur = event.params.puzzlePieceProgress
	end

	for i = 0, 3, 1 do
		for j = 0, 2, 1 do
			local puzzleImage = display.newImage(curScene, "images/puzzle-pieces/" .. puzzleImages[event.params.soundID] .. "/row" .. i .. "-col" .. j .. ".png", display.screenOriginX + 190, curScene.y + 190)
			puzzleImage:scale(0.4, 0.4)

			isFound = false

			for k = 1, #puzzlePieceProgressCur, 1 do
				if puzzlePieceProgressCur[k] == 3 * i + j + 1 then
					isFound = true
				end
			end

			if isFound then 
				puzzleImage.isVisible = true
			else 
				puzzleImage.isVisible = false
				puzzleImage.id = 3 * i + j + 1
				puzzlePieces[#puzzlePieces + 1] = puzzleImage
			end			
			
		end
	end

	print(#puzzlePieces)

	local function goToNextQuestion()
		composer.removeScene("puzzle")
		composer.gotoScene("puzzle", {params = {soundID = event.params.soundID, prevScene = event.params.prevScene, menuID = event.params.menuID, prevPrevScene = event.params.prevPrevScene,
			puzzlePieceProgress = puzzlePieceProgressCur}})
	end

	local function addPuzzlePieces()

		if #puzzlePieces == 0 then 
			return
		end


		for i = 1, 2, 1 do


			randomIndex = math.random(#puzzlePieces)
			puzzlePieces[randomIndex].isVisible = true
			puzzlePieceProgressCur[#puzzlePieceProgressCur + 1] = puzzlePieces[randomIndex].id
			table.remove(puzzlePieces, randomIndex)

			composer.setVariable("coins", composer.getVariable("coins") + 1)
		end

		timer.performWithDelay(2000, goToNextQuestion)

	end

	local function generateAnswers()


		local possibleLocations = {
									{display.contentCenterX + 30 + display.actualContentWidth * (1 / 7), (display.contentCenterY - display.safeScreenOriginY) / (3/2)},
								   	{display.contentCenterX + 30 + display.actualContentWidth * (1 / 3), (display.contentCenterY - display.safeScreenOriginY) / (3/2)},
								   	{display.contentCenterX + 30 + display.actualContentWidth * (1 / 4), (display.contentCenterY - display.safeScreenOriginY) / (2/3)}
								  }

		local answers = {0, 0, 0}
		local answerImagesIDs = {{0, 0}, {0, 0}, {0, 0}}
		local answerImages = {0, 0, 0}

		answers[math.random(1, 3)] = 1

		for i = 1, #answers, 1 do
			if answers[i] == 1 then
				local temp_rand = math.random(1, 3)

				local soundImage = display.newImage(curScene, "images/sound_images/" .. soundImages[event.params.soundID][temp_rand] .. ".png", possibleLocations[i][1], possibleLocations[i][2])
				soundImage.width = display.actualContentWidth * (1 / 5)
				soundImage.height = soundImage.width
				answerImagesIDs[i][1] = event.params.soundID
				answerImagesIDs[i][2] = temp_rand
				answerImages[i] = soundImage
				soundImage:addEventListener("tap", addPuzzlePieces)
				
			else
				local rand_soundID = math.random(1, #soundImages)

				while rand_soundID == event.params.soundID do
					rand_soundID = math.random(1, #soundImages)
				end

				local temp_rand = math.random(1, 3)

				local soundImage = display.newImage(curScene, "images/sound_images/" .. soundImages[rand_soundID][temp_rand] .. ".png", possibleLocations[i][1], possibleLocations[i][2])
				soundImage.width = display.actualContentWidth * (1 / 5)
				soundImage.height = soundImage.width
				answerImagesIDs[i][1] = rand_soundID
				answerImagesIDs[i][2] = temp_rand
				answerImages[i] = soundImage
			end
		end

		
		local audio1 = audio.loadSound("sounds/word_sounds/" .. soundImages[answerImagesIDs[1][1]][answerImagesIDs[1][2]] .. ".mp3")
		local audio2 = audio.loadSound("sounds/word_sounds/" .. soundImages[answerImagesIDs[2][1]][answerImagesIDs[2][2]] .. ".mp3")
		local audio3 = audio.loadSound("sounds/word_sounds/" .. soundImages[answerImagesIDs[3][1]][answerImagesIDs[3][2]] .. ".mp3")

		local function playAudioTransition(event)
			local params = event.source.params

			transition.to(answerImages[params.i], {xScale = 1.1, yScale = 1.1, onComplete = resetSoundImage})
			audio.play(audio.loadSound("sounds/word_sounds/" .. soundImages[answerImagesIDs[params.i][1]][answerImagesIDs[params.i][2]] .. ".mp3"))
		end

		local tm = timer.performWithDelay(1000, playAudioTransition)
		tm.params = {i = 1}

		local tm2 = timer.performWithDelay(1500 + audio.getDuration(audio1), playAudioTransition)
		tm2.params = {i = 2}

		local tm2 = timer.performWithDelay(2000 + audio.getDuration(audio1) + audio.getDuration(audio2), playAudioTransition)
		tm2.params = {i = 3}

	end

	generateAnswers()

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	backButton:addEventListener("tap", goToSound)

	sceneGroup:insert(curScene)

end

scene:addEventListener("create", scene)

return scene