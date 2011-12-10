local S, C, L = unpack( Tukui )

local init = CreateFrame( "Frame" )
init:RegisterEvent( "ADDON_LOADED" )
init:SetScript( "OnEvent", function( self, event )
	if not TukuiSaved then
		TukuiSaved = {
			["bottomrows"] = 1,
			["rightbars"] = 1,
			["splitbars"] = false,
			["actionbarsLocked"] = false,
		}
	end
local TukuiSaved = TukuiSaved

end )