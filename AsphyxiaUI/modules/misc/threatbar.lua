local S, C, L = unpack( Tukui )

local TukuiThreatBarBG = CreateFrame( "Frame", nil, TukuiThreatBar )
TukuiThreatBarBG:CreatePanel( "Default", TukuiBar1:GetWidth(), 20, "TOP", TukuiBar1, "BOTTOM", 0, -3 )
TukuiThreatBarBG:SetFrameStrata( "BACKGROUND" )

TukuiThreatBar:ClearAllPoints()
TukuiThreatBar:Point( "TOPLEFT", TukuiThreatBarBG, 2, -2 )
TukuiThreatBar:Point( "BOTTOMRIGHT", TukuiThreatBarBG, -2, 2 )

TukuiThreatBar.text = S.SetFontString( TukuiThreatBar, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
TukuiThreatBar.text:Point( "RIGHT", TukuiThreatBar, "RIGHT", -30, 0 )

TukuiThreatBar.Title:Kill()
TukuiThreatBar.Title = S.SetFontString( TukuiThreatBar, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
TukuiThreatBar.Title:SetText( L.unitframes_ouf_threattext )
TukuiThreatBar.Title:SetPoint( "LEFT", TukuiThreatBar, "LEFT", S.Scale( 30 ), 0 )