local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].bags or C["datatext"].bags == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatBags" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].bags
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatBagsText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP(C["datatext"].bags, Text )

local function OnEvent( self, event, ... )
	local free, total,used = 0, 0, 0
	for i = 0, NUM_BAG_SLOTS do
		free, total = free + GetContainerNumFreeSlots( i ), total + GetContainerNumSlots( i )
	end
	used = total - free
	Text:SetText( Stat.Color1 .. L.datatext_bags .. "|r" .. Stat.Color2 .. used .. "/" .. total .. "|r" )
	self:SetAllPoints( Text )
end

Stat:RegisterEvent( "PLAYER_LOGIN" )
Stat:RegisterEvent( "BAG_UPDATE" )
Stat:SetScript( "OnEvent", OnEvent )
Stat:SetScript( "OnMouseDown", function() OpenAllBags() end )