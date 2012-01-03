local S, C, L = unpack( select( 2, ... ) )

---------------------------------------------------------------------------------------------
-- main frame
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrame = CreateFrame( "Frame", "AsphyxiaUIMainFrame", UIParent )
AsphyxiaUIMainFrame:SetSize( 650, 350 )
AsphyxiaUIMainFrame:SetPoint( "CENTER" )
AsphyxiaUIMainFrame:SetTemplate( "Transparent" )
AsphyxiaUIMainFrame:CreateShadow( "Default" )
AsphyxiaUIMainFrame:Hide()
AsphyxiaUIMainFrame:SetFrameLevel( 10 )
AsphyxiaUIMainFrame:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIMainFrameIconTopLeft = CreateFrame( "Frame", "AsphyxiaTest", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameIconTopLeft:CreatePanel( nil, 58, 58, "BOTTOMRIGHT", AsphyxiaUIMainFrame, "TOPRIGHT", 0, 3 )
AsphyxiaUIMainFrameIconTopLeft:SetFrameStrata( "HIGH" )
AsphyxiaUIMainFrameIconTopLeft:CreateShadow( "Default" )

AsphyxiaUIMainFrameIconTopLeft.Background = AsphyxiaUIMainFrameIconTopLeft:CreateTexture( nil, "ARTWORK" )
AsphyxiaUIMainFrameIconTopLeft.Background:Point( "TOPLEFT", 2, -2 )
AsphyxiaUIMainFrameIconTopLeft.Background:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIMainFrameIconTopLeft.Background:SetTexture( C["media"].asphyxia )

local AsphyxiaUIMainFrameIconTopRight = CreateFrame( "Frame", "AsphyxiaTest", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameIconTopRight:CreatePanel( nil, 58, 58, "BOTTOMLEFT", AsphyxiaUIMainFrame, "TOPLEFT", 0, 3 )
AsphyxiaUIMainFrameIconTopRight:SetFrameStrata( "HIGH" )
AsphyxiaUIMainFrameIconTopRight:CreateShadow( "Default" )

AsphyxiaUIMainFrameIconTopRight.Background = AsphyxiaUIMainFrameIconTopRight:CreateTexture( nil, "ARTWORK" )
AsphyxiaUIMainFrameIconTopRight.Background:Point( "TOPLEFT", 2, -2 )
AsphyxiaUIMainFrameIconTopRight.Background:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIMainFrameIconTopRight.Background:SetTexture( C["media"].asphyxia )

local AsphyxiaUIMainFrameTitle = CreateFrame( "Frame", "TukuiInstallTitle", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameTitle:CreatePanel( "Transparent", AsphyxiaUIMainFrame:GetWidth( ) - 122, 30, "BOTTOM", AsphyxiaUIMainFrame, "TOP", 0, 3 )
AsphyxiaUIMainFrameTitle:SetFrameStrata( "HIGH" )
AsphyxiaUIMainFrameTitle:CreateShadow( "Default" )

local AsphyxiaUIMainFrameTitleText = AsphyxiaUIMainFrameTitle:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameTitleText:SetFont( C["media"].font, 16, "THINOUTLINE" )
AsphyxiaUIMainFrameTitleText:SetPoint( "CENTER", AsphyxiaUIMainFrameTitle, 0, 0 )
AsphyxiaUIMainFrameTitleText:SetText( L.core_asphyxiauihelp_header )

---------------------------------------------------------------------------------------------
-- main frame - navigation
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrameNavigation = CreateFrame( "Frame", "AsphyxiaUIMainFrameNavigation", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameNavigation:SetSize( 180, 342 )
AsphyxiaUIMainFrameNavigation:SetPoint( "LEFT", 4, 0 )
AsphyxiaUIMainFrameNavigation:SetTemplate( "Transparent" )

local AsphyxiaUIMainFrameNavigationText = AsphyxiaUIMainFrameNavigation:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameNavigationText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
AsphyxiaUIMainFrameNavigationText:SetPoint( "BOTTOM", AsphyxiaUIMainFrameNavigation, "BOTTOM", 0, 4 )
AsphyxiaUIMainFrameNavigationText:SetJustifyH( "CENTER" )
AsphyxiaUIMainFrameNavigationText:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_revision )

---------------------------------------------------------------------------------------------
-- main frame - content
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrameContent = CreateFrame( "Frame", "AsphyxiaUIMainFrameContent", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameContent:SetSize( 458, 342 )
AsphyxiaUIMainFrameContent:SetPoint( "RIGHT", -4, 0 )
AsphyxiaUIMainFrameContent:SetTemplate( "Transparent" )

local AsphyxiaUIMainFrameContentScrollFrame = CreateFrame( "ScrollFrame", "AsphyxiaUIMainFrameContentScrollFrame", AsphyxiaUIMainFrameContent, "UIPanelScrollFrameTemplate" )
AsphyxiaUIMainFrameContentScrollFrame:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContent, "TOPLEFT", 4, -4 )
AsphyxiaUIMainFrameContentScrollFrame:SetPoint( "BOTTOMRIGHT", AsphyxiaUIMainFrameContent, "BOTTOMRIGHT", -27, 4 )
S.SkinScrollBar( AsphyxiaUIMainFrameContentScrollFrameScrollBar )

local AsphyxiaUIMainFrameContentScrollFrameBackground = CreateFrame( "Frame", "AsphyxiaUIMainFrameContentScrollFrameBackground", AsphyxiaUIMainFrameContentScrollFrame )
AsphyxiaUIMainFrameContentScrollFrameBackground:SetPoint( "TOPLEFT" )
AsphyxiaUIMainFrameContentScrollFrameBackground:SetWidth( AsphyxiaUIMainFrameContentScrollFrame:GetWidth() )
AsphyxiaUIMainFrameContentScrollFrameBackground:SetHeight( AsphyxiaUIMainFrameContentScrollFrame:GetHeight() )
AsphyxiaUIMainFrameContentScrollFrame:SetScrollChild( AsphyxiaUIMainFrameContentScrollFrameBackground )
	
local AsphyxiaUIMainFrameContentTitle = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentTitle:SetFont( C["media"].font, 14, "THINOUTLINE" )
AsphyxiaUIMainFrameContentTitle:SetPoint( "TOP", AsphyxiaUIMainFrameContentScrollFrameBackground, "TOP", 0, -10 )

local AsphyxiaUIMainFrameContentText1 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText1:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText1:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText1:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 20 )
AsphyxiaUIMainFrameContentText1:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentScrollFrameBackground, "TOPLEFT", 10, -45 )

local AsphyxiaUIMainFrameContentText2 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText2:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText2:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText2:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 30 )
AsphyxiaUIMainFrameContentText2:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentText1, "BOTTOMLEFT", 0, -20 )

