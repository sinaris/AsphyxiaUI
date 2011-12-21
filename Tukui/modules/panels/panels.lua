local S, C, L = unpack( select( 2, ... ) )

local TukuiChatBackgroundLeft = CreateFrame( "Frame", "TukuiChatBackgroundLeft", UIParent )
TukuiChatBackgroundLeft:CreatePanel( "Transparent", C["chat"].width, C["chat"].height, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
TukuiChatBackgroundLeft:CreateShadow( "Default" )

local TukuiChatBackgroundRight = CreateFrame("Frame", "TukuiChatBackgroundRight", UIParent)
TukuiChatBackgroundRight:CreatePanel( "Transparent", C["chat"].width, C["chat"].height, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
TukuiChatBackgroundRight:CreateShadow( "Default" )

local TukuiTabsLeftBackground = CreateFrame("Frame", "TukuiTabsLeftBackground", UIParent)
TukuiTabsLeftBackground:CreatePanel( "Default", TukuiChatBackgroundLeft:GetWidth() - 10, 23, "TOP", TukuiChatBackgroundLeft, "TOP", 0, -5 )
TukuiTabsLeftBackground:SetFrameLevel( TukuiChatBackgroundLeft:GetFrameLevel() + 1 )
TukuiTabsLeftBackground:CreateOverlay( TukuiTabsLeftBackground )

local TukuiTabsRightBackground = CreateFrame( "Frame", "TukuiTabsRightBackground", UIParent)
TukuiTabsRightBackground:CreatePanel( "Default", TukuiChatBackgroundRight:GetWidth() - 10, 23, "TOP", TukuiChatBackgroundRight, "TOP", 0, -5 )
TukuiTabsRightBackground:SetFrameLevel( TukuiChatBackgroundRight:GetFrameLevel() + 1 )
TukuiTabsRightBackground:CreateOverlay( TukuiTabsRightBackground )

local TukuiInfoLeft = CreateFrame("Frame", "TukuiInfoLeft", UIParent)
TukuiInfoLeft:CreatePanel( "Default", TukuiChatBackgroundLeft:GetWidth() - 10, 23, "BOTTOM", TukuiChatBackgroundLeft, "BOTTOM", 0, 5 )
TukuiInfoLeft:SetFrameLevel( TukuiChatBackgroundLeft:GetFrameLevel() + 1 )
TukuiInfoLeft:CreateOverlay( TukuiInforLeft )

local TukuiInfoRight = CreateFrame( "Frame", "TukuiInfoRight", UIParent )
TukuiInfoRight:CreatePanel( "Default", TukuiChatBackgroundLeft:GetWidth() - 10, 23, "BOTTOM", TukuiChatBackgroundRight, "BOTTOM", 0, 5 )
TukuiInfoRight:SetFrameLevel( TukuiChatBackgroundRight:GetFrameLevel() + 1 )
TukuiInfoRight:CreateOverlay( TukuiInfoRight )

if( C["chat"].background ~= true ) then
	TukuiChatBackgroundLeft:SetAlpha( 0 )
	TukuiChatBackgroundRight:SetAlpha( 0 )
	TukuiTabsLeftBackground:SetAlpha( 0 )
	TukuiTabsRightBackground:SetAlpha( 0 )
end

if( C["actionbar"].enable == true ) then
	local TukuiBar1 = CreateFrame( "Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate" )
	TukuiBar1:CreatePanel( "Transparent", ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2, "BOTTOM", UIParent, "BOTTOM", 0, 48 )
	TukuiBar1:CreateShadow( "Default" )

	local TukuiBar2 = CreateFrame( "Frame", "TukuiBar2", UIParent )
	TukuiBar2:SetAllPoints( TukuiBar1 )

	local TukuiBar3 = CreateFrame( "Frame", "TukuiBar3", UIParent )
	TukuiBar3:SetAllPoints( TukuiBar1 )

	local TukuiBar4 = CreateFrame( "Frame", "TukuiBar4", UIParent )
	TukuiBar4:SetAllPoints( TukuiBar1 )

	local TukuiSplitBarLeft = CreateFrame( "Frame", "TukuiSplitBarLeft", UIParent )
	TukuiSplitBarLeft:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, TukuiBar1:GetHeight(), "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -3, 0 )
	TukuiSplitBarLeft:CreateShadow( "Default" )

	local TukuiSplitBarRight = CreateFrame( "Frame", "TukuiSplitBarRight", UIParent )
	TukuiSplitBarRight:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, TukuiBar1:GetHeight(), "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 3, 0 )
	TukuiSplitBarRight:CreateShadow( "Default" )

	local TukuiRightBar = CreateFrame( "Frame", "TukuiRightBar", UIParent )
	TukuiRightBar:CreatePanel( "Transparent", ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2,  ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2, "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3 )
	TukuiRightBar:CreateShadow( "Default" )
	if( C["chat"].background ~= true ) then
		TukuiRightBar:ClearAllPoints()
		TukuiRightBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
	end

	local TukuiPetBar = CreateFrame( "Frame", "TukuiPetBar", UIParent )
	TukuiPetBar:CreatePanel( "Transparent", 1, 1, "BOTTOM", TukuiRightBar, "TOP", 0, 3 )
	if( C["actionbar"].vertical_rightbars == true ) then
		TukuiPetBar:Width( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
		TukuiPetBar:Height( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
	else
		TukuiPetBar:Width( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
		TukuiPetBar:Height( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
	end
end

if( C["datatext"].battleground == true ) then
	local bgframe = CreateFrame( "Frame", "TukuiInfoLeftBattleGround", UIParent )
	bgframe:CreatePanel( "Default", 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0 )
	bgframe:SetAllPoints( TukuiInfoLeft )
	bgframe:SetFrameStrata( "HIGH" )
	bgframe:SetFrameLevel( 0 )
	bgframe:CreateOverlay( bgframe )
	bgframe:EnableMouse( true )
	bgframe:SetTemplate( "Default", true )
end
