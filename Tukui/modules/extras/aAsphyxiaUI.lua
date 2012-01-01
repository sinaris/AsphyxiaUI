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
AsphyxiaUIMainFrameTitleText:SetText( "|cff00AAFFAsphyxiaUI " .. S.xversion .. "|r - Help" )

---------------------------------------------------------------------------------------------
-- main frame - navigation
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrameNavigation = CreateFrame( "Frame", "AsphyxiaUIMainFrameNavigation", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameNavigation:SetSize( 180, 342 )
AsphyxiaUIMainFrameNavigation:SetPoint( "LEFT", 4, 0 )
AsphyxiaUIMainFrameNavigation:SetTemplate( "Transparent" )

---------------------------------------------------------------------------------------------
-- main frame - content
---------------------------------------------------------------------------------------------
local AsphyxiaUIMainFrameContent = CreateFrame( "Frame", "AsphyxiaUIMainFrameContent", AsphyxiaUIMainFrame )
AsphyxiaUIMainFrameContent:SetSize( 458, 342 )
AsphyxiaUIMainFrameContent:SetPoint( "RIGHT", -4, 0 )
AsphyxiaUIMainFrameContent:SetTemplate( "Transparent" )

local AsphyxiaUIMainFrameContentScrollFrame = CreateFrame( "ScrollFrame", "AsphyxiaUIMainFrameContentScrollFrame", AsphyxiaUIMainFrameContent, "UIPanelScrollFrameTemplate" )
AsphyxiaUIMainFrameContentScrollFrame:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContent, "TOPLEFT", 10, -10 )
AsphyxiaUIMainFrameContentScrollFrame:SetPoint( "BOTTOMRIGHT", AsphyxiaUIMainFrameContent, "BOTTOMRIGHT", -30, 10 )
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
AsphyxiaUIMainFrameContentText1:SetPoint( "TOPLEFT", AsphyxiaUIMainFrameContentScrollFrameBackground, "TOPLEFT", 20, -45 )

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
	[1] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Information" },
	[2] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Unitframes" },
	[3] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Actionbars" },
	[4] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Panels, Nameplates" },
	[5] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Minimap, Chat" },
	[6] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Extra AddOns, Skins" },
	[7] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Reported Issues" },
	[8] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Credits" },
	[9] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Donation" },
}

