local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].crit or C["datatext"].crit == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatCrit" )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].crit
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatCritText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].crit, Text )

local int = 1

local function Update( self, t )
	int = int - t
	local meleecrit = GetCritChance()
	local spellcrit = GetSpellCritChance( 1 )
	local rangedcrit = GetRangedCritChance()
	local CritChance
	if( spellcrit > meleecrit ) then
		CritChance = spellcrit
	elseif( select( 2, UnitClass( "player" ) ) == "HUNTER" ) then
		CritChance = rangedcrit
	else
		CritChance = meleecrit
	end
	if( int < 0 ) then
		Text:SetText( Stat.Color2 .. format( "%.2f", CritChance ) .. "%|r" .. Stat.Color1 .. L.datatext_playercrit .. "|r" )
		int = 1
	end
end

Stat:SetScript( "OnUpdate", Update )
Update( Stat, 10 )