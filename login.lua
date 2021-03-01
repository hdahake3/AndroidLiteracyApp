function scene:create( event )
    
    local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background.fill = {213/255, 236/255, 237/255}

	--array of all images used for letters to type in for login
	local loginKeysImages = {
		'images/a.png',
		'images/b.png',
@ -60,6 +60,7 @@ function scene:create( event )

	local loginKeys = display.newGroup()

	--holds values for password
	local loginArray = {0, 0, 0, 0, 0}

	local loginDeleteButtonEvent = function(event)
@ -67,7 +68,7 @@ function scene:create( event )
		display.remove(event.target)
	end


	--function that places and displays all inputs on screen for user to interact with
	local loginButtonEvent = function(event)
		for i = 1, #loginArray, 1 do 
			if loginArray[i] == 0 then
@ -84,6 +85,7 @@ function scene:create( event )
	    print(event.target.id)
	end

	--function that handles login attempts and resets input when character is tapped on or inorrect password is implemented
	for i = 1, #loginKeysImages, 1 do 
		
		local curImage = display.newImage(loginKeys, loginKeysImages[i], 32 + ((i - 1) % 9) * 52, 32 + math.floor((i - 1) / 9) * 52)
@ -99,12 +101,13 @@ function scene:create( event )
	local parentTeacher = display.newImage(loginKeys, 'images/parent_teacher.png', display.contentCenterX, loginKeys.y - 45)
	parentTeacher:scale(0.3, 0.3)

	--place empty login input positions in right spot
	for i = 1, 5, 1 do
		local curImage = display.newImage(loginKeys, 'images/empty_login.png', 40 + (i - 1) * 65, loginKeys.y + 220)
		curImage:scale(0.3, 0.3)
	end


  --places login buttons in correct spot
	local loginButton = display.newImage(loginKeys, 'images/login.png', loginKeys.x + 400, loginKeys.y + 220)
	loginButton:scale(0.3, 0.3)
	loginButton:addEventListener("tap", goToMenu)