local S, C, L = unpack( select( 2, ... ) )

if( C["actionbar"].enable ~= true ) then return end

do
	MainMenuBar:SetScale( 0.00001 )
	MainMenuBar:EnableMouse( false )
	VehicleMenuBar:SetScale( 0.00001 )
	VehicleMenuBar:EnableMouse( false )
	PetActionBarFrame:EnableMouse( false )
	ShapeshiftBarFrame:EnableMouse( false )

	local elements = {
		MainMenuBar, MainMenuBarArtFrame, BonusActionBarFrame, VehicleMenuBar,
		PossessBarFrame, PetActionBarFrame, ShapeshiftBarFrame,
		ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight,
	}
	for _, element in pairs( elements ) do
		if( element:GetObjectType() == "Frame" ) then
			element:UnregisterAllEvents()
		end

		if( element ~= MainMenuBar ) then
			element:Hide()
		end
		element:SetAlpha( 0 )
	end
	elements = nil

	hooksecurefunc( "TalentFrame_LoadUI", function()
		PlayerTalentFrame:UnregisterEvent( "ACTIVE_TALENT_GROUP_CHANGED" )
	end )
end

do
	local uiManagedFrames = {
		"MultiBarLeft",
		"MultiBarRight",
		"MultiBarBottomLeft",
		"MultiBarBottomRight",
		"ShapeshiftBarFrame",
		"PossessBarFrame",
		"PETACTIONBAR_YPOS",
		"MultiCastActionBarFrame",
		"MULTICASTACTIONBAR_YPOS",
		"ChatFrame1",
		"ChatFrame2",
		"ExtraActionBarFrame",
	}
	for _, frame in pairs( uiManagedFrames ) do
		UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
	end
	uiManagedFrames = nil
end