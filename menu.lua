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
		{"ump", "chimp", "camp"},
		{"rain", "van", "fin"},
		{"wing", "bang", "strong"},
		{"ant", "tent", "point"},
		{"toe", "doe", "hoe"},
		{"lion", "oven", "wagon"},
		{"coin", "point", "choice"},
		{"zoo", "moon", "hoof"},
		{"corn", "horns", "orca"},
		{"cost", "frost", "ostrich"},
		{"house", "mouth", "proud"},
		{"owl", "cow", "town"},
		{"puppy", "penguin", "pie"},
		{"phone", "phonics", "phantom"},
		{"play", "plug", "plum"},
		{"queen", "question", "quick"},
		{"door", "tiger", "polar bear"},
		{"bus", "dress", "grapes"},
		{"scarf", "scold", "scare"},
		{"scrub", "scratch", "scream"},
		{"bush", "wash", "leash"},
		{"ask", "desk", "tusk"},
		{"small", "smell", "smile"},
		{"spill", "sports", "spider"},
		{"spread", "spruce", "sprain"},
		{"fast", "rest", "cast"},
		{"swim", "swing", "swan"},
		{"net", "paint", "tent"},
		{"throne", "thieves", "throw"},
		{"them", "there", "these"},
		{"cute", "bugle", "huge"},
		{"tuba", "rude", "flu"},
		{"burn", "surf", "nurse"},
		{"wagon", "wolf", "wind"},
		{"wrap", "write", "wrong"},
		{"fox", "ax", "six"},
		{"cry", "fly", "sky"},
		{"key", "money", "monkey"},
		{"quiz", "prize", "freeze"},
		{"plane", "cake", "ape"},
		{"ball", "fall", "swan"},
		{"tail", "nail", "rainbow"},
		{"arm", "stars", "barn"},
		{"haul", "gauze", "faucet"},
		{"jay", "ray", "play"},
		{"cub", "crab", "cobweb"},
		{"bridge", "broom", "brush"},
		{"celery", "face", "balance"},
		{"beach", "catch", "sasquatch"},
		{"claws", "clam", "climb"},
		{"dog", "drum", "door"},
		{"draw", "drop", "bass drum"},
		{"elf", "bed", "net"},
		{"eat", "beak", "leaf"},
		{"bee", "tree", "jeep"},
		{"fern", "tiger", "zipper"},
		{"target", "hornet", "piglet"},
		{"fish", "fox", "foot"},
		{"flu", "fly", "flag"},
		{"gift", "soft", "left"},
		{"frog", "plug", "bug"},
		{"laugh", "tough", "rough"},
		{"glad", "glum", "glow"},
		{"grapes", "grow", "greyhound"},
		{"hour", "ghost", "rhyme"},
		{"tie", "pie", "kite"},
		{"rabbit", "pencil", "robin"},
		{"thief", "collie", "diesel truck"},
		{"wild", "child", "pilot"},
		{"wild", "child", "mild"},
		{"vision", "cushion", "fashion"},
		{"jump", "joy", "jeep"},
		{"elk", "pick", "shark"},
		{"love", "leaf", "lion"},
		{"old", "wild", "build"},
		{"elf", "calf", "wolf"},
		{"monkey", "mole", "mermaid"},
		{"lamb", "comb", "thumb"},
		{"noise", "nail", "nest"},
		{"wind", "pond", "hand"},
		{"tank", "pink", "trunk"},
		{"old", "yo-yo", "no"},
		{"fox", "pot", "hot"},
		{"goat", "boat", "coat"},
		{"old", "cold", "gold"},
		{"cook", "wood", "foot"},
		{"work", "worms", "tractor"},
		{"most", "ghost", "postage"},
		{"blow", "snow", "throw"},
		{"boy", "toys", "oyster"},
		{"drop", "soap", "jeep"},
		{"nymph", "diagraph", "triumph"},
		{"proud", "prize", "protect"},
		{"raccoons", "robot", "run"},
		{"suitcase", "say", "sneak"},
		{"dogs", "skis", "boots"},
		{"scent", "scene", "science"},
		{"shapes", "sheep", "shark"},
		{"skate", "skunk", "ski"},
		{"sled", "slip", "slow"},
		{"snow", "sneak", "snake"},
		{"split", "splat", "splash"},
		{"stop", "step", "stick"},
		{"strong", "straw", "string"},
		{"toe", "toys", "tail"},
		{"pitch", "catch", "match"},
		{"moth", "path", "teeth"},
		{"trunk", "tractor", "tricky"},
		{"blue", "hues", "glue"},
		{"bug", "bus", "cut"},
		{"volcano", "van", "voice"},
		{"white", "whiskers", "whale"},
		{"excavator", "ax", "exam"},
		{"yellow", "yoyo", "yawn"},
		{"baby", "candy", "lazy"},
		{"zebra", "zipper", "zoo"}
	}

	if composer.getVariable("sounds_table") == nil then
		composer.setVariable("sounds_table", soundImages)
	end

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene