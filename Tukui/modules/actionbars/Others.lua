local S, C, L = unpack( select( 2, ... ) )

if( C["actionbar"].enable ~= true ) then
	TukuiPetBar:Hide()
	TukuiBar5:Hide()
	TukuiBar6:Hide()
	TukuiBar7:Hide()
	TukuiBar5ButtonTop:Hide()
	TukuiBar5ButtonBottom:Hide()
	return
end

local TukuiOnLogon = CreateFrame( "Frame" )
TukuiOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
TukuiOnLogon:SetScript( "OnEvent", function( self, event )	
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	local installed = TukuiDataPerChar.install
	if( installed ) then
		local b1, b2, b3, b4 = GetActionBarToggles()
		if( not b1 or not b2 or not b3 or not b4 ) then
			SetActionBarToggles( 1, 1, 1, 1 )
			StaticPopup_Show( "TUKUI_FIX_AB" )
		end
	end

	if( C["actionbar"].showgrid == true ) then
		ActionButton_HideGrid = S.dummy
		for i = 1, 12 do
			local button = _G[format( "ActionButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )

			button = _G[format( "BonusActionButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )
			
			button = _G[format( "MultiBarRightButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )

			button = _G[format( "MultiBarBottomRightButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )
			
			button = _G[format( "MultiBarLeftButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )
			
			button = _G[format( "MultiBarBottomLeftButton%d", i )]
			button:SetAttribute( "showgrid", 1 )
			ActionButton_ShowGrid( button )
		end
	end
end )