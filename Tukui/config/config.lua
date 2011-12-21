local S, C, L = unpack( select( 2, ... ) )

C["asphyxia"] = {
	["layout"] = "asphyxia4",
	["uf_fontsize"] = 10,
	["locationpanel"] = true,
	["cp_onmouseover"] = false,
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
	["autoscale"] = true,                               -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,                                 -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,                      -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["backdropcolor"] = { .0, .0, .0 },                 -- default backdrop color of panels
	["bordercolor"] = { .125, .125, .125 },             -- default border color of panels
	["blizzardreskin"] = true,                          -- reskin all Blizzard frames
}

C["unitframes"] = {
	-- general options
	["enable"] = true,                                  -- do i really need to explain this?
	["enemyhcolor"] = false,                            -- enemy target (players) color by hostility, very useful for healer.
	["unitcastbar"] = true,                             -- enable tukui castbar
	["cblatency"] = true,                               -- enable castbar latency
	["cbicons"] = true,                                 -- enable icons on castbar
	["cbspark"] = true,									-- enable castbar spark
	["classiccombo"] = false,                           -- display classic combo points (from Tukui 13 or less)
	["movecombobar"] = true,                            -- display the new combo bar (t14+) from target to player (ROGUE ONLY)
	["auratimer"] = true,                               -- enable timers on buffs/debuffs
	["auratextscale"] = 11,                             -- the font size of buffs/debuffs timers on unitframes
	["targetauras"] = true,                             -- enable auras on target unit frame
	["lowThreshold"] = 20,                              -- global low threshold, for low mana warning.
	["targetpowerpvponly"] = true,                      -- enable power text on pvp target only
	["totdebuffs"] = false,                             -- enable tot debuffs (high reso only)
	["showtotalhpmp"] = false,                          -- change the display of info text on player and target with XXXX/Total.
	["showsmooth"] = true,                              -- enable smooth bar
	["charportrait"] = true,                            -- do i really need to explain this?
	["classicon"] = true,								-- class icon on unitframes
	["maintank"] = false,                               -- enable maintank
	["mainassist"] = false,                             -- enable mainassist
	["unicolor"] = true,                                -- enable unicolor theme
	["combatfeedback"] = true,                          -- enable combattext on player and target.
	["playeraggro"] = true,                             -- color player border to red if you have aggro on current target.
	["healcomm"] = false,                               -- enable healprediction support.
	["onlyselfdebuffs"] = false,                        -- display only our own debuffs applied on target
	["showfocustarget"] = true,                         -- show focus target
	["bordercolor"] = { 0, 0, 0, 1 },                   -- unit frames panel border color
	["extendedpet"] = true,								-- extended pet frame
	["pettarget"] = true,								-- show pet target frame
	["showsolo"] = true,                        		-- show raid frames when solo (DPS only)
	["gradienthealth"] = true,                          -- change raid health color based on health percent.
	["gradient"] = {                                    -- health gradient color if unicolor is true.
		4.5, 0.1, 0.1, -- R, G, B (low HP)
		0.6, 0.3, 0.3, -- R, G, B (medium HP)
		0.2, 0.2, 0.2, -- R, G, B (high HP)
	},

	-- raid layout (if one of them is enabled)
	["showrange"] = true,                               -- show range opacity on raidframes
	["raidalphaoor"] = 0.3,                             -- alpha of unitframes when unit is out of range
	["gridonly"] = true,                                -- enable grid only mode for all healer mode raid layout.
	["showsymbols"] = true,	                            -- show symbol.
	["aggro"] = true,                                   -- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,                     -- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,                      -- enable vertical grow on health bar for grid mode.
	["showplayerinparty"] = false,                      -- show my player frame in party
	["gridscale"] = 1,                                  -- set the healing grid scaling
	["gridvertical"] = false,                           -- grid group displayed vertically
	
	-- boss frames
	["showboss"] = true,                                -- enable boss unit frames for PVELOL encounters.

	-- priest only plugin
	["weakenedsoulbar"] = true,                         -- show weakened soul bar
	
	-- class bar
	["classbar"] = true,                                -- enable tukui classbar over player unit
}

C["arena"] = {
	["unitframes"] = true,                              -- enable tukz arena unitframes (requirement : tukui unitframes enabled)
}

C["auras"] = {
	["player"] = true,                                  -- enable tukui buffs/debuffs
	["consolidate"] = false,                             -- enable downpdown menu with consolidate buff
	["flash"] = false,                                   -- flash warning for buff with time < 30 sec
}

C["actionbar"] = {
	["enable"] = true,                                  -- enable tukui action bars
	["hotkey"] = true,                                  -- enable hotkey display because it was a lot requested
	["hideshapeshift"] = false,                         -- hide shapeshift or totembar because it was a lot requested.
	["showgrid"] = true,                                -- show grid on empty button
	["buttonsize"] = 27,                                -- normal buttons size
	["petbuttonsize"] = 29,                             -- pet & stance buttons size
	["stancebuttonsize"] = 27,							-- pet & stance buttons size
	["buttonspacing"] = 4,                              -- buttons spacing
	["vertical_rightbars"] = false,						-- vertical or horizontal right bars
	["vertical_shapeshift"] = false,					-- (NOT FOR SHAMANS/TOTEMS) vertical or horizontal shapeshift bar
	["mouseover_shapeshift"] = false,					-- shapeshift bar on mouseover
	["mainswap"] = false,								-- swap bottom actionbars (main bar on top)
	["macrotext"] = false,								-- display macro text on buttons.
	["ownshdbar"] = false,                              -- use a complete new stance bar for shadow dance (rogue only)
}