local AsphyxiaUIMainFrameNavigationButton = CreateFrame( "Button", "AsphyxiaUIMainFrameNavigationButton", AsphyxiaUIMainFrameNavigation )
for i = 1, 9 do
	AsphyxiaUIMainFrameNavigationButton[i] = CreateFrame( "Button", "AsphyxiaUIMainFrameNavigationButton" .. i, AsphyxiaUIMainFrameNavigation, "SecureActionButtonTemplate" )
	AsphyxiaUIMainFrameNavigationButton[i]:CreatePanel( "Default", AsphyxiaUIMainFrameNavigation:GetWidth() - 8, 24, "TOP", AsphyxiaUIMainFrameNavigation, "TOP", 0, -4, true )
	AsphyxiaUIMainFrameNavigationButton[i].Text = S.SetFontString( AsphyxiaUIMainFrameNavigationButton[i], C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	AsphyxiaUIMainFrameNavigationButton[i]:SetFrameLevel( AsphyxiaUIMainFrameNavigation:GetFrameLevel() + 1 )
	AsphyxiaUIMainFrameNavigationButton[i].Text:Point( "CENTER", AsphyxiaUIMainFrameNavigationButton[i], "CENTER", 0, 1 )
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
	AsphyxiaUIMainFrameContentTitle:SetText( "" )
	AsphyxiaUIMainFrameContentText1:SetText( "Please select a category." )
	AsphyxiaUIMainFrameContentText2:SetText( "" )
	AsphyxiaUIMainFrameContentText3:SetText( "" )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
end

local ahelp9content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Donation" )
	AsphyxiaUIMainFrameContentText1:SetText( "It's not easy to create a new UI, giving support for all other users and pushing updates as much as i can.\nFeel free to give some donations for this UI.\n\nYou can do this here:\n|cff00FFFFhttp://www.tukui.org/forums/topic.php?id=18539|r" )
	AsphyxiaUIMainFrameContentText2:SetText( "I have to say Thank you, for the folowing donators:" )
	AsphyxiaUIMainFrameContentText3:SetText( "|cff00AAFFMastamage\nCalaglin|r" )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
end

local ahelp8content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Credits" )
	AsphyxiaUIMainFrameContentText1:SetText( "First: Asphyxia, the creator of this UI. thank you for this awesome job. I hope the 'new' AsphyxiaUI is that what you want." )
	AsphyxiaUIMainFrameContentText2:SetText( "Some other credits goto: Caith, Caellian, Shestak, Haste, Tekkub, Alza, Roth, P3lim, Tulla, Hungtar, hankthetank, Ishtara, Haleth and others..." )
	AsphyxiaUIMainFrameContentText3:SetText( "Special thanks to: Asi, my forum bitch! xD" )
	AsphyxiaUIMainFrameContentText4:SetText( "If i missed someone, let me know it and i will add them onto the list." )
end

local ahelp7content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Reported Issues" )
	AsphyxiaUIMainFrameContentText1:SetText( "I worked hard, very hard. So, i know that there are some issues into the AsphyxiaUI." )
	AsphyxiaUIMainFrameContentText2:SetText( "If you founds something the looks ugly or if you think that can be a bug, errors or whatever, let me know about them." )
	AsphyxiaUIMainFrameContentText3:SetText( "You can post your erros here (please read the guidline to report bugs and erros):" )
	AsphyxiaUIMainFrameContentText4:SetText( "|cff00FFFFhttp://www.tukui.org/forums/topic.php?id=18608|r" )
end

local ahelp6content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Extra AddOns, Skins" )
	AsphyxiaUIMainFrameContentText1:SetText( "There are some extra addons included into AsphyxiaUI. You will find some credits and other informations about this under the 'Credits' section." )
	AsphyxiaUIMainFrameContentText2:SetText( "AsphyxiaUI has some nice and cool looking skins for the following AddOns:\nBalancePowerTracker, BigWigs, DeadlyBossMods, DeuxVox, Omen, Recount, Skada and TinyDPS." )
	AsphyxiaUIMainFrameContentText3:SetText( "You can change these settings by follow these steps:\n\nOpen the Tukui ConfigUI (type /tc into your chat)\nGoto: Addon Skins.\n\nNow you can enable or disable the needed skins. You can also activate the embed right for Skada or Recount." )
	AsphyxiaUIMainFrameContentText4:SetText( "The default Blizzard-Frames are also skinned to match the rest of the AsphyxiaUI. If you don't like them you can disable it by follow these steps:\n\nOpen the Tukui ConfigUI (type /tc into your chat)\nGoto: General\n\nNow you can enable or disable the skinning for the Blizzard-Frames." )
end

local ahelp5content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Minimap, Chat" )
	AsphyxiaUIMainFrameContentText1:SetText( "You can show or hide the minimap by clicking the left button at the minimap. There are also the buttons for the help frame and the Tukui version frame.\n\nThe minimap buttons are skinned too. So if you are using DBM, Skada or other addons with a seperate minimap button, this button will be skinned as well." )
	AsphyxiaUIMainFrameContentText2:SetText( "You can change the height and/or width of the chatframes.\nFollow this steps to change the chat frames:\n\nOpen the Tukui ConfigUI (type /tc into your chat)\nGoto: Chat\n\nThere are two inputfields names chatheight and chatwidth. You can change the default values to whatever you want.\n\nAfter you are done click 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the chatframes are changed." )
	AsphyxiaUIMainFrameContentText3:SetText( "" )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
end

local ahelp4content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Panels, Nameplates" )
	AsphyxiaUIMainFrameContentText1:SetText( "There is a seperate 'Control Panel' on the bottom of the screen.\n\nLeft button: after clicking this button the UI will be reloaded and the default AsphyxiaUI settings will be loaded.\n\nMiddle button: open the AsphyxiaUI Control Panel.\n\nRight button: reload the UI." )
	AsphyxiaUIMainFrameContentText2:SetText( "" )
	AsphyxiaUIMainFrameContentText3:SetText( "The AsphyxiaUI nameplates have several tweaks. You can enable or disable the debuff and cc tracking into the Tukui ConfigUI.\nFollow this steps to change the settings:" )
	AsphyxiaUIMainFrameContentText4:SetText( "Open the Tukui ConfigUI (type /tc into your chat)\nGoto: Nameplates\nNow you can enable or disable the debuff and/or cc tracking onto the nameplates." )
end

local ahelp3content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Actionbars" )
	AsphyxiaUIMainFrameContentText1:SetText( "There is a seperate config ui for the actionbars. Click onto 'Control Panel' and after that onto 'Actionbar Config'" )
	AsphyxiaUIMainFrameContentText2:SetText( "Now you can change the actionbars to whatever you want." )
	AsphyxiaUIMainFrameContentText3:SetText( "" )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
end

local ahelp2content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Unitframes" )
	AsphyxiaUIMainFrameContentText1:SetText( "There are five different unitframe layouts. You can change them without editing the original LUA files." )
	AsphyxiaUIMainFrameContentText2:SetText( "Follow this steps to change the unitframe layout:" )
	AsphyxiaUIMainFrameContentText3:SetText( "Open the Tukui ConfigUI (type /tc into your chat)\nGoto: Asphyxia\nNow you can see a inputbox named 'Asphyxia Layout'. You can choose between asphyxia, asphyxia2, asphyxia3, asphyxia4 and smelly.\n\nAfter changing the layout click onto 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the unitframes are changed." )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
end

local ahelp1content = function()
	AsphyxiaUIMainFrameContentTitle:SetText( "Information" )
	AsphyxiaUIMainFrameContentText1:SetText( "AsphyxiaUI is a heavily modified version of Tukui. AsphyxiaUI is a complete UI replacement.\nFor detailed information visit:\n\n|cff00FFFFhttp://www.tukui.org/forums/forum.php?id=165|r\nor\n|cff00FFFFhttps://github.com/Sinaris/AsphyxiaUI|r" )
	AsphyxiaUIMainFrameContentText2:SetText( "You can use the following slash-commands:\n\n|cffEAC117/scp|r - Unlock sCombo bar to move.\n|cffEAC117/testui uf|r or |cffEAC117/testui unitframes|r -  Test mode for unitframes.\n|cffEAC117/testui a|r or |cffEAC117/testui arena|r - Test mode for arenaframes.\n|cffEAC117/testui b|r or |cffEAC117/testui boss|r - Test mode for bossframes.\n|cffEAC117/ali|r - Alignment grid." )
	AsphyxiaUIMainFrameContentText3:SetText( "" )
	AsphyxiaUIMainFrameContentText4:SetText( "" )
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