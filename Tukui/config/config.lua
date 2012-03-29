local S, C, L = unpack( select( 2, ... ) )

C["asphyxia"] = {
	["layout"] = "asphyxia",
	["uf_fontsize"] = 10,
	["locationpanel"] = true,
	["cp_onmouseover"] = false,
	["screensaver"] = false,
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
	["embedright"] = "Skada",
	["embedrighttoggle"] = true,
}

C["general"] = {
	["autoscale"] = true,
	["uiscale"] = 0.71,
	["overridelowtohigh"] = false,
	["backdropcolor"] = { .0, .0, .0 },
	["bordercolor"] = { .125, .125, .125 },
	["blizzardreskin"] = true,
}

C["unitframes"] = {
	["enable"] = true,
	["enemyhcolor"] = false,
	["unitcastbar"] = true,
	["cblatency"] = true,
	["cbicons"] = true,
	["cbspark"] = true,
	["classiccombo"] = false,
	["movecombobar"] = true,
	["auratimer"] = true,
	["auratextscale"] = 11,
	["targetauras"] = true,
	["lowThreshold"] = 20,
	["targetpowerpvponly"] = true,
	["totdebuffs"] = false,
	["showtotalhpmp"] = false,
	["showsmooth"] = true,
	["charportrait"] = true,
	["classicon"] = true,
	["maintank"] = false,
	["mainassist"] = false,
	["unicolor"] = true,
	["combatfeedback"] = true,
	["playeraggro"] = true,
	["healcomm"] = false,
	["onlyselfdebuffs"] = false,
	["showfocustarget"] = true,
	["bordercolor"] = { 0, 0, 0, 1 },
	["extendedpet"] = true,
	["pettarget"] = true,
	["showsolo"] = true,
	["gradienthealth"] = true,
	["gradient"] = {
		4.5, 0.1, 0.1,
		0.6, 0.3, 0.3,
		0.2, 0.2, 0.2,
	},

	["showrange"] = true,
	["raidalphaoor"] = 0.3,
	["gridonly"] = true,
	["showsymbols"] = true,
	["aggro"] = true,
	["raidunitdebuffwatch"] = true,
	["gridhealthvertical"] = true,
	["showplayerinparty"] = false,
	["gridscale"] = 1,
	["gridvertical"] = false,
	["showboss"] = true,
	["weakenedsoulbar"] = true,
	["classbar"] = true,
	["swingtimer"] = false,
	["vegeancebar"] = true,
	["fader"] = true,
}

C["arena"] = {
	["unitframes"] = true,
}

C["auras"] = {
	["player"] = true,
	["consolidate"] = false,
	["flash"] = false,
}

C["actionbar"] = {
	["enable"] = true,
	["hotkey"] = true,
	["hideshapeshift"] = false,
	["showgrid"] = true,
	["buttonsize"] = 27,
	["petbuttonsize"] = 29,
	["stancebuttonsize"] = 27,
	["buttonspacing"] = 4,
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	["mouseover_shapeshift"] = false,
	["mainswap"] = false,
	["macrotext"] = false,
	["ownshdbar"] = false,
}

C["castbar"] = {
	["classcolor"] = true,
	["castbarcolor"] = { .150, .150, .150, 1 },
	["nointerruptcolor"] = { 1, 0, 0, 1 },
	["ticks"] = true,
	["tickscolor"] = { 1, 0, 0, 1 },
}

C["sCombo"] = {
	["enable"] = true,
	["energybar"] = false,
}

C["bags"] = {
	["enable"] = true,
}

C["loot"] = {
	["lootframe"] = true,
	["rolllootframe"] = true,
	["autogreed"] = true,
}

C["cooldown"] = {
	["enable"] = true,
	["treshold"] = 8,
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
	["expertise"] = 0,
	["profession"] = 1,

	["battleground"] = true,
	["time24"] = true,
	["localtime"] = false,
	["fontsize"] = 12,

	["classcolor"] = false,
	["enable_specswitcher"] = true,
	["bgannouncer"] = false,
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

C["chat"] = {
	["enable"] = true,
	["whispersound"] = true,
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
	["justifyRight"] = true,
}

C["nameplate"] = {
	["enable"] = true,
	["showhealth"] = true,
	["enhancethreat"] = true,
	["combat"] = false,
	["goodcolor"] = { 75 / 255, 175 / 255, 76 / 255 },
	["badcolor"] = { 0.78, 0.25, 0.25 },
	["transitioncolor"] = { 218 / 255, 197 / 255, 92 / 255 },
	["trackcc"] = true,
	["trackdebuffs"] = true,
}

C["tooltip"] = {
	["enable"] = true,
	["hidecombat"] = false,
	["hidebuttons"] = false,
	["hideuf"] = false,
	["cursor"] = false,
}

C["merchant"] = {
	["sellgrays"] = true,
	["autorepair"] = true,
	["sellmisc"] = true,
	["guildrepair"] = true,
}

C["error"] = {
	["enable"] = true,
	filter = {
		[INVENTORY_FULL] = true,
	},
}

C["invite"] = { 
	["autoaccept"] = true,
}

C["interruptanncounce"] = {
	["enable"] = true,
}

C["buffreminder"] = {
	["enable"] = true,
	["sound"] = true,
	["raidbuffreminder"] = true,
}

C["raidcooldowns"] = {
	["enable"] = true, -- enable raidcooldownmonitor
	["raid"] = true, -- display bars in raid
	["party"] = false, -- display bars in party
	["arena"] = false, -- display bars in arena
}