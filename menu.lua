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
		{"old", "yoyo", "no"},
		{"fox", "pot", "hot"},
		{"goat", "boat", "coat"},
		{"old", "cold", "gold"},
		{"cook", "wood", "foot"},
		{"work", "worms", "tractor"},
		{"most", "ghost", "postage"},
		{"blow", "snow", "throw"},
		{"boy", "toys", "oyster"},
		{"drop", "soap", "jeep"},
		{"nymph", "digraph", "triumph"},
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

	soundLetterImages = {
		short = {
					{
						{"a", "i", "u"}, 
						{"a", "i"}, 
						{"e", "o"}
					},
					{
						{"bat", "mittens", "bug"},
						{"ball", "taxi"},
						{"elf", "fox"}
					},
					{
						{2, 28, 149},
						{80, 29},
						{92, 122}
					}
				},

		long = {
					{
						{"a", "o"},
						{"e", "u"},
						{"i", "u"}
					},
					{
						{"ape", "old"},
						{"me", "cute"},
						{"ice", "tuba"}
					},
					{
						{1, 114},
						{14, 70},
						{27, 71}
					}
				},

		pairs = {
					{
						{"ai", "ay", "ee", "oi", "ou", "oy"},
						{"au", "ea", "ew", "oo", "ow"},
						{"aw", "ea", "oa", "oo", "ow"}
					},
					{
						{"tail", "jay", "bee", "coin", "house", "boy"},
						{"haul", "eat", "flew", "zoo", "blow"},
						{"saw", "head", "goat", "cook", "owl"}
					},
					{
						{81, 84, 94, 46, 50, 129},
						{83, 93, 19, 47, 128},
						{6, 16, 123, 125, 51}
					}
				},

		sounds_of_y = {
					{
						{"y"},
						{"y"},
						{"ey"}
					},
					{
						{"cry"},
						{"baby"},
						{"key"}
					},
					{
						{76},
						{154},
						{77}
					}
				},

		with_r = {
					{
						{"ar", "ir", "ur"},
						{"ar", "or"},
						{"er", "or"}
					},
					{
						{"arm", "bird", "burn"},
						{"bare", "corn"},
						{"fern", "work"}
					},
					{
						{82, 33, 72},
						{5, 48},
						{95, 126}
					}
				},

		schwas = {
					{
						{"a", "o"},
						{"e", "u"},
						{"i"}
					},
					{
						{"sofa", "lion"},
						{"camel", "bug"},
						{"rabbit"}
					},
					{
						{3, 45},
						{15, 149},
						{106}
					}
				},

		sounds_beginning = {
					{
						{"b", "f", "j", "m", "q", "t", "x"},
						{"c", "g", "k", "n", "r", "v", "y"},
						{"d", "h", "l", "p", "s", "w", "z"}
					},
					{
						{"boy", "fish", "jump", "monkey", "queen", "toe", "excavator"},
						{"cat", "goose", "key", "noise", "raccoons", "volcano", "yellow"},
						{"dog", "hug", "love", "puppy", "suitcase", "wagon", "zebra"}
					},
					{
						{7, 97, 111, 116, 55, 44, 152},
						{9, 22, 34, 118, 133, 150, 153},
						{90, 26, 113, 52, 134, 73, 155}
					}
				},

		sounds_ending = {
					{
						{"b", "g", "m", "r", "t"},
						{"d", "k", "n", "s", "x"},
						{"f", "l", "p", "s", "z"}
					},
					{
						{"cub", "frog", "swim", "door", "net"},
						{"bird", "elk", "rain", "bus", "fox"},
						{"scarf", "owl", "drop", "dogs", "quiz"}
					},
					{
						{85, 100, 39, 56, 67},
						{13, 112, 41, 57, 75},
						{20, 36, 130, 135, 78}
					}
				},

		hard_and_soft_c_and_g = {
					{
						{"c", "g"},
						{"c", "g"},
						{"g"}
					},
					{
						{"cat", "frog"},
						{"celery", "giraffe"},
						{"goose"}
					},
					{
						{9, 100},
						{87, 23},
						{22}
					}
				},

		blends_beginning = {
					{
						{"bl", "cr", "fr", "pl", "sk", "sn", "sw"},
						{"br", "dr", "gl", "pr", "sl", "sp", "tr"},
						{"cl", "fl", "gr", "sc", "sm", "st"}
					},
					{
						{"blow", "crab", "frog", "play", "skate", "snow", "swim"},
						{"bridge", "draw", "glad", "proud", "sled", "spill", "trunk"},
						{"claws", "flu", "grapes", "scarf", "small", "stop"}
					},
					{
						{8, 12, 21, 54, 138, 140, 66}, 
						{86, 91, 102, 132, 139, 63, 147},
						{89, 98, 103, 58, 62, 142}
					}
				}, 

		blends_ending = {
					{
						{"ft", "lt", "nk", "st"},
						{"ld", "mp", "nt"},
						{"lf", "nd", "sk"}
					},
					{
						{"gift", "colt", "tank", "fast"},
						{"old", "ump", "ant"},
						{"elf", "wind", "ask"}
					},
					{
						{99, 38, 120, 65},
						{114, 40, 43},
						{115, 119, 61}
					}
				},

		three_letter_blends = {
					{
						{"scr", "str"},
						{"spl"},
						{"spr"}
					},
					{
						{"scrub", "strong"},
						{"split"},
						{"spread"}
					},
					{
						{59, 143},
						{141},
						{64}
					}
				},

		silent = {
					{
						{"gh", "wr"},
						{"kn"},
						{"sc"}
					},
					{
						{"high", "wrap"},
						{"knot"},
						{"scent"}
					},
					{
						{24, 74},
						{35},
						{136}
					}
				},

		digraph_pairs_beginning = {
					{
						{"ch", "wh"},
						{"sh"},
						{"th"}
					},
					{
						{"chest", "white"},
						{"shapes"},
						{"throne"}
					},
					{
						{10, 151},
						{137},
						{68}
					}
				},

		digraph_pairs_ending = {
					{
						{"ch", "th"},
						{"ng"},
						{"sh"}
					},
					{
						{"beach", "moth"},
						{"wing"},
						{"bush"}
					},
					{
						{88, 146},
						{42},
						{60}
					}
				}
	}

	if composer.getVariable("submenu_table") == nil then
		composer.setVariable("submenu_table", soundLetterImages)
	end

	phonemeSounds = {
		"phoneme-A-long.mp3",
		"phoneme-A-short.mp3",
		"phoneme-A-schwa.mp3",
		"phoneme-A-AN.mp3",
		"phoneme-A-AR-long.mp3",
		"phoneme-A-AW.mp3",
		"phoneme-B-buh.mp3",
		"phoneme-B-BL.mp3",
		"phoneme-C-kuh.mp3",
		"phoneme-C-CH.mp3",
		"phoneme-C-CK.mp3",
		"phoneme-C-CR.mp3",
		"phoneme-D-duh.mp3",
		"phoneme-E-long.mp3",
		"phoneme-E-schwa.mp3",
		"phoneme-E-EA-short.m4a",
		"phoneme-E-EI.m4a",
		"phoneme-E-ET-stressed.mp3",
		"phoneme-E-EW.mp3",
		"phoneme-F-fuh.mp3",
		"phoneme-F-FR.mp3",
		"phoneme-G-guh.mp3",
		"phoneme-G-juh.mp3",
		"phoneme-G-GH-silent.mp3",
		"phoneme-G-GN-silent.mp3",
		"phoneme-H-huh.mp3",
		"phoneme-I-long.mp3",
		"phoneme-I-short.mp3",
		"phoneme-I-ee.mp3",
		"phoneme-I-IGH.mp3",
		"phoneme-I-IL-short.mp3",
		"phoneme-I-IND-long.mp3",
		"phoneme-I-IR.mp3",
		"phoneme-K-kuh.mp3",
		"phoneme-K-KN-silent.mp3",
		"phoneme-L-lll.mp3",
		"phoneme-L-LE.mp3",
		"phoneme-L-LT.mp3",
		"phoneme-M-mmm.mp3",
		"phoneme-M-MP.mp3",
		"phoneme-N-nnn.mp3",
		"phoneme-N-NG.mp3",
		"phoneme-N-NT.mp3",
		"phoneme-O-long.mp3",
		"phoneme-O-uh.mp3",
		"phoneme-O-OI.mp3",
		"phoneme-O-ew.mp3",
		"phoneme-O-OR-long.mp3",
		"phoneme-O-OST-short.mp3",
		"phoneme-O-OU.mp3",
		"phoneme-O-ow.mp3",
		"phoneme-P-puh.mp3",
		"phoneme-P-PH.mp3",
		"phoneme-P-PL.mp3",
		"phoneme-Q-qwuh.mp3",
		"phoneme-R-ruh.mp3",
		"phoneme-S-sss.mp3",
		"phoneme-S-SC.mp3",
		"phoneme-S-SCR.mp3",
		"phoneme-S-SH.mp3",
		"phoneme-S-SK.mp3",
		"phoneme-S-SM.mp3",
		"phoneme-S-SP.mp3",
		"phoneme-S-SPR.mp3",
		"phoneme-S-ST.mp3",
		"phoneme-S-SW.mp3",
		"phoneme-T-tttt.mp3",
		"phoneme-T-th.mp3",
		"phoneme-T-the.mp3",
		"phoneme-U-long.mp3",
		"phoneme-U-uu.mp3",
		"phoneme-U-UR.mp3",
		"phoneme-W-wuh.mp3",
		"phoneme-W-WR-silent.mp3",
		"phoneme-X-ks.mp3",
		"phoneme-Y-i.mp3",
		"phoneme-Y-ey.mp3",
		"phoneme-Z-zzz.mp3",
		"phoneme-A-long.mp3",
		"phoneme-A-ahh.mp3",
		"phoneme-A-AI.mp3",
		"phoneme-A-AR-short.mp3",
		"phoneme-A-AU.mp3",
		"phoneme-A-AY.mp3",
		"phoneme-B-buh.mp3",
		"phoneme-B-BR.mp3",
		"phoneme-C-sss.mp3",
		"phoneme-C-CH.mp3",
		"phoneme-C-CL.mp3",
		"phoneme-D-duh.mp3",
		"phoneme-D-DR.mp3",
		"phoneme-E-short.mp3",
		"phoneme-E-EA-long.mp3",
		"phoneme-E-EE.mp3",
		"phoneme-E-ER.mp3",
		"phoneme-E-ET-unstressed.m4a",
		"phoneme-F-fuh.mp3",
		"phoneme-F-FL.mp3",
		"phoneme-F-FT.mp3",
		"phoneme-G-guh.mp3",
		"phoneme-G-GH.mp3",
		"phoneme-G-GL.mp3",
		"phoneme-G-GR.mp3",
		"phoneme-H-silent.mp3",
		"phoneme-I-long.mp3",
		"phoneme-I-schwa.mp3",
		"phoneme-I-IE.m4a",
		"phoneme-I-IL-long.mp3",
		"phoneme-I-ILD.mp3",
		"phoneme-I-ION.mp3",
		"phoneme-J-juh.mp3",
		"phoneme-K-kuh.mp3",
		"phoneme-L-lll.mp3",
		"phoneme-L-LD.mp3",
		"phoneme-L-LF.mp3",
		"phoneme-M-mmm.mp3",
		"phoneme-M-MB-silent.mp3",
		"phoneme-N-nnn.mp3",
		"phoneme-N-ND.mp3",
		"phoneme-N-NK.mp3",
		"phoneme-O-long.mp3",
		"phoneme-O-short.mp3",
		"phoneme-O-OA.mp3",
		"phoneme-O-OLD.mp3",
		"phoneme-O-uuh.mp3",
		"phoneme-O-OR-schwa.m4a",
		"phoneme-O-OST-long.mp3",
		"phoneme-O-ohw.mp3",
		"phoneme-O-OY.mp3",
		"phoneme-P-puh.mp3",
		"phoneme-P-PH.mp3",
		"phoneme-P-PR.mp3",
		"phoneme-R-ruh.m4a",
		"phoneme-S-sss.mp3",
		"phoneme-S-zz.mp3",
		"phoneme-S-SC-silent.mp3",
		"phoneme-S-SH.mp3",
		"phoneme-S-SK.mp3",
		"phoneme-S-SL.mp3",
		"phoneme-S-SN.mp3",
		"phoneme-S-SPL.mp3",
		"phoneme-S-ST.mp3",
		"phoneme-S-STR.mp3",
		"phoneme-T-tttt.mp3",
		"phoneme-T-TCH-silent.mp3",
		"phoneme-T-th.mp3",
		"phoneme-T-TR.mp3",
		"phoneme-U-long.mp3",
		"phoneme-U-short.mp3",
		"phoneme-V-vv.mp3",
		"phoneme-W-WH.mp3",
		"phoneme-X-ks.mp3",
		"phoneme-Y-yuh.mp3",
		"phoneme-Y-e.mp3",
		"phoneme-Z-zzz.mp3"
	}

	if composer.getVariable("phoneme_sound_table") == nil then
		composer.setVariable("phoneme_sound_table", phonemeSounds)
	end

	puzzleImages = {
		"puzzle-A-long",
		"puzzle-A-short",
		"puzzle-A-schwa",
		"puzzle-A-AN",
		"puzzle-A-AR-long",
		"puzzle-A-AW",
		"puzzle-B-buh-begin",
		"puzzle-B-BL",
		"puzzle-C-kuh-begin",
		"puzzle-C-CH-begin",
		"puzzle-C-CK",
		"puzzle-C-CR",
		"puzzle-D-duh-end",
		"puzzle-E-long",
		"puzzle-E-schwa",
		"puzzle-E-EA-short",
		"puzzle-E-EI",
		"puzzle-E-ET-stressed",
		"puzzle-E-EW",
		"puzzle-F-fuh-end",
		"puzzle-F-FR",
		"puzzle-G-guh-begin",
		"puzzle-G-juh",
		"puzzle-G-GH-silent",
		"puzzle-G-GN-silent",
		"puzzle-H-huh-begin",
		"puzzle-I-long",
		"puzzle-I-short",
		"puzzle-I-ee",
		"puzzle-I-IGH",
		"puzzle-I-IL-short",
		"puzzle-I-IND-long",
		"puzzle-I-IR",
		"puzzle-K-kuh-begin",
		"puzzle-K-KN-silent",
		"puzzle-L-lll-end",
		"puzzle-L-LE",
		"puzzle-L-LT",
		"puzzle-M-mmm-end",
		"puzzle-M-MP",
		"puzzle-N-nnn-end",
		"puzzle-N-NG",
		"puzzle-N-NT",
		"puzzle-O-e",
		"puzzle-O-uh",
		"puzzle-O-OI",
		"puzzle-O-ew",
		"puzzle-O-OR-long",
		"puzzle-O-OST-short",
		"puzzle-O-OU",
		"puzzle-O-ow",
		"puzzle-P-puh-begin",
		"puzzle-P-PH-begin",
		"puzzle-P-PL",
		"puzzle-Q-qwuh-begin",
		"puzzle-R-ruh-end",
		"puzzle-S-sss-end",
		"puzzle-S-SC",
		"puzzle-S-SCR",
		"puzzle-S-SH-end",
		"puzzle-S-SK-end",
		"puzzle-S-SM",
		"puzzle-S-SP",
		"puzzle-S-SPR",
		"puzzle-S-ST-end",
		"puzzle-S-SW",
		"puzzle-T-tttt-end",
		"puzzle-T-th-begin",
		"puzzle-T-the",
		"puzzle-U-long",
		"puzzle-U-uu",
		"puzzle-U-UR",
		"puzzle-W-wuh-begin",
		"puzzle-W-WR-silent",
		"puzzle-X-ks-end",
		"puzzle-Y-i",
		"puzzle-Y-ey",
		"puzzle-Z-zzz-end",
		"puzzle-A-e",
		"puzzle-A-ahh",
		"puzzle-A-AI",
		"puzzle-A-AR-short",
		"puzzle-A-AU",
		"puzzle-A-AY",
		"puzzle-B-buh-end",
		"puzzle-B-BR",
		"puzzle-C-sss",
		"puzzle-C-CH-end",
		"puzzle-C-CL",
		"puzzle-D-duh-begin",
		"puzzle-D-DR",
		"puzzle-E-short",
		"puzzle-E-EA-long",
		"puzzle-E-EE",
		"puzzle-E-ER",
		"puzzle-E-ET-unstressed",
		"puzzle-F-fuh-begin",
		"puzzle-F-FL",
		"puzzle-F-FT",
		"puzzle-G-guh-end",
		"puzzle-G-GH",
		"puzzle-G-GL",
		"puzzle-G-GR",
		"puzzle-H-silent",
		"puzzle-I-e",
		"puzzle-I-schwa",
		"puzzle-I-IE",
		"puzzle-I-IL-long",
		"puzzle-I-ILD",
		"puzzle-I-ION",
		"puzzle-J-juh-begin",
		"puzzle-K-kuh-end",
		"puzzle-L-lll-begin",
		"puzzle-L-LD",
		"puzzle-L-LF",
		"puzzle-M-mmm-begin",
		"puzzle-M-MB-silent",
		"puzzle-N-nnn-begin",
		"puzzle-N-ND",
		"puzzle-N-NK",
		"puzzle-O-long",
		"puzzle-O-short",
		"puzzle-O-OA",
		"puzzle-O-OLD",
		"puzzle-O-uuh",
		"puzzle-O-OR-schwa",
		"puzzle-O-OST-long",
		"puzzle-O-ohw",
		"puzzle-O-OY",
		"puzzle-P-puh-end",
		"puzzle-P-PH-end",
		"puzzle-P-PR",
		"puzzle-R-ruh-begin",
		"puzzle-S-sss-begin",
		"puzzle-S-zz",
		"puzzle-S-SC-silent",
		"puzzle-S-SH-begin",
		"puzzle-S-SK-begin",
		"puzzle-S-SL",
		"puzzle-S-SN",
		"puzzle-S-SPL",
		"puzzle-S-ST-begin",
		"puzzle-S-STR",
		"puzzle-T-tttt-begin",
		"puzzle-T-TCH-silent",
		"puzzle-T-TH-end",
		"puzzle-T-TR",
		"puzzle-U-e",
		"puzzle-U-schwa",
		"puzzle-V-vv-begin",
		"puzzle-W-WH",
		"puzzle-X-ks-begin",
		"puzzle-Y-yuh",
		"puzzle-Y-e",
		"puzzle-Z-zzz-begin"
	}

	if composer.getVariable("puzzle_table") == nil then
		composer.setVariable("puzzle_table", puzzleImages)
	end

	if composer.getVariable("coins") == nil then
		composer.setVariable("coins", 10)
	end

	sceneGroup:insert(curScene)
end

scene:addEventListener("create", scene)

return scene