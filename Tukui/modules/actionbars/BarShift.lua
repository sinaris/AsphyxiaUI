local S, C, L = unpack( select( 2, ... ) )

if( C["actionbar"].enable ~= true ) then return end

local TukuiShift = CreateFrame( "Frame", "TukuiShiftBar", UIParent )
if( C["actionbar"].vertical_shapeshift == true ) then
	TukuiShift:Point( "TOPLEFT", TukuiChatBackgroundLeft, "TOPRIGHT", 2, 0 )
else
	TukuiShift:Point( "BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMRIGHT", 2, -1 )
end
TukuiShift:SetWidth( ( S.stancebuttonsize * 5 ) + ( S.stancebuttonsize * 4 ) )
TukuiShift:SetHeight( 10 )
TukuiShift:SetFrameStrata( "MEDIUM" )
TukuiShift:SetMovable( true )
TukuiShift:SetClampedToScreen( true )

local ssmover = CreateFrame( "Frame", "TukuiShapeShiftHolder", UIParent )
ssmover:SetAllPoints( TukuiShift )
ssmover:SetTemplate( "Default" )
ssmover:SetFrameStrata( "HIGH" )
ssmover:SetBackdropBorderColor( 1, 0, 0 )
ssmover:SetAlpha( 0 )
ssmover.text = S.SetFontString( ssmover, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
ssmover.text:SetPoint( "CENTER" )
ssmover.text:SetText( L.move_shapeshift )

local ssborder = CreateFrame( "Frame", "ShapeShiftBorder", ShapeshiftButton1 )
ssborder:SetTemplate( "Transparent" )
ssborder:CreateShadow( "Default" )
ssborder:SetFrameLevel( 1 )
ssborder:SetFrameStrata( "BACKGROUND" )
if( C["actionbar"].vertical_shapeshift == true ) then
	ssborder:Point( "TOP", 0, S.buttonspacing )
else
	ssborder:Point( "LEFT", -S.buttonspacing, 0 )
end

if( C["actionbar"].hideshapeshift == true ) then TukuiShift:Hide() return end

local bar = CreateFrame( "Frame", "TukuiShapeShift", TukuiShift, "SecureHandlerStateTemplate" )
bar:ClearAllPoints()
bar:SetAllPoints( TukuiShift )

local States = {
	["DRUID"] = "show",
	["WARRIOR"] = "show",
	["PALADIN"] = "show",
	["DEATHKNIGHT"] = "show",
	["ROGUE"] = "show,",
	["PRIEST"] = "show,",
	["HUNTER"] = "show,",
	["WARLOCK"] = "show,",
}

bar:RegisterEvent( "PLAYER_LOGIN" )
bar:RegisterEvent( "PLAYER_ENTERING_WORLD" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_FORMS" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_USABLE" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_COOLDOWN" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_FORM" )
bar:RegisterEvent( "ACTIONBAR_PAGE_CHANGED" )
bar:SetScript( "OnEvent", function( self, event, ... )
	if( event == "PLAYER_LOGIN" ) then
		local button
		for i = 1, NUM_SHAPESHIFT_SLOTS do
			button = _G["ShapeshiftButton" .. i]
			button:ClearAllPoints()
			button:SetParent( self )
			button:SetFrameStrata( "LOW" )
			if( i == 1 ) then
				if( C["actionbar"].vertical_shapeshift == true ) then
					button:Point( "TOPLEFT", 5, -5 )
				else
					button:Point( "BOTTOMLEFT", 5, 5 )
				end
			else
				local previous = _G["ShapeshiftButton" .. i - 1]
				if( C["actionbar"].vertical_shapeshift == true ) then
					button:Point( "TOP", previous, "BOTTOM", 0, -S.buttonspacing )
				else
					button:Point( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
				end
			end
			local _, name = GetShapeshiftFormInfo( i )
			if( name ) then
				button:Show()
			end
		end
		RegisterStateDriver( self, "visibility", States[S.myclass] or "hide" )
	elseif( event == "UPDATE_SHAPESHIFT_FORMS" ) then
		if( InCombatLockdown() ) then return end
		local button
		for i = 1, NUM_SHAPESHIFT_SLOTS do
			button = _G["ShapeshiftButton" .. i]
			local _, name = GetShapeshiftFormInfo( i )
			if( name ) then
				button:Show()
			else
				button:Hide()
			end
		end

		S.TukuiShiftBarUpdate()
		if( C["actionbar"].vertical_shapeshift == true ) then
			ssborder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, ShapeshiftButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ssborder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, ShapeshiftButton1:GetHeight() + 2 * S.buttonspacing )
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		S.StyleShift()
		if( C["actionbar"].vertical_shapeshift == true ) then
			ssborder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, ShapeshiftButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ssborder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() )+ S.buttonspacing, ShapeshiftButton1:GetHeight()+ 2 * S.buttonspacing )
		end

		if( C["actionbar"].mouseover_shapeshift == true ) then
			local function mouseover( alpha )
				for i = 1, NUM_SHAPESHIFT_SLOTS do
					local sb = _G["ShapeshiftButton" .. i]
					sb:SetAlpha( alpha )
				end
			end

			for i = 1, NUM_SHAPESHIFT_SLOTS do
				_G["ShapeshiftButton"..i]:SetAlpha( 0 )
				_G["ShapeshiftButton"..i]:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
				_G["ShapeshiftButton"..i]:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
			end

			ssborder:EnableMouse( true )
			ssborder:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
			ssborder:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
		end
	else
		S.TukuiShiftBarUpdate()
	end
end )