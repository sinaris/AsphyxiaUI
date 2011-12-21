local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].micromenu or C["datatext"].micromenu == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatMicroMenu" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].micromenu
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatMicroMenuText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].micromenu, Text )

local function OnEvent( self, event, ... )
	Text:SetText( Stat.Color2 .. MAINMENU_BUTTON .. "|r" )
	self:SetAllPoints( Text )
end

local function OpenMenu()
	if not TukuiMicroButtonsDropDown then return end
	EasyMenu( S.MicroMenu, TukuiMicroButtonsDropDown, "cursor", 0, 0, "MENU", 2 )
end

Stat:RegisterEvent( "PLAYER_LOGIN" )
Stat:SetScript( "OnEvent", OnEvent )
Stat:SetScript( "OnMouseDown", function() OpenMenu() end )