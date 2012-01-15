local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].avd or C["datatext"].avd == 0 then return end

local dodge, parry, block, MissChance, avoidance, targetlv, playerlv, basemisschance, leveldifference
local Stat = CreateFrame( "Frame", "TukuiStatAvoidance" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].avd
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatAvoidanceText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].avd, Text )
	
local targetlv, playerlv, dodge, parry, block, MissChance

local function Update( self )
	local format = string.format
	targetlv, playerlv = UnitLevel( "target" ), UnitLevel( "player" )
	local basemisschance, leveldifference, avoidance

	if( targetlv == -1 ) then
		basemisschance = ( 5 - ( 3 * .2 ) )
		leveldifference = 3
	elseif( targetlv > playerlv ) then
		basemisschance = ( 5 - ( ( targetlv - playerlv ) * .2 ) )
		leveldifference = ( targetlv - playerlv )
	elseif( targetlv < playerlv and targetlv > 0 ) then
		basemisschance = ( 5 + ( ( playerlv - targetlv ) * .2 ) )
		leveldifference = ( targetlv - playerlv )
	else
		basemisschance = 5
		leveldifference = 0
	end

	if( S.myrace == "NightElf" ) then
		basemisschance = basemisschance + 2
	end

	if( leveldifference >= 0 ) then
		dodge = ( GetDodgeChance() - leveldifference * .2 )
		parry = ( GetParryChance() - leveldifference * .2 )
		block = ( GetBlockChance() - leveldifference * .2 )
		MissChance = ( basemisschance + 1 / ( 0.0625 + 0.956 / ( GetCombatRating( CR_DEFENSE_SKILL ) / 4.91850 * 0.04 ) ) )
		avoidance = ( dodge + parry + block + MissChance )
		Text:SetText( Stat.Color1 .. L.datatext_playeravd .. "|r" .. Stat.Color2 .. format( "%.2f", avoidance ) .. "|r" )
	else
		dodge = ( GetDodgeChance() + abs( leveldifference * .2 ) )
		parry = ( GetParryChance() + abs( leveldifference * .2 ) )
		block = ( GetBlockChance() + abs( leveldifference * .2 ) )
		MissChance = ( basemisschance + 1 / ( 0.0625 + 0.956 / ( GetCombatRating( CR_DEFENSE_SKILL ) / 4.91850 * 0.04 ) ) )
		avoidance = ( dodge + parry + block + MissChance )
		Text:SetText( Stat.Color1 .. L.datatext_playeravd .. "|r" .. Stat.Color2 .. format( "%.2f", avoidance ) .. "|r" )
	end

	self:SetAllPoints( Text )
end

Stat:RegisterEvent( "UNIT_AURA" )
Stat:RegisterEvent( "UNIT_INVENTORY_CHANGED" )
Stat:RegisterEvent( "PLAYER_TARGET_CHANGED" )
Stat:RegisterEvent( "PLAYER_ENTERING_WORLD" )
Stat:SetScript( "OnEvent", Update )
Stat:SetScript( "OnEnter", function( self )
	if not InCombatLockdown() then
		local anchor, yoff = S.DataTextTooltipAnchor( Text )
		GameTooltip:SetOwner( self, anchor, 0, yoff )
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint( "BOTTOM", self, "TOP", 0, S.mult )
		GameTooltip:ClearLines()
		if( targetlv > 1 ) then
			GameTooltip:AddDoubleLine( L.datatext_avoidancebreakdown .. " (" .. L.datatext_lvl .. " " .. targetlv .. ")" )
		elseif( targetlv == -1 ) then
			GameTooltip:AddDoubleLine( L.datatext_avoidancebreakdown .. " (" .. L.datatext_boss .. ")" )
		else
			GameTooltip:AddDoubleLine( L.datatext_avoidancebreakdown .. " (" .. L.datatext_lvl .. " " .. targetlv .. ")" )
		end
		GameTooltip:AddDoubleLine( L.datatext_miss, format( "%.2f", MissChance ) .. "%", 1, 1, 1, 1, 1, 1 )
		GameTooltip:AddDoubleLine( L.datatext_dodge, format( "%.2f", dodge ) .. "%", 1, 1, 1, 1, 1, 1 )
		GameTooltip:AddDoubleLine( L.datatext_parry, format( "%.2f", parry ) .. "%", 1, 1, 1, 1, 1, 1 )
		GameTooltip:AddDoubleLine( L.datatext_block, format( "%.2f", block ) .. "%", 1, 1, 1, 1, 1, 1 )
		GameTooltip:Show()
	end
end )
Stat:SetScript( "OnLeave", function() GameTooltip:Hide() end )