local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].dps_text or C["datatext"].dps_text == 0 then return end

local events = {
	SWING_DAMAGE = true,
	RANGE_DAMAGE = true,
	SPELL_DAMAGE = true,
	SPELL_PERIODIC_DAMAGE = true,
	DAMAGE_SHIELD = true,
	DAMAGE_SPLIT = true,
	SPELL_EXTRA_ATTACKS = true
}
local DPS_FEED = CreateFrame( "Frame", "TukuiStatDamage" )
DPS_FEED.Option = C["datatext"].dps_text
DPS_FEED.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
DPS_FEED.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local player_id = UnitGUID( "player" )
local dmg_total, last_dmg_amount = 0, 0
local cmbt_time = 0

local pet_id = UnitGUID( "pet" )

local dText = DPS_FEED:CreateFontString( "TukuiStatDamageText", "OVERLAY" )
dText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
dText:SetText( "0.0 ", L.datatext_dps )
S.PP( C["datatext"].dps_text, dText )

DPS_FEED:EnableMouse( true )
DPS_FEED:SetFrameStrata( "BACKGROUND" )
DPS_FEED:SetFrameLevel( 3 )
DPS_FEED:Height( 20 )
DPS_FEED:Width( 100 )
DPS_FEED:SetAllPoints( dText )

DPS_FEED:SetScript( "OnEvent", function( self, event, ... ) self[event]( self, ... ) end )
DPS_FEED:RegisterEvent( "PLAYER_LOGIN" )

local elapsed = 1
DPS_FEED:SetScript("OnUpdate", function(self, elap)
	if UnitAffectingCombat("player") then
		cmbt_time = cmbt_time + elap
	end

	elapsed = elapsed + elap
	if( elapsed >= 1 ) then
		elapsed = 0
		dText:SetText( getDPS() )
	end
end )

function DPS_FEED:PLAYER_LOGIN()
	DPS_FEED:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
	DPS_FEED:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	DPS_FEED:RegisterEvent( "PLAYER_REGEN_DISABLED" )
	DPS_FEED:RegisterEvent( "UNIT_PET" )
	player_id = UnitGUID( "player" )
	DPS_FEED:UnregisterEvent( "PLAYER_LOGIN" )
end

function DPS_FEED:UNIT_PET(unit)
	if( unit == "player" ) then
		pet_id = UnitGUID( "pet" )
	end
end

function DPS_FEED:COMBAT_LOG_EVENT_UNFILTERED( ... )
	if not events[select( 2, ... )] then return end

	local id = select( 4, ... )

	if( id == player_id or id == pet_id ) then
		if( select( 2, ... ) == "SWING_DAMAGE" ) then
			if( S.toc < 40200 ) then
				last_dmg_amount = select( 10, ... )
			else
				last_dmg_amount = select( 12, ... )
			end
		else
			if( S.toc < 40200 ) then
				last_dmg_amount = select( 13, ... )
			else
				last_dmg_amount = select( 15, ... )
			end
		end
		dmg_total = dmg_total + last_dmg_amount
	end
end

function getDPS()
	if( dmg_total == 0 ) then
		return ( DPS_FEED.Color2 .. "0.0 |r" .. DPS_FEED.Color1 .. L.datatext_dps .. "|r" )
	else
		return string.format( DPS_FEED.Color2 .. "%.1fk |r" .. DPS_FEED.Color1 .. L.datatext_dps .. "|r", ( ( dmg_total or 0 ) / ( cmbt_time or 1 ) ) / 1000 )
	end
end

function DPS_FEED:PLAYER_REGEN_ENABLED()
	dText:SetText( getDPS() )
end

function DPS_FEED:PLAYER_REGEN_DISABLED()
	cmbt_time = 0
	dmg_total = 0
	last_dmg_amount = 0
end

DPS_FEED:SetScript( "OnMouseDown", function( self, button, down )
	cmbt_time = 0
	dmg_total = 0
	last_dmg_amount = 0
end )