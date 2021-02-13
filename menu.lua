local composer = require("composer")
local scene = composer.newScene()

function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	local secondGradeBackground = display.newImage(curScene, "images/second_categories.png", display.contentCenterX + 30, display.contentCenterY)
	secondGradeBackground.height = display.actualContentHeight
	secondGradeBackground.width = display.actualContentWidth - 60


	local consonantButton = display.newImage(curScene, "images/second_consonants.png", curScene.x + 290, curScene.y + 120)
	consonantButton:scale(0.4, 0.4)

	local vowelButton = display.newImage(curScene, "images/second_vowels.png", curScene.x + 290, curScene.y + 230)
	vowelButton:scale(0.4, 0.4)

	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)


	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene