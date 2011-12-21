local S, C, L = unpack( select( 2, ... ) )

local TukuiGMFrameAnchor = CreateFrame( "Button", "TukuiGMFrameAnchor", UIParent )
TukuiGMFrameAnchor:SetFrameStrata( "TOOLTIP" )
TukuiGMFrameAnchor:SetFrameLevel( 20 )
TukuiGMFrameAnchor:SetHeight( 40 )
TukuiGMFrameAnchor:SetWidth( TicketStatusFrameButton:GetWidth() )
TukuiGMFrameAnchor:SetClampedToScreen( true )
TukuiGMFrameAnchor:SetMovable( true )
TukuiGMFrameAnchor:SetTemplate( "Default" )
TukuiGMFrameAnchor:SetBackdropBorderColor( 1, 0, 0, 1 )
TukuiGMFrameAnchor:SetBackdropColor( unpack( C["media"].backdropcolor ) )
TukuiGMFrameAnchor:Point( "TOPLEFT", 4, -40 )
TukuiGMFrameAnchor.text = S.SetFontString( TukuiGMFrameAnchor, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
TukuiGMFrameAnchor.text:SetPoint( "CENTER" )
TukuiGMFrameAnchor.text:SetText( L.move_gmframe )
TukuiGMFrameAnchor.text:SetParent( TukuiGMFrameAnchor )
TukuiGMFrameAnchor:Hide()

TicketStatusFrame:ClearAllPoints()
TicketStatusFrame:SetPoint( "TOP", TukuiGMFrameAnchor, "TOP" )

SLASH_GM1 = "/gm"
SlashCmdList["GM"] = function() ToggleHelpFrame() end