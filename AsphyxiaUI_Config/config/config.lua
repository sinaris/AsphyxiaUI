local C = {}

C["asphyxia"] = {
	["layout"] = "asphyxia", -- unitframe style, choose from ( "asphyxia", "asphyxia2" "smelly" or "tukui" )
}

C["Addon_Skins"] = {
	["background"] = false,
	["combat_toggle"] = false,
	["Recount"] = true,
	["Skada"] = true,
	["Omen"] = true,
	["TinyDPS"] = true,
	["DBM"] = true,
	["bigwigs"] = true,
	["embedright"] = "None",
	["embedrighttoggle"] = true,
}

C["actionbar"] = {
	["hideshapeshift"] = false,
	["buttonsize"] = 27,
	["petbuttonsize"] = 27,
	["stancebuttonsize"] = 27,
	["buttonspacing"] = 4,
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	["mainswap"] = true,
}

C["buffreminder"] = {
	["raidbuffreminder"] = true
}

C["castbar"] = {
	["classcolor"] = true,
	["castbarcolor"] = { .150, .150, .150, 1 },
	["nointerruptcolor"] = { 1, 0, 0, 1 },
	
}

C["chat"] = {
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
}

C["databars"] = {
	["settings"] = {
		["vertical"] = false,
		["height"] = 17,
		["width"] = 100,
		["spacing"] = 3,
		["padding"] = 3,
	},
	["framerate"] = 1,
	["latency"] = 2,
	["memory"] = 3,
	["durability"] = 4,
	["currency"] = true,
	["reputation"] = true,
	["reps"] = {
		"Hellscream's Reach",
		"Therazane",
		"Dragonmaw Clan",
		"Guardians of Hyjal",
		"Systematic Chaos",
	},
}

C["datatext"] = {
	["fps_ms"] = 0,
	["system"] = 0,
	["bags"] = 5,
	["gold"] = 6,
	["wowtime"] = 12,
	["guild"] = 1,
	["dur"] = 0,
	["friends"] = 2,
	["dps_text"] = 0,
	["hps_text"] = 0,
	["power"] = 7,
	["haste"] = 8,
	["crit"] = 9,
	["avd"] = 0,
	["armor"] = 0,
	["currency"] = 0,
	["hit"] = 11,
	["mastery"] = 10,
	["micromenu"] = 4,
	["regen"] = 0,
	["talent"] = 0,
	["calltoarms"] = 3,

	["battleground"] = true,
	["time24"] = true,
	["localtime"] = true,
	["fontsize"] = 12,

	["enable_specswitcher"] = true,
	["bgannouncer"] = false,
}

C["general"] = {
	["backdropcolor"] = { 0, 0, 0 },
	["bordercolor"] = { .125, .125, .125 },

	["bigwigsreskin"] = false, -- disabled because we need out own addskin
	["dbmreskin"] = false, -- disabled because we need out own addskin
	["dxereskin"] = false, -- disabled because we need out own addskin
	["omenreskin"] = false, -- disabled because we need out own addskin
	["recountreskin"] = false, -- disabled because we need out own addskin
	["skadareskin"] = false, -- disabled because we need out own addskin
	["tinydpsreskin"] = false, -- disabled because we need out own addskin
}

C["interruptanncounce"] = {
	["enable"] = true,
}


C["map"] = {
	["location_panel"] = true,
}

C["sCombo"] = {
	["enable"] = true,									-- Enable sCombo-Addon for combopoints instead of default cp-display
	["energybar"] = false,								-- show energy-Bar below cp bar
}

C["unitframes"] = {
	["charportrait"] = true,
	["cblatency"] = true,
	["unicolor"] = true,
	["targetauras"] = true,
	["hideunitframes"] = false,
	["classicon"] = true,
	["classiccombo"] = false,

	["gradienthealth"] = true,
	["gradient"] = {
		4.5, 0.1, 0.1,
		0.6, 0.3, 0.3,
		0.2, 0.2, 0.2,
	},
}

C["media"] = {
	["normTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\normTex]],
	["glowTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\glowTex]],
	["bubbleTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\bubbleTex]],
	["copyicon"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\copy]],
	["blank"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\blank]],
	["switchlayoutheal"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\switch_layout_heal]],
	["switchlayoutdd"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\switch_layout_dd]],
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\asphyxia]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,

	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_defensive]]
PET_PASSIVE_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_passive]]
PET_ATTACK_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_attack]]
PET_FOLLOW_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_follow]]
PET_WAIT_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_wait]]
PET_MOVE_TO_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_moveto]]
PET_ASSIST_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_assist]]

TukuiEditedDefaultConfig = C