local S, C, L = unpack( select( 2, ... ) )

if( C["raidcooldowns"].enable ~= true ) then return end

spell_list = {
	[20484] = 600, -- Rebirth
	[61999] = 600, -- Raise Ally
	[20707] = 900, -- Soulstone
	[6346] = 180, -- Fear Ward
	[29166] = 180, -- Innervate
	[32182] = 300, -- Heroism
	[2825] = 300, -- Bloodlust
	[80353] = 300, -- Time Warp
	[90355] = 300, -- Ancient Hysteria
	[31821] = 120, -- Aura Mastery
	[62618] = 180, -- Power Word: Barrier
	[98008] = 180, -- Spirit Link Totem
	[740] = 480, -- Tranquility
}

local show = {
	raid = C["raidcooldowns"].raid,
	party = C["raidcooldowns"].party,
	arena = C["raidcooldowns"].arena,
}

local filter = COMBATLOG_OBJECT_AFFILIATION_RAID + COMBATLOG_OBJECT_AFFILIATION_PARTY + COMBATLOG_OBJECT_AFFILIATION_MINE
local band = bit.band
local sformat = string.format
local floor = math.floor
local timer = 0
local bars = {}

local rcda = CreateFrame( "Frame", "CDAnchor", UIParent )
rcda:CreatePanel( "Default", 200, 15, "LEFT", UIParent, "LEFT", 300, 200 )
rcda:SetClampedToScreen( true )
rcda:SetMovable( true )
rcda:SetBackdropColor( 0, 0, 0 )
rcda:SetBackdropBorderColor( 1, 0, 0 )
rcda.text = S.SetFontString( rcda, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
rcda.text:SetPoint( "CENTER" )
rcda.text:SetText( "Move Raidcooldowns" )
rcda:Hide()

local CreateFS = function( frame, fsize, fstyle )
	local fstring = frame:CreateFontString( nil, "OVERLAY" )
	fstring:SetFont( S.SetUserFont() )
	return fstring
end

local UpdatePositions = function()
	for i = 1, #bars do
		bars[i]:ClearAllPoints()
		if( i == 1 ) then
			bars[i]:Point( "TOPLEFT", rcda, "BOTTOMLEFT", -2, -5 )
		else
			bars[i]:Point( "TOPLEFT", bars[i - 1], "BOTTOMLEFT", 0, -8 )
		end
		bars[i].id = i
	end
end

local StopTimer = function( bar )
	bar:SetScript( "OnUpdate", nil )
	bar:Hide()
	tremove( bars, bar.id )
	UpdatePositions()
end

local BarUpdate = function( self, elapsed )
	local curTime = GetTime()
	if( self.endTime < curTime ) then
		StopTimer( self )
		return
	end
	self:SetValue( 100 - ( curTime - self.startTime ) / ( self.endTime - self.startTime ) * 100 )
	self.right:SetText( S.FormatTime( self.endTime - curTime ) )
end

local OnEnter = function( self )
	GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
	GameTooltip:AddDoubleLine( self.spell, self.right:GetText() )
	GameTooltip:SetClampedToScreen( true )
	GameTooltip:Show()
end

local OnLeave = function( self )
	GameTooltip:Hide()
end

local OnMouseDown = function( self, button )
	if( button == "LeftButton" ) then
		if( GetRealNumRaidMembers() > 0 ) then
			SendChatMessage( sformat( "CD %s: %s", self.left:GetText(), self.right:GetText() ), "RAID" )
		elseif( GetRealNumPartyMembers() > 0 and not UnitInRaid( "player" ) ) then
			SendChatMessage( sformat( "CD %s: %s", self.left:GetText(), self.right:GetText() ), "PARTY" )
		else
			SendChatMessage( sformat( "CD %s: %s", self.left:GetText(), self.right:GetText() ), "SAY" )
		end
	elseif( button == "RightButton" ) then
		StopTimer( self )
	end
end

local CreateBar = function()
	local bar = CreateFrame( "Statusbar", nil, UIParent )
	bar:SetFrameStrata( "HIGH" )
	bar:Size( 200, 15 )
	bar:SetStatusBarTexture( C["media"].normTex )
	bar:SetMinMaxValues( 0, 100 )

	bar.backdrop = CreateFrame( "Frame", nil, bar )
	bar.backdrop:Point( "TOPLEFT", -2, 2 )
	bar.backdrop:Point( "BOTTOMRIGHT", 2, -2 )
	bar.backdrop:SetTemplate( "Default" )
	bar.backdrop:SetFrameStrata( "BACKGROUND" )

	bar.bg = bar:CreateTexture( nil, "BACKGROUND" )
	bar.bg:SetAllPoints( bar )
	bar.bg:SetTexture( C["media"].normTex )

	bar.left = CreateFS( bar )
	bar.left:Point( "LEFT", 2, 0 )
	bar.left:SetJustifyH( "LEFT" )
	bar.left:Size( 170, 15 )

	bar.right = CreateFS( bar )
	bar.right:Point( "RIGHT", 1, 0 )
	bar.right:SetJustifyH( "RIGHT" )

	bar.icon = CreateFrame( "Button", nil, bar )
	bar.icon:Width( bar:GetHeight() )
	bar.icon:Height( bar.icon:GetWidth() )
	bar.icon:Point( "BOTTOMRIGHT", bar, "BOTTOMLEFT", -7, 0 )

	bar.icon.backdrop = CreateFrame( "Frame", nil, bar.icon )
	bar.icon.backdrop:Point( "TOPLEFT", -2, 2 )
	bar.icon.backdrop:Point( "BOTTOMRIGHT", 2, -2 )
	bar.icon.backdrop:SetTemplate( "Default" )
	bar.icon.backdrop:SetFrameStrata( "BACKGROUND" )

	return bar
end

local StartTimer = function( name, spellId )
	local bar = CreateBar()
	local spell, rank, icon = GetSpellInfo( spellId )
	bar.endTime = GetTime() + spell_list[spellId]
	bar.startTime = GetTime()
	bar.left:SetText( spell .. " - " .. name )
	bar.right:SetText( S.FormatTime( spell_list[spellId] ) )
	bar.icon:SetNormalTexture( icon )
	bar.icon:GetNormalTexture():SetTexCoord( .1, .9, .1, .9 )
	bar.spell = spell
	bar:Show()
	local color = RAID_CLASS_COLORS[select( 2, UnitClass( name ) )]
	bar:SetStatusBarColor( color.r, color.g, color.b )
	bar.bg:SetVertexColor( .15, .15, .15, .25 )
	bar:SetScript( "OnUpdate", BarUpdate )
	bar:EnableMouse( true )
	bar:SetScript( "OnEnter", OnEnter )
	bar:SetScript( "OnLeave", OnLeave )
	bar:SetScript( "OnMouseDown", OnMouseDown )
	tinsert( bars, bar )
	UpdatePositions()
end

local OnEvent = function( self, event, ... )
	if( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
		local _, eventType, _, _, sourceName, sourceFlags = ...

		if( band( sourceFlags, filter ) == 0 ) then return end
		local spellId = select( 12, ... )

		if( spell_list[spellId] and show[select( 2, IsInInstance() )] ) then
			if( eventType == "SPELL_RESURRECT" and not spellId == 61999 ) then
				if( spellId == 95750 ) then spellId = 6203 end
				StartTimer( sourceName, spellId )
			elseif( eventType == "SPELL_RESURRECT" and spellId == 20484 ) then
				StartTimer( sourceName, spellId )
			elseif( eventType == "SPELL_AURA_APPLIED" ) then
				if( spellId == 20707 ) then
					local _, class = UnitClass( sourceName )
					if( class == "WARLOCK" ) then
						StartTimer( sourceName, spellId )
					end
				end
			elseif( eventType == "SPELL_CAST_SUCCESS" ) then
				StartTimer( sourceName, spellId )
			end
		end
	elseif( event == "ZONE_CHANGED_NEW_AREA" and select( 2, IsInInstance() ) == "arena" ) then
		for k, v in pairs( bars ) do
			StopTimer( v )
		end
	end
end

local addon = CreateFrame( "Frame" )
addon:SetScript( "OnEvent", OnEvent )
addon:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
addon:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )

SlashCmdList.RaidCD = function( msg )
	StartTimer( UnitName( "player" ), 20484 )	-- Rebirth
	StartTimer( UnitName( "player" ), 20707 )	-- Soulstone
	StartTimer( UnitName( "player" ), 6346 )	-- Fear Ward
	StartTimer( UnitName( "player" ), 29166 )	-- Innervate
	StartTimer( UnitName( "player" ), 32182 )	-- Heroism
	StartTimer( UnitName( "player" ), 2825 )	-- Bloodlust
end
SLASH_RaidCD1 = "/rcd"