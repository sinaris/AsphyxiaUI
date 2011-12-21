local p = CreateFrame( "Frame" )
p:RegisterEvent( "CVAR_UPDATE" )
p:RegisterEvent( "PLAYER_ENTERING_WORLD" )
p:SetScript( "OnEvent", function( self, event, cvar )
	SetCVar( "profanityFilter", 0 )
end )

InterfaceOptionsSocialPanelProfanityFilter:Kill()