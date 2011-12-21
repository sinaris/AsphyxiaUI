local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].fps_ms or C["datatext"].fps_ms == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatFPS" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel(3)
Stat.Option = C["datatext"].fps_ms
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatArmorText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].fps_ms, Text )

local int = 1
local function Update( self, t )
	int = int - t
	if( int < 0 ) then
		local ms = select( 3, GetNetStats() )
		if( ms == 0 ) then ms = "???" end
		Text:SetText( Stat.Color2 .. floor( GetFramerate() ) .. "|r" .. Stat.Color1 .. L.datatext_fps .. "|r" .. Stat.Color2 .. ms .. "|r" .. Stat.Color1 .. L.datatext_ms .. "|r" )
		self:SetAllPoints( Text )
		int = 1
	end	
end

Stat:SetScript( "OnUpdate", Update )
Stat:SetScript( "OnEnter", function( self )
	if not InCombatLockdown() then
		local anchor, panel, xoff, yoff = S.DataTextTooltipAnchor( Text )
		local _, _, latencyHome, latencyWorld = GetNetStats()
		local latency = format( MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld )
		GameTooltip:SetOwner( panel, anchor, xoff, yoff )
		GameTooltip:ClearLines()
		GameTooltip:AddLine( latency )
		GameTooltip:Show()
	end
end )
Stat:SetScript( "OnLeave", function() GameTooltip:Hide() end )
Update( Stat, 10 )