--[[
	Script from Epicgrimm - based on Elv's code
]]--

local T, C, L = unpack(Tukui)

-- Settings
local specialbuff = 80398
local position = { "LEFT", TukuiMinimap, "RIGHT", 2, 0 }
local font = C["media"].pixelfont
local fontsize = C["datatext"].fontsize
local fontstyle = "MONOCHROMEOUTLINE"
local hoverovercolor = {.4, .4, .4}

--Locals
local flaskbuffs = {
		94160, --"Flask of Flowing Water"
		79469, --"Flask of Steelskin"
		79470, --"Flask of the Draconic Mind"
		79471, --"Flask of the Winds
		79472, --"Flask of Titanic Strength"
		79638, --"Flask of Enhancement-STR"
		79639, --"Flask of Enhancement-AGI"
		79640, --"Flask of Enhancement-INT"
		92679, --Flask of battle
}

local battleelixirbuffs = {
		--Scrolls
		89343, --Agility
		63308, --Armor 
		89347, --Int
		89342, --Spirit
		63306, --Stam
		89346, --Strength

		--Elixirs
		79481, --Hit
		79632, --Haste
		79477, --Crit
		79635, --Mastery
		79474, --Expertise
		79468, --Spirit
}

local guardianelixirbuffs = {
		79480, --Armor
		79631, --Resistance+90
}

local foodbuffs = {
		87545, --90 STR
		87546, --90 AGI
		87547, --90 INT
		87548, --90 SPI
		87549, --90 MAST
		87550, --90 HIT
		87551, --90 CRIT
		87552, --90 HASTE
		87554, --90 DODGE
		87555, --90 PARRY
		87635, --90 EXP
		87556, --60 STR
		87557, --60 AGI
		87558, --60 INT
		87559, --60 SPI
		87560, --60 MAST
		87561, --60 HIT
		87562, --60 CRIT
		87563, --60 HASTE
		87564, --60 DODGE
		87634, --60 EXP
		87554, --Seafood Feast
}
	
local battleelixired	
local guardianelixired	

--Setup Caster Buffs
local function SetCasterOnlyBuffs()
	Spell3Buff = { --Total Stats
		1126, -- "Mark of the wild"
		90363, --"Embrace of the Shale Spider"
		20217, --"Greater Blessing of Kings",
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding
		6307, -- Blood Pact
		90364, -- Qiraji Fortitude
		72590, -- Drums of fortitude
		21562, -- Fortitude
	}
	Spell5Buff = { --Total Mana
		61316, --"Dalaran Brilliance"
		1459, --"Arcane Brilliance"
	}
	Spell6Buff = { --Mana Regen
		5675, --"Mana Spring Totem"
		19740, --"Blessing of Might"
	}
end

--Setup everyone else's buffs
local function SetBuffs()
	Spell3Buff = { --Total Stats
		1126, -- "Mark of the wild"
		90363, --"Embrace of the Shale Spider"
		20217, --"Greater Blessing of Kings",
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding
		6307, -- Blood Pact
		90364, -- Qiraji Fortitude
		72590, -- Drums of fortitude
		21562, -- Fortitude
	}
	Spell5Buff = { --Total Mana
		61316, --"Dalaran Brilliance"
		1459, --"Arcane Brilliance"
	}
	Spell6Buff = { --Total AP
		19740, --"Blessing of Might" placing it twice because i like the icon better :D code will stop after this one is read, we want this first 
		30808, --"Unleashed Rage"
		53138, --Abom Might
		19506, --Trushot
		19740, --"Blessing of Might"
	}
end


-- we need to check if you have two differant elixirs if your not flasked, before we say your not flasked
local function CheckElixir(unit)
	if (battleelixirbuffs and battleelixirbuffs[1]) then
		for i, battleelixirbuffs in pairs(battleelixirbuffs) do
			local spellname = select(1, GetSpellInfo(battleelixirbuffs))
			if UnitAura("player", spellname) then
				FlaskFrame.t:SetTexture(select(3, GetSpellInfo(battleelixirbuffs)))
				battleelixired = true
				break
			else
				battleelixired = false
			end
		end
	end
	
	if (guardianelixirbuffs and guardianelixirbuffs[1]) then
		for i, guardianelixirbuffs in pairs(guardianelixirbuffs) do
			local spellname = select(1, GetSpellInfo(guardianelixirbuffs))
			if UnitAura("player", spellname) then
				guardianelixired = true
				if not battleelixired then
					FlaskFrame.t:SetTexture(select(3, GetSpellInfo(guardianelixirbuffs)))
				end
				break
			else
				guardianelixired = false
			end
		end
	end	
	
	if guardianelixired == true and battleelixired == true then
		FlaskFrame:SetAlpha(1)
		return
	else
		FlaskFrame:SetAlpha(0.2)
	end
