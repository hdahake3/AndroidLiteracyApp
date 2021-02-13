-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setDefault("background", 213/255, 236/255, 237/255)




local loginKeysImages = {
	'images/a.png',
	'images/b.png',
	'images/c.png',
	'images/d.png',
	'images/e.png',
	'images/f.png',
	'images/g.png',
	'images/h.png',
	'images/i.png',
	'images/j.png',
	'images/k.png',
	'images/l.png',
	'images/m.png',
	'images/n.png',
	'images/o.png',
	'images/p.png',
	'images/q.png',
	'images/r.png',
	'images/s.png',
	'images/t.png',
	'images/u.png',
	'images/v.png',
	'images/w.png',
	'images/x.png',
	'images/y.png',
	'images/z.png',
	'images/0.png',
	'images/1.png',
	'images/2.png',
	'images/3.png',
	'images/4.png',
	'images/5.png',
	'images/6.png',
	'images/7.png',
	'images/8.png',
	'images/9.png'
}

local loginKeys = display.newGroup()

local leftBound = display.actualContentWidth * 0.1
print(display.actualContentWidth)

local spacing = (display.actualContentWidth * 0.8) / 9

for i = 1, #loginKeysImages, 1 do 
	
	local curImage = display.newImage(loginKeys, loginKeysImages[i], 32 + ((i - 1) % 9) * 52, 32 + math.floor((i - 1) / 9) * 52)
	curImage:scale(0.07, 0.07)
	curImage.width = curImage.height
	--curImage.x = (i - 1) * 60
	--curImage.y = display.contentCenterY

end

loginKeys.y = loginKeys.y + 30

local parentTeacher = display.newImage(loginKeys, 'images/parent_teacher.png', display.contentCenterX, loginKeys.y - 45)
parentTeacher:scale(0.3, 0.3)

for i = 1, 5, 1 do
	local curImage = display.newImage(loginKeys, 'images/empty_login.png', 40 + (i - 1) * 65, loginKeys.y + 220)
	curImage:scale(0.3, 0.3)
end

local loginButton = display.newImage(loginKeys, 'images/login.png', loginKeys.x + 400, loginKeys.y + 220)
loginButton:scale(0.3, 0.3)