local S, C, L = unpack( Tukui )

if( C["actionbar"].enable ~= true ) then return end

TukuiExitVehicleButtonLeft:Kill()
TukuiExitVehicleButtonRight:Kill()
TukuiBar2Button:Kill()
TukuiBar3Button:Kill()
TukuiBar4Button:Kill()
TukuiBar5ButtonTop:Kill()
TukuiBar5ButtonBottom:Kill()

local TukuiOnLogon = CreateFrame( "Frame" )
TukuiOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
TukuiOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )	
	SetActionBarToggles( 1, 1, 1, 1, 0 )
	SetCVar( "alwaysShowActionBars", 0 )	
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

local vehicle = CreateFrame( "Button", "TukuiExitVehicleButton", UIParent, "SecureHandlerClickTemplate" )
vehicle:CreatePanel( "Default", S.buttonsize * 2, S.buttonsize + 1, "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMLEFT", -3, 0 )
vehicle:CreateOverlay( vehicle )
vehicle:RegisterForClicks( "AnyUp" )
vehicle:SetScript( "OnClick", function() VehicleExit() end )
vehicle.text = S.SetFontString( vehicle, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
vehicle.text:Point( "CENTER", 1, 1 )
vehicle.text:SetText( S.datacolor .. "Exit" )
RegisterStateDriver( vehicle, "visibility", "[target=vehicle,exists] show;hide" )

vehicle:HookScript( "OnEnter", S.SetModifiedBackdrop )
vehicle:HookScript( "OnLeave", S.SetOriginalBackdrop )