end

--Main Script
RaidReminderShown = true
local function OnAuraChange(self, event, arg1, unit)
	if (event == "UNIT_AURA" and arg1 ~= "player") then 
		return
	end
	
	--If We're a caster we may want to see differant buffs
	if T.Role == "Caster" then 
		SetCasterOnlyBuffs() 
	else
		SetBuffs()
	end
	
	--Start checking buffs to see if we can find a match from the list
	if (flaskbuffs and flaskbuffs[1]) then
		FlaskFrame.t:SetTexture(select(3, GetSpellInfo(flaskbuffs[1])))
		for i, flaskbuffs in pairs(flaskbuffs) do
			local spellname = select(1, GetSpellInfo(flaskbuffs))
			if UnitAura("player", spellname) then
				FlaskFrame.t:SetTexture(select(3, GetSpellInfo(flaskbuffs)))
				FlaskFrame:SetAlpha(1)
				break
			else
				CheckElixir()
			end
		end
	end
	
	if (foodbuffs and foodbuffs[1]) then
		FoodFrame.t:SetTexture(select(3, GetSpellInfo(foodbuffs[1])))
		for i, foodbuffs in pairs(foodbuffs) do
			local spellname = select(1, GetSpellInfo(foodbuffs))
			if UnitAura("player", spellname) then
				FoodFrame:SetAlpha(1)
				FoodFrame.t:SetTexture(select(3, GetSpellInfo(foodbuffs)))
				break
			else
				FoodFrame:SetAlpha(0.2)
			end
		end
	end
	
	for i, Spell3Buff in pairs(Spell3Buff) do
		local spellname = select(1, GetSpellInfo(Spell3Buff))
		if UnitAura("player", spellname) then
			Spell3Frame:SetAlpha(1)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
			break
		else
			Spell3Frame:SetAlpha(0.2)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
		end
	end
	
	for i, Spell4Buff in pairs(Spell4Buff) do
		local spellname = select(1, GetSpellInfo(Spell4Buff))
		if UnitAura("player", spellname) then
			Spell4Frame:SetAlpha(1)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			break
		else
			Spell4Frame:SetAlpha(0.2)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
		end
	end
	
	for i, Spell5Buff in pairs(Spell5Buff) do
		local spellname = select(1, GetSpellInfo(Spell5Buff))
		if UnitAura("player", spellname) then
			Spell5Frame:SetAlpha(1)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			break
		else
			Spell5Frame:SetAlpha(0.2)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
		end
	end	

	for i, Spell6Buff in pairs(Spell6Buff) do
		local spellname = select(1, GetSpellInfo(Spell6Buff))
		if UnitAura("player", spellname) then
			Spell6Frame:SetAlpha(1)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			break
		else
			Spell6Frame:SetAlpha(0.2)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
		end
	end	
	
	local spellname = select(1, GetSpellInfo(specialbuff))
	if UnitAura("player", spellname) then
		SpecialBuffFrame:SetAlpha(1)
		SpecialBuffFrame.t:SetTexture(select(3, GetSpellInfo(specialbuff)))
	else
		SpecialBuffFrame:SetAlpha(0.2)
		SpecialBuffFrame.t:SetTexture(select(3, GetSpellInfo(specialbuff)))
	end
end

local fsize = TukuiMinimap:GetHeight()
local bsize = ((fsize - 13) / 7)

--Create the Main bar
local raidbuff_reminder = CreateFrame("Frame", "RaidBuffReminder", TukuiMinimap)
raidbuff_reminder:CreatePanel("Default", bsize + 4, fsize, "LEFT", TukuiMinimap, "RIGHT", 2, 0)
raidbuff_reminder:Point(unpack(position))
raidbuff_reminder:SetFrameLevel(Minimap:GetFrameLevel() + 2)
raidbuff_reminder:CreateShadow("Default")
raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuff_reminder:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)

--Function to create buttons
local function CreateButton(name, relativeTo, firstbutton)
	local button = CreateFrame("Frame", name, RaidBuffReminder)
	if firstbutton == true then
		button:CreatePanel("Default", bsize, bsize, "TOP", relativeTo, "TOP", 0, -2)
	else
		button:CreatePanel("Default", bsize, bsize, "TOP", relativeTo, "BOTTOM", 0, -1)
	end
	button:SetFrameLevel(RaidBuffReminder:GetFrameLevel() + 2)
	
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
end

