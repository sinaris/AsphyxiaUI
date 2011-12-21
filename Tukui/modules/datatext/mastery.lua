local S, C, L = unpack(select(2, ...))

if not C["datatext"].mastery or C["datatext"].mastery == 0 then return end

local Stat = CreateFrame("Frame", "TukuiStatMastery")
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].mastery
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatMasteryText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].mastery, Text )

local int = 1

local function Update( self, t )
	int = int - t
	if( int < 0 ) then
		Text:SetText( Stat.Color1 .. STAT_MASTERY .. ":|r " .. Stat.Color2 .. GetCombatRating( 26 ) .. "|r" )
		int = 1
	end
end

Stat:SetScript( "OnUpdate", Update )
Update( Stat, 10 )