C["castbar"] = {
	["classcolor"] = true,								-- classcolor
	["castbarcolor"] = { .150, .150, .150, 1 },			-- color if classcolor = false
	["nointerruptcolor"] = { 1, 0, 0, 1 },				-- color of casts which can't be interrupted
	
}

C["sCombo"] = {
	["enable"] = true,									-- Enable sCombo-Addon for combopoints instead of default cp-display
	["energybar"] = false,								-- show energy-Bar below cp bar
}

C["bags"] = {
	["enable"] = true,                                  -- enable an all in one bag mod that fit tukui perfectly
}

C["loot"] = {
	["lootframe"] = true,                               -- reskin the loot frame to fit tukui
	["rolllootframe"] = true,                           -- reskin the roll frame to fit tukui
	["autogreed"] = true,                               -- auto-dez or auto-greed item at max level, auto-greed Frozen orb
}

C["cooldown"] = {
	["enable"] = true,                                  -- do i really need to explain this?
	["treshold"] = 8,                                   -- show decimal under X seconds and text turn red
}

C["datatext"] = {
	["fps_ms"] = 0,                                     -- show fps and ms on panels
	["system"] = 0,                                     -- show total memory and others systems infos on panels
	["bags"] = 5,                                       -- show space used in bags on panels
	["gold"] = 6,                                       -- show your current gold on panels
	["wowtime"] = 12,                                    -- show time on panels
	["guild"] = 1,                                      -- show number on guildmate connected on panels
	["dur"] = 0,                                        -- show your equipment durability on panels.
	["friends"] = 2,                                    -- show number of friends connected.
	["dps_text"] = 0,                                   -- show a dps meter on panels
	["hps_text"] = 0,                                   -- show a heal meter on panels
	["power"] = 7,                                      -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 8,                                      -- show your haste rating on panels.
	["crit"] = 9,                                       -- show your crit rating on panels.
	["avd"] = 0,                                        -- show your current avoidance against the level of the mob your targeting
	["armor"] = 0,                                      -- show your armor value against the level mob you are currently targeting
	["currency"] = 0,                                   -- show your tracked currency on panels
	["hit"] = 11,                                        -- show hit rating
	["mastery"] = 10,                                    -- show mastery rating
	["micromenu"] = 4,                                  -- add a micro menu thought datatext
	["regen"] = 0,                                      -- show mana regeneration
	["talent"] = 0,                                     -- show talent
	["calltoarms"] = 3,                                 -- show dungeon and call to arms
	["expertise"] = 0, -- NEED TRANSLATION
	["profession"] = 1, -- NEED TRANSLATION

	["battleground"] = true,                            -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	["time24"] = true,                                  -- set time to 24h format.
	["localtime"] = false,                              -- set time to local time instead of server time.
	["fontsize"] = 12,                                  -- font size for panels.

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
	["enable"] = true,                                  -- blah
	["whispersound"] = true,                            -- play a sound when receiving whisper
	["background"] = true,
	["width"] = 378,									-- adjust the chatframe width
	["height"] = 175,									-- adjust the chatframe height
	["justifyRight"] = true,							-- set right chat frame text to the right	
}

C["nameplate"] = {
	["enable"] = true,                                  -- enable nice skinned nameplates that fit into tukui
	["showhealth"] = true,				                -- show health text on nameplate
	["enhancethreat"] = true,			                -- threat features based on if your a tank or not
	["combat"] = false,					                -- only show enemy nameplates in-combat.
	["goodcolor"] = { 75 / 255, 175 / 255, 76 / 255 },	        -- good threat color (tank shows this with threat, everyone else without)
	["badcolor"] = {0.78, 0.25, 0.25},			        -- bad threat color (opposite of above)
	["transitioncolor"] = {218/255, 197/255, 92/255},	-- threat color when gaining threat
	["trackcc"] = true,									--track all CC debuffs
	["trackdebuffs"] = true,							--track players debuffs only (debuff list derived from classtimer spell list)
}

C["tooltip"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	["hidecombat"] = false,                             -- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,                            -- always hide action bar buttons tooltip.
	["hideuf"] = false,                                 -- hide tooltip on unitframes
	["cursor"] = false,                                 -- tooltip via cursor only
}

C["merchant"] = {
	["sellgrays"] = true,                               -- automaticly sell grays?
	["autorepair"] = true,                              -- automaticly repair?
	["sellmisc"] = true,                                -- sell defined items automatically
	["guildrepair"] = true, -- NEED TRANSLATION
}

C["error"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	filter = {                                          -- what messages to not hide
		[INVENTORY_FULL] = true,                        -- inventory is full will not be hidden by default
	},
}

C["invite"] = { 
	["autoaccept"] = true,                              -- auto-accept invite from guildmate and friends.
}

C["interruptanncounce"] = {
	["enable"] = true,
}

C["buffreminder"] = {
	["enable"] = true,                                  -- this is now the new innerfire warning script for all armor/aspect class.
	["sound"] = true,                                   -- enable warning sound notification for reminder.
	["raidbuffreminder"] = true,					-- enable panel with missing raid buffs next to the minimap
}