--Create Buttons
do
	CreateButton("FlaskFrame", RaidBuffReminder, true)
	CreateButton("FoodFrame", FlaskFrame, false)
	CreateButton("Spell3Frame", FoodFrame, false)
	CreateButton("Spell4Frame", Spell3Frame, false)
	CreateButton("Spell5Frame", Spell4Frame, false)
	CreateButton("Spell6Frame", Spell5Frame, false)
	CreateButton("SpecialBuffFrame", Spell6Frame, false)
end

-- Adding in ALL RAID BUFFS
local AllBuffs = {
	["melee10"] = {
		8512,						-- Windfury
		55610,						-- Imp Icy Talons
		53290,						-- Hunting Party
	},

	["crit5"] = {
		17007,						-- Leader of the Pack
		51470,						-- Ele Oath
		51701,						-- Honor Amoung Thieves
		29801,						-- Rampage
	},

	["ap10"] = {
		30808,						-- Unleashed Rage
		19506,						-- Trueshot Aura
		53138,						-- Abomination's Might
		19740,						-- Blessing of Might
	},

	["spellhaste"] = {
		24907,						-- Moonkin Form
		49868,						-- Shadow Form
		3738,						-- Wrath of Air
	},

	["sp10"] = {
		47236,						-- Demonic Pact
		77746,						-- Totemic Wrath
	},

	["sp6"] = {
		8227,						-- Flametongue
		1459,						-- AI
	},

	["dmg3"] = {
		82930,						-- Arcane Tactics
		34460,						-- Ferocious Insperation
		31876,						-- Communion
	},

	["base5"] = {
		1126,						-- Mark
		20217,						-- Kings
	},

	["str_agi"] = {
		8076,						-- Strength of earth
		57330,						-- Horn of Winter
		6673,						-- Battle Shout
	},

	["stam"] = {
		21562,						-- Fort
		6307,						-- Imp
		469,						-- Commanding
	},

	["mana"] = {
		1459,						-- AI
		54424,						-- Fel
	},

	["armor"] = {
		8072,						-- stoneskin
		465,						-- devotion aura
	},

	-- make this a check list
	-- local resist = {
		-- Ele Resist Totem	--fire, frost nature
		-- Aspect of the wild	--nature
		-- Resistance Aura		--fire, frost, shadow
		-- Kings				-- All
		-- Shadow Protection	-- Shadow, Stacks with kings
		-- Mark				-- All
	-- }

	["pushback"] = {
		19746,						-- Conc aura
		87717,						-- Totem of Tranq
	},

	["mp5"] = {
		54424,						-- Fel
		5677,						-- Mana Spring
		19740,						-- Blessing of Might
	},

	--replenishment
	-- local manaregen = {
		-- Vampiric Touch
		-- Enduring Winter
		-- soul leach
		-- Revitalize
		-- Communion
	-- }
}

local function LabelType(bufftype)
	if bufftype == "melee10" then
		return "10% Melee Attack Speed"
	elseif bufftype == "crit5" then
		return "5% Crit"
	elseif bufftype == "ap10" then
		return "10% Attack Power"
	elseif bufftype == "spellhaste" then
		return "5% Spell Haste"
	elseif bufftype == "sp10" then
		return "10% Spell Power"
	elseif bufftype == "sp6" then
		return "6% Spell Power"
	elseif bufftype == "dmg3" then
		return "3% Damage"
	elseif bufftype == "base5" then
		return "5% All Base Stats"
	elseif bufftype == "str_agi" then
		return "Strength and Agility"
	elseif bufftype == "stam" then
		return "Stamina"
	elseif bufftype == "mana" then
		return "Maximum Mana"
	elseif bufftype == "armor" then
		return "Armor"
	elseif bufftype == "pushback" then
		return "Spell Pushback"
	elseif bufftype == "mp5" then
		return "Mana Per 5s"
	else
		return "ERROR"
	end
end
-------------------------
-- Buff Check Functions
-------------------------
local function AnotherOnAuraChange(self, event, arg1, unit)
	for key, value in pairs(AllBuffs) do
		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."mini"..i].spell = v
			if UnitAura("player", spellname) then
				_G[key.."mini"..i]:SetAlpha(1)
			else
				_G[key.."mini"..i]:SetAlpha(0.2)
			end
		end

		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."Frame"].spell = v
			if UnitAura("player", spellname) then
				_G[key.."Frame"]:SetAlpha(1)
				-- _G[key.."Frame"].t:SetDesaturated(nil)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
				break
			else
				_G[key.."Frame"]:SetAlpha(0.2)
				-- _G[key.."Frame"].t:SetDesaturated(1)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
			end
		end
	end
end

