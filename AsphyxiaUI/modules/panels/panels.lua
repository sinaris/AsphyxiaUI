local S, C, L = unpack( Tukui )

---------------------------------------------------------------------------------------------
-- kill this panels
---------------------------------------------------------------------------------------------
local panelsToKill = { TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiCubeLeft, TukuiCubeRight, TukuiLineToABLeft, TukuiLineToABRight, TukuiBar5, TukuiBar6, TukuiBar7, TukuiLineToPetActionBarBackground }

for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end

if( TukuiMinimap ) then
	TukuiMinimapStatsLeft:Kill()
	TukuiMinimapStatsRight:Kill()
end

if( C["chat"].background == true ) then
	TukuiLineToABLeftAlt:Kill()
	TukuiLineToABRightAlt:Kill()
end

---------------------------------------------------------------------------------------------
-- chat frames
---------------------------------------------------------------------------------------------
TukuiChatBackgroundLeft:ClearAllPoints()
TukuiChatBackgroundLeft:Size( C["chat"].width, C["chat"].height )
TukuiChatBackgroundLeft:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
TukuiChatBackgroundLeft:SetTemplate( "Transparent" )

TukuiChatBackgroundRight:ClearAllPoints()
TukuiChatBackgroundRight:Size( C["chat"].width, C["chat"].height )
TukuiChatBackgroundRight:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
TukuiChatBackgroundRight:SetTemplate( "Transparent" )

---------------------------------------------------------------------------------------------
-- chat tabs
---------------------------------------------------------------------------------------------
TukuiTabsLeftBackground:ClearAllPoints()
TukuiTabsLeftBackground:Point( "TOP", TukuiChatBackgroundLeft, "TOP", 0, -5 )
TukuiTabsLeftBackground:SetFrameLevel( TukuiChatBackgroundLeft:GetFrameLevel() + 1 )
TukuiTabsLeftBackground:CreateOverlay( TukuiTabsLeftBackground )

TukuiTabsRightBackground:ClearAllPoints()
TukuiTabsRightBackground:Point( "TOP", TukuiChatBackgroundRight, "TOP", 0, -5 )
TukuiTabsRightBackground:SetFrameLevel( TukuiChatBackgroundRight:GetFrameLevel() + 1 )
TukuiTabsRightBackground:CreateOverlay( TukuiTabsRightBackground )

if( C["chat"].background ~= true ) then
	TukuiChatBackgroundLeft:SetAlpha( 0 )
	TukuiChatBackgroundRight:SetAlpha( 0 )
	TukuiTabsLeftBackground:SetAlpha( 0 )
	TukuiTabsRightBackground:SetAlpha( 0 )
end

---------------------------------------------------------------------------------------------
-- info left, info right
---------------------------------------------------------------------------------------------
TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:SetPoint( "BOTTOM", TukuiChatBackgroundLeft, "BOTTOM", 0, 5 )
TukuiInfoLeft:SetFrameLevel( TukuiChatBackgroundLeft:GetFrameLevel() + 1 )
TukuiInfoLeft:CreateOverlay( TukuiInfoLeft )

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:SetPoint( "BOTTOM", TukuiChatBackgroundRight, "BOTTOM", 0, 5 )
TukuiInfoRight:SetFrameLevel( TukuiChatBackgroundRight:GetFrameLevel() + 1 )
TukuiInfoRight:CreateOverlay( TukuiInfoRight )

---------------------------------------------------------------------------------------------
-- actionbars
---------------------------------------------------------------------------------------------
if( C["actionbar"].enable == true ) then
	TukuiBar1:ClearAllPoints()
	TukuiBar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2 )
	TukuiBar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 48 )
	TukuiBar1:SetTemplate( "Transparent" )

	TukuiBar2:ClearAllPoints()
	TukuiBar2:SetAllPoints( TukuiBar1 )

	TukuiBar3:ClearAllPoints()
	TukuiBar3:SetAllPoints( TukuiBar1 )

	TukuiBar4:ClearAllPoints()
	TukuiBar4:SetAllPoints( TukuiBar1 )

	local TukuiSplitBarLeft = CreateFrame( "Frame", "TukuiSplitBarLeft", UIParent )
	TukuiSplitBarLeft:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, TukuiBar1:GetHeight(), "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -3, 0 )

	local TukuiSplitBarRight = CreateFrame( "Frame", "TukuiSplitBarRight", UIParent )
	TukuiSplitBarRight:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, TukuiBar1:GetHeight(), "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 3, 0 )

	local TukuiRightBar = CreateFrame( "Frame", "TukuiRightBar", UIParent )
	TukuiRightBar:CreatePanel( "Transparent", ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2, ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2, "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3 )
	if( C["chat"].background ~= true ) then
		TukuiRightBar:ClearAllPoints()
		TukuiRightBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
	end

	TukuiPetBar:ClearAllPoints()
	if( C["actionbar"].vertical_rightbars == true ) then
		TukuiPetBar:Width( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
		TukuiPetBar:Height( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
	else
		TukuiPetBar:Width( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
		TukuiPetBar:Height( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
	end
end