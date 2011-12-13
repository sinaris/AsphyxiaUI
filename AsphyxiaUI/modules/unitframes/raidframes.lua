local T, C, L = unpack(Tukui)

local delay = 0.1 

local function SetAttributeByProxy(frame,name, value)
    if name == "point" or name == "columnAnchorPoint" or name == "unitsPerColumn" then
        local count = 1
        local uframe = frame:GetAttribute("child" .. count)
        while uframe do
            uframe:ClearAllPoints()
            count = count + 1
            uframe = frame:GetAttribute("child" .. count)
        end
    end
    frame:SetAttribute(name, value)
end

local function EditUnitFrame(frame, header)
	local self = frame
	local name = frame.Name
	local health = frame.Health
	local power = frame.Power
	local panel = frame.panel

	if header == TukuiRaid25 or header == TukuiRaid40 then
		name:SetParent(health)
		name:ClearAllPoints()
		name:SetPoint("TOP", 0, 8) 
		name:SetPoint("BOTTOM") 
		name:SetPoint("LEFT", 4, 0) 
		name:SetPoint("RIGHT")
		name:SetFont(C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE")
		name:SetShadowOffset(1.25, -1.25)
		self:Tag(name, "[Tukui:getnamecolor][Tukui:nameshort]")

		if C["unitframes"].gridonly ~= true then
			header:ClearAllPoints()
			header:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 2, 12)
		else
			header:ClearAllPoints()
			header:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 2, 12)
		end
	elseif header == TukuiRaidHealer15 then
	elseif header == TukuiRaidHealerGrid then
		panel:Kill()

		name:SetParent(health)
		name:ClearAllPoints()
		name:SetPoint("TOP", 0, 18) 
		name:SetPoint("BOTTOM") 
		name:SetPoint("LEFT", 4, 0) 
		name:SetPoint("RIGHT")
		name:SetFont(C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE")
		name:SetShadowOffset(1.25, -1.25)
		self:Tag(name, "[Tukui:getnamecolor][Tukui:nameshort]")

		local RaidMove = CreateFrame("Frame")
		RaidMove:RegisterEvent("PLAYER_LOGIN")
		RaidMove:RegisterEvent("RAID_ROSTER_UPDATE")
		RaidMove:RegisterEvent("PARTY_LEADER_CHANGED")
		RaidMove:RegisterEvent("PARTY_MEMBERS_CHANGED")
		RaidMove:SetScript("OnEvent", function(self)
			local numraid = GetNumRaidMembers()
			if numraid > 25 then
				header:ClearAllPoints()
				header:Point("TOP", UIParent, "BOTTOM", 0, 415)
			else
				header:ClearAllPoints()
				header:Point("TOP", UIParent, "BOTTOM", 0, 350)
			end
		end)
	end
end

local function EditUnitAttributes(layout)
	local header = _G[layout]
	local dpsmax25 = layout:match("Raid25")
	local dpsmax40 = layout:match("Raid40")
	local healmax15 = layout:match("Healer15")
	local grid = layout:match("HealerGrid")

	if dpsmax25 or dpsmax40 then
		if C["unitframes"].gridonly ~= true then
			header:SetAttribute("initial-width", 69)
			header:SetAttribute("initial-height", 20)
			header:SetAttribute("showRaid", true)
			header:SetAttribute("xoffset", T.Scale(7))
			header:SetAttribute("yOffset", T.Scale(-5))
			header:SetAttribute("groupFilter", "1,2,3,4,5,6,7,8")
			header:SetAttribute("groupingOrder", "1,2,3,4,5,6,7,8")
			header:SetAttribute("groupBy", "GROUP")
			header:SetAttribute("maxColumns", 8)
			header:SetAttribute("columnSpacing", T.Scale(7))
			SetAttributeByProxy( header, "columnAnchorPoint", "TOP" )
			SetAttributeByProxy( header, "unitsPerColumn", 5 )
			SetAttributeByProxy( header, "point", "LEFT" )
		else
			header:SetAttribute("initial-width", 69)
			header:SetAttribute("initial-height", 20)
			header:SetAttribute("showParty", true)
			header:SetAttribute("showPlayer", C["unitframes"].showplayerinparty)
			header:SetAttribute("showSolo", C["unitframes"].showsolo)
			header:SetAttribute("xoffset", T.Scale(7))
			header:SetAttribute("yOffset", T.Scale(-5))
			header:SetAttribute("groupFilter", "1,2,3,4,5,6,7,8")
			header:SetAttribute("groupingOrder", "1,2,3,4,5,6,7,8")
			header:SetAttribute("groupBy", "GROUP")
			header:SetAttribute("maxColumns", 8)
			header:SetAttribute("columnSpacing", T.Scale(7))
			SetAttributeByProxy( header, "columnAnchorPoint", "TOP" )
			SetAttributeByProxy( header, "unitsPerColumn", 5 )
			SetAttributeByProxy( header, "point", "LEFT" )

		end
	elseif healmax15 or grid then
		header:SetAttribute("initial-width", 68)
		header:SetAttribute("initial-height", 32)
		header:SetAttribute("xoffset", 7)
		header:SetAttribute("yOffset", -16)
		header:SetAttribute("columnSpacing", T.Scale(16))
	end
end

local oUF = oUFTukui or oUF

local function InitScript()
	local children
	local heal = IsAddOnLoaded("Tukui_Raid_Healing")
	local dps = IsAddOnLoaded("Tukui_Raid")

	if heal and dps then return end
	
	local function UpdateRaidUnitSize(frame, header)
		frame:SetSize(header:GetAttribute("initial-width"), header:GetAttribute("initial-height"))
	end

	local GetActiveHeader = function()
		local players = (GetNumPartyMembers() + 1)
		
		if UnitInRaid("player") then
			players = GetNumRaidMembers()
		end

		if heal then
			if C["unitframes"].gridonly then
				return TukuiRaidHealerGrid
			else
				if players <= 15 then
					return TukuiRaidHealer15
				else
					return TukuiRaidHealerGrid
				end
			end
		elseif dps then
			if players <= 25 then
				return TukuiRaid25
			elseif players > 25 then
				return TukuiRaid40
			end
		end
	end
	
	local function Update(frame, header, event)
		if (frame and frame.unit) then
			local isEdited = frame.isEdited

			if event == "PLAYER_ENTERING_WORLD" then
				UpdateRaidUnitSize(frame, header)
			end

			if not frame.isEdited then
				EditUnitFrame(frame, header)
				frame.isEdited = true
			end
		end	
	end

	local function Skin(header, event)
		children = {header:GetChildren()}
		
		for _, frame in pairs(children) do
			Update(frame, header, event)
		end	
	end
	
	local StyleRaidFrames = function(self, event)
		local header = GetActiveHeader()

		T.Delay(delay, function() Skin(header, event) end)
	end

	local function SpawnHeader(name, layout, visibility, ...)
		EditUnitAttributes(layout)
	end

	hooksecurefunc(oUF, "SpawnHeader", SpawnHeader)

	local style = CreateFrame("Frame")
	style:RegisterEvent("PLAYER_ENTERING_WORLD")
	style:RegisterEvent("PARTY_MEMBERS_CHANGED")
	style:RegisterEvent("RAID_ROSTER_UPDATE")
	style:SetScript("OnEvent", StyleRaidFrames)
end

local script = CreateFrame("Frame")
script:RegisterEvent("ADDON_LOADED")
script:SetScript("OnEvent", function(self, event, addon)
	if addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" then
		InitScript()
	end
end)