local raidbuffsummury = CreateFrame("Frame", "RaidBuffSummery", UIParent)
raidbuffsummury:CreatePanel("Default", 435, 425, "CENTER", UIParent, "CENTER", 0, 0)
raidbuffsummury:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuffsummury:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuffsummury:RegisterEvent("UNIT_AURA")
raidbuffsummury:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuffsummury:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuffsummury:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuffsummury:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuffsummury:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuffsummury:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuffsummury:SetScript("OnEvent", AnotherOnAuraChange)

--DERP BLIZZ, cant make good spell id's
local str = "spell:%s"
local BadTotems = {
	[8076] = 8075,
	[8972] = 8071,
	[5677] = 5675,
}
local SetupTooltip = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 0, 0)
	
	if BadTotems[self.spell] then
		GameTooltip:SetHyperlink(format(str, BadTotems[self.spell]))
	else
		GameTooltip:SetHyperlink(format(str, self.spell))
	end
	
	GameTooltip:Show()
end

local function CreateBuffArea(bufftype, relativeTo, column)
	local bigButton = CreateFrame("Frame", bufftype.."Frame", RaidBuffSummery)
	if column == 1 then
		bigButton:CreatePanel("Default", 40, 40, "TOPLEFT", RaidBuffSummery, "TOPLEFT", 14, -14)
	elseif column == 2 then
		bigButton:CreatePanel("Default", 40, 40, "TOPLEFT", RaidBuffSummery, "TOPLEFT", 250, -14)
	else
		bigButton:CreatePanel("Default", 40, 40, "TOPLEFT", relativeTo, "BOTTOMLEFT", 0, -16)
	end
	bigButton.t = bigButton:CreateTexture(bufftype..".t", "OVERLAY")
	bigButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	bigButton.t:Point("TOPLEFT", 2, -2)
	bigButton.t:Point("BOTTOMRIGHT", -2, 2)
	
	local littlebutton = {}
	for i, v in pairs(AllBuffs[bufftype]) do
		littlebutton[i] = CreateFrame("Frame", bufftype.."mini"..i, raidbuffsummury)		
		if i == 1 then
			littlebutton[i]:CreatePanel("Default", 20, 20, "BOTTOMLEFT", bigButton, "BOTTOMRIGHT", 3, 0)
		else
			littlebutton[i]:CreatePanel("Default", 20, 20, "LEFT", littlebutton[i-1], "RIGHT", 3, 0)
		end
		littlebutton[i].t = littlebutton[i]:CreateTexture(nil, "OVERLAY")
		littlebutton[i].t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		littlebutton[i].t:Point("TOPLEFT", 2, -2)
		littlebutton[i].t:Point("BOTTOMRIGHT", -2, 2)
		littlebutton[i].t:SetTexture(select(3, GetSpellInfo(v)))
		
		littlebutton[i]:EnableMouse(true)
		littlebutton[i]:SetScript("OnEnter", SetupTooltip)
		littlebutton[i]:SetScript("OnLeave", GameTooltip_Hide)
	end
	
	bigButton.text = bigButton:CreateFontString(nil, "OVERLAY")
	bigButton.text:SetPoint("TOPLEFT", bigButton, "TOPRIGHT", 3, -1)
	bigButton.text:SetFont( font, fontsize, fontstyle )
	bigButton.text:SetText(LabelType(bufftype))
	
	bigButton:EnableMouse(true)
	bigButton:SetScript("OnEnter", SetupTooltip)
	bigButton:SetScript("OnLeave", GameTooltip_Hide)
end

--ORDER MATTERS!
CreateBuffArea("melee10", nil, 1)
CreateBuffArea("crit5", "melee10Frame", nil)
CreateBuffArea("ap10", "crit5Frame", nil)
CreateBuffArea("spellhaste", "ap10Frame", nil)
CreateBuffArea("sp10", "spellhasteFrame", nil)
CreateBuffArea("sp6", "sp10Frame", nil)
CreateBuffArea("dmg3", "sp6Frame", nil)
CreateBuffArea("base5", "dmg3Frame", 2)
CreateBuffArea("str_agi", "base5Frame", nil)
CreateBuffArea("stam", "str_agiFrame", nil)
CreateBuffArea("mana", "stamFrame", nil)
CreateBuffArea("armor", "manaFrame", nil)
CreateBuffArea("pushback", "armorFrame", nil)
CreateBuffArea("mp5", "pushbackFrame", nil)

raidbuffsummury:Hide()

local function ToggleRaidBuffs()
	if raidbuffsummury:IsShown() then
		raidbuffsummury:Hide()
	else
		raidbuffsummury:Show()
	end
end
raidbuff_reminder:SetScript("OnMouseDown", ToggleRaidBuffs)