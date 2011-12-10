local S, C, L = unpack( Tukui )

local ahelp = CreateFrame( "Button", "TukuiAsphyxiaHelpFrame", UIParent )
ahelp:SetSize( 550, 335 )
ahelp:SetPoint( "CENTER" )
ahelp:SetTemplate( "Transparent" )
ahelp:CreateShadow( "Default" )
ahelp:FontString( "Text", C["media"].font, 13 )
ahelp.Text:SetPoint( "CENTER" )
ahelp.Text:SetText( L.core_uihelp20 .. L.core_uihelp21 .. L.core_uihelp22 .. L.core_uihelp23 .. L.core_uihelp24 .. L.core_uihelp25 .. L.core_uihelp26 .. L.core_uihelp27 .. L.core_uihelp28 .. L.core_uihelp29 .. L.core_uihelp30 )
ahelp:SetScript( "OnClick", function()
	ahelp:Hide()
end )
ahelp:Hide()

local logon = CreateFrame( "Frame" )
logon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
logon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	local playerName = UnitName( "player" )
	print( "Whats up, |cff00AAFF" .. playerName .. "!|r Thank you for using |cffFF6347AsphyxiaUI|r |cff00AAFF(A heavily modified version of Tukui)." )
	print( "For detailed Information |cff00FFFFvisit www.tukui.org or https://github.com/Sinaris" )
end )