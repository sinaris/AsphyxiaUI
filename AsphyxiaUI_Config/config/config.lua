local C = {}

C["asphyxia"] = {
	["layout"] = "asphyxia", -- unitframe style, choose from ( "asphyxia", "asphyxia2" "smelly" or "tukui" )
	["classicons"] = true,
}

C["general"] = {
	["backdropcolor"] = { 0, 0, 0 }, -- default backdrop color of panels
	["bordercolor"] = { .125, .125, .125 }, -- default border color of panels  
}

C["castbar"] = {
	["classcolor"] = true, -- classcolor
	["castbarcolor"] = { .150, .150, .150, 1 }, -- color if classcolor = false
	["nointerruptcolor"] = { 1, 0, 0, 1 }, -- color of casts which can't be interrupted
	
}

C["unitframes"] = {
	["charportrait"] = true,
	["cblatency"] = true,
	["unicolor"] = true,
	["targetauras"] = true,
}

C["chat"] = {
	["background"] = true
}

C["media"] = {
	["normTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\normTex]], -- texture used for tukui healthbar/powerbar/etc
	["glowTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\glowTex]], -- the glow text around some frame.
	["bubbleTex"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\bubbleTex]], -- unitframes combo points
	["copyicon"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\copy]], -- copy icon
	["blank"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\blank]], -- the main texture for all borders/panels.
	["switchlayoutheal"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\switch_layout_heal]], -- switch layout texture
	["switchlayoutdd"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\switch_layout_dd]], -- switch layout texture
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\medias\textures\asphyxia]], -- UI version logo 

	["bordercolor"] = C.general.bordercolor, -- border color of tukui panels
	["backdropcolor"] = C.general.backdropcolor, -- background color of tukui panels
}

PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_defensive]]
PET_PASSIVE_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_passive]]
PET_ATTACK_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_attack]]
PET_FOLLOW_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_follow]]
PET_WAIT_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_wait]]
PET_MOVE_TO_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_moveto]]
PET_ASSIST_TEXTURE = [[Interface\AddOns\AsphyxiaUI\medias\textures\icon_assist]]

TukuiEditedDefaultConfig = C