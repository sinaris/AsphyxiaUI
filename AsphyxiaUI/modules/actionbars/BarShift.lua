local S, C, L = unpack( Tukui )

if( C["actionbar"].enable ~= true ) then return end

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

TukuiShapeShift:HookScript( "OnEvent", function( self, event, ... )
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
			ShapeShiftBorder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, ShapeshiftButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ShapeShiftBorder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, ShapeshiftButton1:GetHeight() + 2 * S.buttonspacing )
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then

		S.StyleShift()
		if( C["actionbar"].vertical_shapeshift == true ) then
			ShapeShiftBorder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, ShapeshiftButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ShapeShiftBorder:Size( ( ( ShapeshiftButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() )+ S.buttonspacing, ShapeshiftButton1:GetHeight()+ 2 * S.buttonspacing )
		end
	else
		S.TukuiShiftBarUpdate()
	end
end )

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