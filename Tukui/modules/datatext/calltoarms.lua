local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].calltoarms or C["datatext"].calltoarms == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatCallToArms" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].calltoarms
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatCallToArmsText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].calltoarms, Text )

local TANK_ICON = "|TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES.blp:14:14:0:0:64:64:0:18:22:40|t"
local HEALER_ICON = "|TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES.blp:14:14:0:0:64:64:20:38:1:19|t"
local DPS_ICON = "|TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES.blp:14:14:0:0:64:64:20:38:22:40|t"

local function MakeIconString( tank, healer, damage )
	local str = ""
	if( tank ) then str = TANK_ICON end
	if( healer ) then str = HEALER_ICON end
	if( damage )then str = DPS_ICON end

	return str
end

local function OnEvent( self, event, ... )
	local tankReward = false
	local healerReward = false
	local dpsReward = false
	local unavailable = true
	for i = 1, GetNumRandomDungeons() do
		local id, name = GetLFGRandomDungeonInfo( i )
		for x = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			local eligible, forTank, forHealer, forDamage, itemCount = GetLFGRoleShortageRewards( id, x )
			if( eligible ) then unavailable = false end
			if( eligible and forTank and itemCount > 0 ) then tankReward = true end
			if( eligible and forHealer and itemCount > 0 ) then healerReward = true end
			if( eligible and forDamage and itemCount > 0 ) then dpsReward = true end
		end
	end	

	if( unavailable ) then
		Text:SetText( Stat.Color1 .. QUEUE_TIME_UNAVAILABLE .. "|r" )
	else
		if( tankReward or healerReward or dpsReward ) then
			Text:SetText( Stat.Color1 .. BATTLEGROUND_HOLIDAY .. ":|r" .. Stat.Color2 .. MakeIconString( tankReward, healerReward, dpsReward ) .. "|r" )
		else
			Text:SetText( Stat.Color1 .. LOOKING_FOR_DUNGEON .. "|r" )
		end
	end

	self:SetAllPoints( Text )
end

local function OnEnter( self )
	local anchor, panel, xoff, yoff = S.DataTextTooltipAnchor( Text )
	GameTooltip:SetOwner( panel, anchor, xoff, yoff )
	GameTooltip:ClearLines()
	GameTooltip:AddLine( BATTLEGROUND_HOLIDAY )
	GameTooltip:AddLine( " " )

	local allUnavailable = true
	local numCTA = 0
	for i = 1, GetNumRandomDungeons() do
		local id, name = GetLFGRandomDungeonInfo( i )
		local tankReward = false
		local healerReward = false
		local dpsReward = false
		local unavailable = true
		for x = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			local eligible, forTank, forHealer, forDamage, itemCount = GetLFGRoleShortageRewards( id, x )
			if( eligible ) then unavailable = false end
			if( eligible and forTank and itemCount > 0 ) then tankReward = true end
			if( eligible and forHealer and itemCount > 0 ) then healerReward = true end
			if( eligible and forDamage and itemCount > 0 ) then dpsReward = true end
		end

		if not unavailable then
			allUnavailable = false
			local rolesString = MakeIconString( tankReward, healerReward, dpsReward )
			if( rolesString ~= "" ) then 
				GameTooltip:AddDoubleLine( name .. ":", rolesString, 1, 1, 1 )
			end
			if( tankReward or healerReward or dpsReward ) then numCTA = numCTA + 1 end
		end
	end

	if( allUnavailable ) then
		GameTooltip:AddLine( L.datatext_cta_allunavailable )
	elseif( numCTA == 0 ) then
		GameTooltip:AddLine( L.datatext_cta_nodungeons )
	end
	GameTooltip:Show()
end
   
Stat:RegisterEvent( "LFG_UPDATE_RANDOM_INFO" )
Stat:RegisterEvent( "PLAYER_LOGIN" )
Stat:SetScript( "OnEvent", OnEvent )
Stat:SetScript( "OnMouseDown", function() ToggleFrame( LFDParentFrame ) end )
Stat:SetScript( "OnEnter", OnEnter )
Stat:SetScript( "OnLeave", function() GameTooltip:Hide() end )