local AsphyxiaUIMainFrameContentText3 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText3:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText3:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText3:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 30 )
AsphyxiaUIMainFrameContentText3:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentText2, "BOTTOMLEFT", 0, -20 )

local AsphyxiaUIMainFrameContentText4 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText4:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText4:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText4:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 30 )
AsphyxiaUIMainFrameContentText4:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentText3, "BOTTOMLEFT", 0, -20 )

local AsphyxiaUIMainFrameContentText5 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText5:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText5:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText5:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 30 )
AsphyxiaUIMainFrameContentText5:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentText4, "BOTTOMLEFT", 0, -20 )

local AsphyxiaUIMainFrameContentText6 = AsphyxiaUIMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIMainFrameContentText6:SetJustifyH( "LEFT" )
AsphyxiaUIMainFrameContentText6:SetFont( C["media"].font, 12, "THINOUTLINE" )
AsphyxiaUIMainFrameContentText6:SetWidth( AsphyxiaUIMainFrameContentScrollFrameBackground:GetWidth() - 30 )
AsphyxiaUIMainFrameContentText6:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentText5, "BOTTOMLEFT", 0, -20 )

---------------------------------------------------------------------------------------------
-- main frame - navigation - buttons
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrameNavigationButtonAttributes = {
	[1] = { "/ahelp 1" },
	[2] = { "/ahelp 2" },
	[3] = { "/ahelp 3" },
	[4] = { "/ahelp 4" },
	[5] = { "/ahelp 5" },
	[6] = { "/ahelp 6" },
	[7] = { "/ahelp 7" },
	[8] = { "/ahelp 8" },
	[9] = { "/ahelp 9" },
}

local AsphyxiaUIMainFrameNavigationButtonTexts = {
	[1] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button1 },
	[2] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button2 },
	[3] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button3 },
	[4] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button4 },
	[5] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button5 },
	[6] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button6 },
	[7] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button7 },
	[8] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button8 },
	[9] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_asphyxiauihelp_button9 },
}

