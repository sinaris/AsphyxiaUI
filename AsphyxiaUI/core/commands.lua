local S, C, L = unpack( Tukui )

SLASH_TEST1 = "/test"
SlashCmdList["TEST"] = function()
	for _, frames in pairs( { "TukuiPet", "TukuiFocus", "TukuiFocusTarget", "TukuiBoss1", "TukuiBoss2", "TukuiBoss3", "TukuiBoss4" } ) do
        _G[frames].Hide = function() end
        _G[frames]:Show()
        _G[frames].unit = "player"
	end
end

SLASH_TESTARENA1 = "/testarena"
SlashCmdList["TESTARENA"] = function()
	for _, frames in pairs( { "TukuiArena1", "TukuiArena2", "TukuiArena3", "TukuiArena4" } ) do
        _G[frames].Hide = function() end
        _G[frames]:Show()
        _G[frames].unit = "player"
	end
end