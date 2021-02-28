local composer = require("composer")
local scene = composer.newScene()

--create function to allow user to go to coin page
local function goToCoin()
	composer.removeScene("menu")
	composer.gotoScene("coin")
end

--create function to allow user to go to login page
local function goToLogin()
	composer.removeScene("menu")
	composer.gotoScene("login")
end

--function used to display all menu options on screen given the user has logged in
function scene:create( event )

	local sceneGroup = self.view

	local curScene = display.newGroup()

	--displays each menu option button on the screen
	local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

@ -25,17 +25,19 @@ function scene:create( event )
	secondGradeBackground.width = display.actualContentWidth - 60


    
	local consonantButton = display.newImage(curScene, "images/second_consonants.png", curScene.x + 290, curScene.y + 120)
	consonantButton:scale(0.4, 0.4)

	local vowelButton = display.newImage(curScene, "images/second_vowels.png", curScene.x + 290, curScene.y + 230)
	vowelButton:scale(0.4, 0.4)

	
	local backButton = display.newImage(curScene, "images/back.png", display.screenOriginX + 30, curScene.y + 30)
	local homeButton = display.newImage(curScene, "images/home.png", display.screenOriginX + 30, curScene.y + 90)
	local bankButton = display.newImage(curScene, "images/bank.png", display.screenOriginX + 30, curScene.y + 230)
	local puzzleButton = display.newImage(curScene, "images/puzzle.png", display.screenOriginX + 30, curScene.y + 290)

	--implements "tapping" event
	bankButton:addEventListener("tap", goToCoin)
	backButton:addEventListener("tap", goToLogin)
	homeButton:addEventListener("tap", goToLogin)