local AsphyxiaUIMainFrameNavigationButton = CreateFrame( "Button", "AsphyxiaUIMainFrameNavigationButton", AsphyxiaUIMainFrameNavigation )
for i = 1, 9 do
	AsphyxiaUIMainFrameNavigationButton[i] = CreateFrame( "Button", "AsphyxiaUIMainFrameNavigationButton" .. i, AsphyxiaUIMainFrameNavigation, "SecureActionButtonTemplate" )
	AsphyxiaUIMainFrameNavigationButton[i]:CreatePanel( "Default", AsphyxiaUIMainFrameNavigation:GetWidth() - 8, 24, "TOP", AsphyxiaUIMainFrameNavigation, "TOP", 0, -4, true )
	AsphyxiaUIMainFrameNavigationButton[i].Text = S.SetFontString( AsphyxiaUIMainFrameNavigationButton[i], C["media"].font, C["datatext"].fontsize, "THINOUTLINE" )
	AsphyxiaUIMainFrameNavigationButton[i]:SetFrameLevel( AsphyxiaUIMainFrameNavigation:GetFrameLevel() + 1 )
	AsphyxiaUIMainFrameNavigationButton[i].Text:Point( "CENTER", AsphyxiaUIMainFrameNavigationButton[i], "CENTER", 0, 0 )
	AsphyxiaUIMainFrameNavigationButton[i].Text:SetText( unpack( AsphyxiaUIMainFrameNavigationButtonTexts[i] ) )

	if( i == 1 ) then
		AsphyxiaUIMainFrameNavigationButton[i]:Point( "TOP", AsphyxiaUIMainFrameNavigation, "TOP", 0, -5 )
	else
		AsphyxiaUIMainFrameNavigationButton[i]:Point( "TOP", AsphyxiaUIMainFrameNavigationButton[i - 1], "BOTTOM", 0, -3 )
	end
	AsphyxiaUIMainFrameNavigationButton[i]:SetAttribute( "type", "macro" )
	AsphyxiaUIMainFrameNavigationButton[i]:SetAttribute( "macrotext", unpack( AsphyxiaUIMainFrameNavigationButtonAttributes[i] ) )
	AsphyxiaUIMainFrameNavigationButton[i]:CreateOverlay( AsphyxiaUIMainFrameNavigationButton[i] )
	AsphyxiaUIMainFrameNavigationButton[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIMainFrameNavigationButton[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

---------------------------------------------------------------------------------------------
-- functions
---------------------------------------------------------------------------------------------
local ahelpcontentclose = CreateFrame( "Button", "AsphyxiaUIMainFrameContentCloseButton", AsphyxiaUIMainFrameContentScrollFrameBackground, "UIPanelCloseButton" )
ahelpcontentclose:SetPoint( "TOPRIGHT", AsphyxiaUIMainFrameContentScrollFrameBackground, "TOPRIGHT" )
S.SkinCloseButton( ahelpcontentclose )
ahelpcontentclose:SetScript( "OnClick", function()
	AsphyxiaUIMainFrame:SlideOut()
end )

local ahelpcontent = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry0_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry0_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry0_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry0_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry0_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry0_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry0_line6 )
end

local ahelp9content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry9_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry9_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry9_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry9_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry9_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry9_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry9_line6 )
end

local ahelp8content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry8_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry8_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry8_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry8_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry8_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry8_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry8_line6 )
end

local ahelp7content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry7_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry7_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry7_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry7_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry7_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry7_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry7_line6 )
end

local ahelp6content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry6_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry6_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry6_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry6_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry6_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry6_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry6_line6 )
end

local ahelp5content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry5_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry5_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry5_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry5_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry5_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry5_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry5_line6 )
end

local ahelp4content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry4_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry4_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry4_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry4_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry4_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry4_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry4_line6 )
end

local ahelp3content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry3_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry3_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry3_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry3_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry3_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry3_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry3_line6 )
end

local ahelp2content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry2_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry2_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry2_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry2_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry2_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry2_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry2_line6 )
end

local ahelp1content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( L.core_asphyxiauihelp_entry1_title )
	AsphyxiaUIMainFrameContentText1:SetText( L.core_asphyxiauihelp_entry1_line1 )
	AsphyxiaUIMainFrameContentText2:SetText( L.core_asphyxiauihelp_entry1_line2 )
	AsphyxiaUIMainFrameContentText3:SetText( L.core_asphyxiauihelp_entry1_line3 )
	AsphyxiaUIMainFrameContentText4:SetText( L.core_asphyxiauihelp_entry1_line4 )
	AsphyxiaUIMainFrameContentText5:SetText( L.core_asphyxiauihelp_entry1_line5 )
	AsphyxiaUIMainFrameContentText6:SetText( L.core_asphyxiauihelp_entry1_line6 )
end

---------------------------------------------------------------------------------------------
-- slash command
---------------------------------------------------------------------------------------------
local ahelp = AsphyxiaUIHelp or function() end
AsphyxiaUIHelp = function( msg )
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end

	AsphyxiaUIMainFrame:Animate( 0, 500, 0.8 )

	if( msg == "1" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp1content()
	elseif( msg == "2" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp2content()
	elseif( msg == "3" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp3content()
	elseif( msg == "4" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp4content()
	elseif( msg == "5" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp5content()
	elseif( msg == "6" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp6content()
	elseif( msg == "7" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp7content()
	elseif( msg == "8" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp8content()
	elseif( msg == "9" ) then
		if not AsphyxiaUIMainFrame:IsVisible() then return end
		ahelp9content()
	else
		if( AsphyxiaUIMainFrame:IsVisible() ) then
			AsphyxiaUIMainFrame:SlideOut()
		else
			AsphyxiaUIMainFrame:SlideIn()
			ahelpcontent()
		end
	end
end

SlashCmdList.AsphyxiaUIHelp = AsphyxiaUIHelp
SLASH_AsphyxiaUIHelp1 = "/ahelp"