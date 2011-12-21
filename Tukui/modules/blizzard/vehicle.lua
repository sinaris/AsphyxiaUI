local S, C, L = unpack( select( 2, ... ) )

local anchor = CreateFrame( "Frame", "TukuiVehicleAnchor", UIParent )
anchor:Point( "BOTTOM", UIParent, "BOTTOM", 0, 208 )
anchor:Size( 120, 20 )
anchor:SetMovable( true )
anchor:SetClampedToScreen( true )
anchor:SetTemplate( "Default" )
anchor:SetBackdropBorderColor( 1, 0, 0 )
anchor:SetAlpha( 0 )
anchor.text = S.SetFontString( anchor, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
anchor.text:SetPoint( "CENTER" )
anchor.text:SetText( L.move_vehicle )

hooksecurefunc( VehicleSeatIndicator, "SetPoint", function( _, _, parent )
	if( ( parent == "MinimapCluster" ) or ( parent == _G["MinimapCluster"] ) ) then
		VehicleSeatIndicator:ClearAllPoints()
		VehicleSeatIndicator:Point( "BOTTOM", anchor, "BOTTOM", 0, 24 )
	end
end )

local function VehicleNumSeatIndicator()
	if( VehicleSeatIndicatorButton6 ) then
		S.numSeat = 6
	elseif( VehicleSeatIndicatorButton5 ) then
		S.numSeat = 5
	elseif( VehicleSeatIndicatorButton4 ) then
		S.numSeat = 4
	elseif( VehicleSeatIndicatorButton3 ) then
		S.numSeat = 3
	elseif( VehicleSeatIndicatorButton2 ) then
		S.numSeat = 2
	elseif( VehicleSeatIndicatorButton1 ) then
		S.numSeat = 1
	end
end

local function vehmousebutton( alpha )
	for i = 1, S.numSeat do
	local pb = _G["VehicleSeatIndicatorButton" .. i]
		pb:SetAlpha( alpha )
	end
end

local function vehmouse()
	if( VehicleSeatIndicator:IsShown() ) then
		VehicleSeatIndicator:SetAlpha( 0 )
		VehicleSeatIndicator:EnableMouse( true )

		VehicleNumSeatIndicator()

		VehicleSeatIndicator:HookScript( "OnEnter", function() VehicleSeatIndicator:SetAlpha( 1 ) vehmousebutton( 1 ) end )
		VehicleSeatIndicator:HookScript( "OnLeave", function() VehicleSeatIndicator:SetAlpha( 0 ) vehmousebutton( 0 ) end )

		for i = 1, S.numSeat do
			local pb = _G["VehicleSeatIndicatorButton" .. i]
			pb:SetAlpha( 0 )
			pb:HookScript( "OnEnter", function( self ) VehicleSeatIndicator:SetAlpha( 1 ) vehmousebutton( 1 ) end )
			pb:HookScript( "OnLeave", function( self ) VehicleSeatIndicator:SetAlpha( 0 ) vehmousebutton( 0 ) end )
		end
	end
end
hooksecurefunc( "VehicleSeatIndicator_Update", vehmouse )