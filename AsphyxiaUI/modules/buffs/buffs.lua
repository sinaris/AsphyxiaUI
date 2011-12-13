local S, C, L = unpack( Tukui )

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerBuffs:Point( "TOPRIGHT", -204, -8 )
TukuiAurasPlayerBuffs:SetAttribute( "wrapAfter", 16 )

TukuiAurasPlayerDebuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", -204, -148 )
TukuiAurasPlayerDebuffs:SetAttribute( "wrapAfter", 16 )

local hookFrames = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function( self )
	for i = 1, self:GetNumChildren() do
		local child = select( i, self:GetChildren() )

		if( child.Duration ) then
			child.Duration:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			child.Duration:ClearAllPoints()
			child.Duration:SetPoint( "BOTTOM", 0, 1 )
		end

		if( child.Count ) then
			child.Count:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			child.Count:ClearAllPoints()
			child.Count:SetPoint( "BOTTOM", 0, 1 )
		end
		
		child:CreateShadow( "Default" )
	end
end

for _, frame in pairs( hookFrames ) do
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:HookScript( "OnAttributeChanged", OnAttributeChanged )
	frame:HookScript( "OnEvent", OnAttributeChanged )
end