local S, C, L = unpack( select( 2, ... ) )

S.ChatSetup = function()
	FCF_ResetChatWindows()
	FCF_SetLocked( ChatFrame1, 1 )
	FCF_DockFrame( ChatFrame2 )
	FCF_SetLocked( ChatFrame2, 1 )
	FCF_OpenNewWindow( L.chat_general )
	FCF_SetLocked( ChatFrame3, 1 )
	FCF_DockFrame( ChatFrame3 )

	FCF_OpenNewWindow( LOOT )
	FCF_UnDockFrame( ChatFrame4 )
	FCF_SetLocked( ChatFrame4, 1 )
	ChatFrame4:Show()

	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format( "ChatFrame%s", i )]
		local id = frame:GetID()

		FCF_SetChatWindowFontSize( nil, frame, 12 )

		frame:Size( S.InfoLeftRightWidth + 1, 111 )

		SetChatWindowSavedDimensions( id, S.Scale( S.InfoLeftRightWidth + 1 ), S.Scale( 111 ) )

		FCF_SavePositionAndDimensions( frame )

		if( i == 1 ) then FCF_SetWindowName( frame, "G, S & W" ) end
		if( i == 2 ) then FCF_SetWindowName( frame, "Log" ) end
		
		S.SetDefaultChatPosition( frame )
	end

	ChatFrame_RemoveAllMessageGroups( ChatFrame1 )
	ChatFrame_RemoveChannel( ChatFrame1, L.chat_trade )
	ChatFrame_RemoveChannel( ChatFrame1, L.chat_general )
	ChatFrame_RemoveChannel( ChatFrame1, L.chat_defense )
	ChatFrame_RemoveChannel( ChatFrame1, L.chat_recrutment )
	ChatFrame_RemoveChannel( ChatFrame1, L.chat_lfg )
	ChatFrame_AddMessageGroup( ChatFrame1, "SAY" )
	ChatFrame_AddMessageGroup( ChatFrame1, "EMOTE" )
	ChatFrame_AddMessageGroup( ChatFrame1, "YELL" )
	ChatFrame_AddMessageGroup( ChatFrame1, "GUILD" )
	ChatFrame_AddMessageGroup( ChatFrame1, "OFFICER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "GUILD_ACHIEVEMENT" )
	ChatFrame_AddMessageGroup( ChatFrame1, "WHISPER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_SAY" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_EMOTE" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_YELL" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_WHISPER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_BOSS_EMOTE" )
	ChatFrame_AddMessageGroup( ChatFrame1, "MONSTER_BOSS_WHISPER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "PARTY" )
	ChatFrame_AddMessageGroup( ChatFrame1, "PARTY_LEADER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "RAID" )
	ChatFrame_AddMessageGroup( ChatFrame1, "RAID_LEADER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "RAID_WARNING" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BATTLEGROUND" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BATTLEGROUND_LEADER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BG_HORDE" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BG_ALLIANCE" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BG_NEUTRAL" )
	ChatFrame_AddMessageGroup( ChatFrame1, "SYSTEM" )
	ChatFrame_AddMessageGroup( ChatFrame1, "ERRORS" )
	ChatFrame_AddMessageGroup( ChatFrame1, "AFK" )
	ChatFrame_AddMessageGroup( ChatFrame1, "DND" )
	ChatFrame_AddMessageGroup( ChatFrame1, "IGNORED" )
	ChatFrame_AddMessageGroup( ChatFrame1, "ACHIEVEMENT" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BN_WHISPER" )
	ChatFrame_AddMessageGroup( ChatFrame1, "BN_CONVERSATION" )

	ChatFrame_RemoveAllMessageGroups( ChatFrame3 )
	ChatFrame_AddChannel( ChatFrame3, L.chat_trade )
	ChatFrame_AddChannel( ChatFrame3, L.chat_general )
	ChatFrame_AddChannel( ChatFrame3, L.chat_defense )
	ChatFrame_AddChannel( ChatFrame3, L.chat_recrutment )
	ChatFrame_AddChannel( ChatFrame3, L.chat_lfg )

	ChatFrame_RemoveAllMessageGroups( ChatFrame4 )
	ChatFrame_AddMessageGroup( ChatFrame4, "COMBAT_XP_GAIN" )
	ChatFrame_AddMessageGroup( ChatFrame4, "COMBAT_HONOR_GAIN" )
	ChatFrame_AddMessageGroup( ChatFrame4, "COMBAT_FACTION_CHANGE" )
	ChatFrame_AddMessageGroup( ChatFrame4, "LOOT" )
	ChatFrame_AddMessageGroup( ChatFrame4, "MONEY" )

	ToggleChatColorNamesByClassGroup( true, "SAY" )
	ToggleChatColorNamesByClassGroup( true, "EMOTE" )
	ToggleChatColorNamesByClassGroup( true, "YELL" )
	ToggleChatColorNamesByClassGroup( true, "GUILD" )
	ToggleChatColorNamesByClassGroup( true, "OFFICER" )
	ToggleChatColorNamesByClassGroup( true, "GUILD_ACHIEVEMENT" )
	ToggleChatColorNamesByClassGroup( true, "ACHIEVEMENT" )
	ToggleChatColorNamesByClassGroup( true, "WHISPER" )
	ToggleChatColorNamesByClassGroup( true, "PARTY" )
	ToggleChatColorNamesByClassGroup( true, "PARTY_LEADER" )
	ToggleChatColorNamesByClassGroup( true, "RAID" )
	ToggleChatColorNamesByClassGroup( true, "RAID_LEADER" )
	ToggleChatColorNamesByClassGroup( true, "RAID_WARNING" )
	ToggleChatColorNamesByClassGroup( true, "BATTLEGROUND" )
	ToggleChatColorNamesByClassGroup( true, "BATTLEGROUND_LEADER" )
	ToggleChatColorNamesByClassGroup( true, "CHANNEL1" )
	ToggleChatColorNamesByClassGroup( true, "CHANNEL2" )
	ToggleChatColorNamesByClassGroup( true, "CHANNEL3" )
	ToggleChatColorNamesByClassGroup( true, "CHANNEL4" )
	ToggleChatColorNamesByClassGroup( true, "CHANNEL5" )
end

local function cvarsetup()
	SetCVar( "buffDurations", 1 )
	SetCVar( "mapQuestDifficulty", 1 )
	SetCVar( "scriptErrors", 1 )
	SetCVar( "ShowClassColorInNameplate", 1 )
	SetCVar( "screenshotQuality", 8 )
	SetCVar( "chatMouseScroll", 1 )
	SetCVar( "chatStyle", "im" )
	SetCVar( "WholeChatWindowClickable", 0 )
	SetCVar( "ConversationMode", "inline" )
	SetCVar( "showTutorials", 0 )
	SetCVar( "showNewbieTips", 0 )
	SetCVar( "autoQuestWatch", 1 )
	SetCVar( "autoQuestProgress", 1 )
	SetCVar( "UberTooltips", 1 )
	SetCVar( "removeChatDelay", 1 )
	SetCVar( "showVKeyCastbar", 1 )
	SetCVar( "bloatthreat", 0 )
	SetCVar( "bloattest", 0 )
	SetCVar( "showArenaEnemyFrames", 0 )
end

local function positionsetup()
	TukuiDataPerChar = {}

	for i = 1, getn( S.AllowFrameMoving ) do
		if( S.AllowFrameMoving[i] ) then S.AllowFrameMoving[i]:SetUserPlaced( false ) end
	end
end

local v = CreateFrame( "Button", "TukuiVersionFrame", UIParent )
v:SetSize( 300, 36 )
v:SetPoint( "CENTER" )
v:SetTemplate( "Default" )
v:CreateShadow( "Default" )
v:FontString( "Text", C.media.font, 12 )
v.Text:SetPoint( "CENTER" )
v.Text:SetText( "Tukui " .. S.version .. " by |cffff0000tukz@tukui.org|r, website at |cffff0000www.tukui.org|r" )
v:SetScript( "OnClick", function()
	v:Hide()
end )
v:Hide()

local f = CreateFrame( "Frame", "AsphyxiaUIInstallFrame", UIParent )
f:SetSize( 400, 400 )
f:SetPoint( "CENTER" )
f:SetTemplate( "Transparent" )
f:CreateShadow( "Default" )
f:Hide()

local icon1 = CreateFrame( "Frame", "AsphyxiaTest", f )
icon1:CreatePanel( nil, 58, 58, "BOTTOMRIGHT", f, "TOPRIGHT", 0, 3 )
icon1:SetFrameStrata( "HIGH" )
icon1:CreateShadow( "Default" )

icon1.bg = icon1:CreateTexture( nil, "ARTWORK" )
icon1.bg:Point( "TOPLEFT", 2, -2 )
icon1.bg:Point( "BOTTOMRIGHT", -2, 2 )
icon1.bg:SetTexture( C["media"].asphyxia )

local icon2 = CreateFrame( "Frame", "AsphyxiaTest", f )
icon2:CreatePanel( nil, 58, 58, "BOTTOMLEFT", f, "TOPLEFT", 0, 3 )
icon2:SetFrameStrata( "HIGH" )
icon2:CreateShadow( "Default" )

icon2.bg = icon2:CreateTexture( nil, "ARTWORK" )
icon2.bg:Point( "TOPLEFT", 2, -2 )
icon2.bg:Point( "BOTTOMRIGHT", -2, 2 )
icon2.bg:SetTexture( C["media"].asphyxia )

local title = CreateFrame( "Frame", "TukuiInstallTitle", f )
title:CreatePanel( nil, f:GetWidth( ) - 122, 30, "BOTTOM", f, "TOP", 0, 3 )
title:SetFrameStrata( "HIGH" )
title:CreateShadow( "Default" )

local name = title:CreateFontString( nil, "OVERLAY" )
name:SetFont( C.media.font, 16 )
name:SetPoint( "CENTER", title, 0, 0 )
name:SetText( "|cff00AAFFAsphyxiaUI|r" )

local sb = CreateFrame( "StatusBar", nil, f )
sb:SetStatusBarTexture( C.media.normTex )
sb:SetPoint( "BOTTOM", f, "BOTTOM", 0, 60 )
sb:SetHeight( 20 )
sb:SetWidth( f:GetWidth() - 44 )
sb:SetFrameStrata( "HIGH" )
sb:SetFrameLevel( 6 )
sb:Hide()

local sbd = CreateFrame( "Frame", nil, sb )
sbd:SetTemplate( "Default" )
sbd:SetPoint( "TOPLEFT", sb, -2, 2 )
sbd:SetPoint( "BOTTOMRIGHT", sb, 2, -2 )
sbd:SetFrameStrata( "HIGH" )
sbd:SetFrameLevel( 5 )

local header = f:CreateFontString( nil, "OVERLAY" )
header:SetFont( C.media.font, 16, "THINOUTLINE" )
header:SetPoint( "TOP", f, "TOP", 0, -20 )

local text1 = f:CreateFontString( nil, "OVERLAY" )
text1:SetJustifyH( "LEFT" )
text1:SetFont( C.media.font, 12 )
text1:SetWidth( f:GetWidth() - 40 )
text1:SetPoint( "TOPLEFT", f, "TOPLEFT", 20, -60 )

local text2 = f:CreateFontString( nil, "OVERLAY" )
text2:SetJustifyH( "LEFT" )
text2:SetFont( C.media.font, 12 )
text2:SetWidth( f:GetWidth() - 40 )
text2:SetPoint( "TOPLEFT", text1, "BOTTOMLEFT", 0, -20 )

local text3 = f:CreateFontString( nil, "OVERLAY" )
text3:SetJustifyH( "LEFT" )
text3:SetFont( C.media.font, 12 )
text3:SetWidth( f:GetWidth() - 40 )
text3:SetPoint( "TOPLEFT", text2, "BOTTOMLEFT", 0, -20 )

local text4 = f:CreateFontString( nil, "OVERLAY" )
text4:SetJustifyH( "LEFT" )
text4:SetFont( C.media.font, 12 )
text4:SetWidth( f:GetWidth() - 40 )
text4:SetPoint( "TOPLEFT", text3, "BOTTOMLEFT", 0, -20 )

local credits = f:CreateFontString( nil, "OVERLAY" )
credits:SetFont( C.media.font, 12, "THINOUTLINE" )
credits:SetText( "" )
credits:SetPoint( "BOTTOM", f, "BOTTOM", 0, 4 )

local sbt = sb:CreateFontString( nil, "OVERLAY" )
sbt:SetFont( C.media.font, 13, "THINOUTLINE" )
sbt:SetPoint( "CENTER", sb )

local option1 = CreateFrame( "Button", "TukuiInstallOption1", f )
option1:SetPoint( "BOTTOMLEFT", f, "BOTTOMLEFT", 20, 20 )
option1:SetSize( 128, 25 )
option1:SetTemplate( "Default" )
option1:FontString( "Text", C.media.font, 12 )
option1.Text:SetPoint( "CENTER" )

local option2 = CreateFrame( "Button", "TukuiInstallOption2", f )
option2:SetPoint( "BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 20 )
option2:SetSize( 128, 25 )
option2:SetTemplate( "Default" )
option2:FontString( "Text", C.media.font, 12 )
option2.Text:SetPoint( "CENTER" )

local close = CreateFrame( "Button", "TukuiInstallCloseButton", f, "UIPanelCloseButton" )
close:SetPoint( "TOPRIGHT", f, "TOPRIGHT" )
S.SkinCloseButton( close )
close:SetScript( "OnClick", function()
	f:Hide()
end )

local step4 = function()
	TukuiDataPerChar.install = true

	TukuiSaved = {}
	TukuiSaved = {
		["bottomrows"] = 1,
		["rightbars"] = 1,
		["splitbars"] = false,
		["actionbarsLocked"] = false,
	}

	sb:SetValue( 4 )
	PlaySoundFile( "Sound\\interface\\LevelUp.wav" )
	header:SetText( L.install_header_11 )
	text1:SetText( L.install_step_4_line_1 )
	text2:SetText( L.install_step_4_line_2 )
	text3:SetText( L.install_step_4_line_3 )
	text4:SetText( L.install_step_4_line_4 )
	sbt:SetText( "4/4" )
	option1:Hide()
	option2.Text:SetText( L.install_button_finish )
	option2:SetScript( "OnClick", function()
		ReloadUI()
	end )
end

local step3 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue( 3 )
	header:SetText( L.install_header_10 )
	text1:SetText( L.install_step_3_line_1 )
	text2:SetText( L.install_step_3_line_2 )
	text3:SetText( L.install_step_3_line_3 )
	text4:SetText( L.install_step_3_line_4 )
	sbt:SetText( "3/4" )
	option1:SetScript( "OnClick", step4 )
	option2:SetScript( "OnClick", function()
		positionsetup()
		step4()
	end )
end

local step2 = function()
	sb:SetValue( 2 )
	header:SetText( L.install_header_9 )
	sbt:SetText( "2/4" )
	if IsAddOnLoaded( "Prat" ) or IsAddOnLoaded( "Chatter" ) then 
		text1:SetText( L.install_step_2_line_0 )
		text2:SetText( "" )
		text3:SetText( "" )
		text4:SetText( "" )
		option2:Hide()
	else
		text1:SetText( L.install_step_2_line_1 )
		text2:SetText( L.install_step_2_line_2 )
		text3:SetText( L.install_step_2_line_3 )
		text4:SetText( L.install_step_2_line_4 )
		option2:SetScript( "OnClick", function()
			S.ChatSetup()
			step3()
		end )
	end	
	option1:SetScript( "OnClick", step3 )
end

local step1 = function()
	close:Hide()
	sb:SetMinMaxValues( 0, 4 )
	sb:Show()
	sb:SetValue( 1 )
	sb:SetStatusBarColor( 0.26, 1, 0.22 )
	header:SetText( L.install_header_8 )
	text1:SetText( L.install_step_1_line_1 )
	text2:SetText( L.install_step_1_line_2 )
	text3:SetText( L.install_step_1_line_3 )
	text4:SetText( L.install_step_1_line_4 )
	sbt:SetText( "1/4" )

	option1:Show()

	option1.Text:SetText( L.install_button_skip )
	option2.Text:SetText( L.install_button_continue )

	option1:SetScript( "OnClick", step2 )
	option2:SetScript( "OnClick", function()
		cvarsetup()
		local ms = GetCVar( "gxMultisample" )
		if ms ~= "1" then
			SetCVar( "gxMultisample", 1 )
			RestartGx()
		end
		step2()
	end )

	SetActionBarToggles( 1, 1, 1, 1, 0 )
	SetCVar( "alwaysShowActionBars", 0 )
end

local tut6 = function()
	sb:SetValue( 6 )
	header:SetText( L.install_header_7 )
	text1:SetText( L.tutorial_step_6_line_1 )
	text2:SetText( L.tutorial_step_6_line_2 )
	text3:SetText( L.tutorial_step_6_line_3 )
	text4:SetText( L.tutorial_step_6_line_4 )

	sbt:SetText( "6/6" )

	option1:Show()

	option1.Text:SetText( L.install_button_close )
	option2.Text:SetText( L.install_button_install )

	option1:SetScript( "OnClick", function( )
		f:Hide()
	end )
	option2:SetScript( "OnClick", step1 )
end

local tut5 = function()
	sb:SetValue( 5 )
	header:SetText( L.install_header_6 )
	text1:SetText( L.tutorial_step_5_line_1 )
	text2:SetText( L.tutorial_step_5_line_2 )
	text3:SetText( L.tutorial_step_5_line_3 )
	text4:SetText( L.tutorial_step_5_line_4 )

	sbt:SetText( "5/6" )

	option2:SetScript( "OnClick", tut6 )
end

local tut4 = function()
	sb:SetValue( 4 )
	header:SetText( L.install_header_5 )
	text1:SetText( L.tutorial_step_4_line_1 )
	text2:SetText( L.tutorial_step_4_line_2 )
	text3:SetText( L.tutorial_step_4_line_3 )
	text4:SetText( L.tutorial_step_4_line_4 )

	sbt:SetText( "4/6" )

	option2:SetScript( "OnClick", tut5 )
end

local tut3 = function()
	sb:SetValue( 3 )
	header:SetText( L.install_header_4 )
	text1:SetText( L.tutorial_step_3_line_1 )
	text2:SetText( L.tutorial_step_3_line_2 )
	text3:SetText( L.tutorial_step_3_line_3 )
	text4:SetText( L.tutorial_step_3_line_4 )

	sbt:SetText( "3/6" )

	option2:SetScript( "OnClick", tut4 )
end

local tut2 = function()
	sb:SetValue( 2 )
	header:SetText( L.install_header_3 )
	text1:SetText( L.tutorial_step_2_line_1 )
	text2:SetText( L.tutorial_step_2_line_2 )
	text3:SetText( L.tutorial_step_2_line_3 )
	text4:SetText( L.tutorial_step_2_line_4 )

	sbt:SetText( "2/6" )

	option2:SetScript( "OnClick", tut3 )
end

local tut1 = function()
	sb:SetMinMaxValues( 0, 6 )
	sb:Show()
	close:Show()
	sb:SetValue( 1 )
	sb:SetStatusBarColor( 0, 0.76, 1 )
	header:SetText( L.install_header_2 )
	text1:SetText( L.tutorial_step_1_line_1 )
	text2:SetText( L.tutorial_step_1_line_2 )
	text3:SetText( L.tutorial_step_1_line_3 )
	text4:SetText( L.tutorial_step_1_line_4 )
	sbt:SetText( "1/6" )
	option1:Hide()
	option2.Text:SetText( L.install_button_next )
	option2:SetScript( "OnClick", tut2 )
end

local function install()
	f:Show()
	sb:Hide()
	option1:Show()
	option2:Show()
	close:Show()
	header:SetText( L.install_header_1 )
	text1:SetText( L.install_init_line_1 )
	text2:SetText( L.install_init_line_2 )
	text3:SetText( L.install_init_line_3 )
	text4:SetText( L.install_init_line_4 )

	option1.Text:SetText( L.install_button_tutorial )
	option2.Text:SetText( L.install_button_install )

	option1:SetScript( "OnClick", tut1 )
	option2:SetScript( "OnClick", step1 )
end

local TukuiOnLogon = CreateFrame( "Frame" )
TukuiOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
TukuiOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	if( TukuiData == nil ) then TukuiData = {} end
	if( TukuiDataPerChar == nil ) then TukuiDataPerChar = {} end

	if( S.screenwidth < 1200 ) then
		SetCVar( "useUiScale", 0 )
		StaticPopup_Show( "TUKUIDISABLE_UI" )
	else
		if not TukuiDataPerChar.install then
			install()
		end
	end

	if( IsAddOnLoaded( "Tukui_Raid" ) and IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
		StaticPopup_Show( "TUKUIDISABLE_RAID" )
	end

	if( C["chat"].background ~= true ) then
		StaticPopup_Show( "TUKUIENABLE_CHATBACKGROUND" )
	end

	print( "Whats up, |cff00AAFF" .. S.myname .. "!|r Thank you for using |cffFF6347AsphyxiaUI " .. S.xversion .. "|r |cff00AAFF(A heavily modified version of Tukui)." )
	print( "For detailed Information |cff00FFFFvisit www.tukui.org or https://github.com/Sinaris/AsphyxiaUI" )
end )

SLASH_TUTORIAL1 = "/uihelp"
SLASH_TUTORIAL2 = "/tutorial"
SlashCmdList.TUTORIAL = function() f:Show() tut1() end

SLASH_VERSION1 = "/version"
SlashCmdList.VERSION = function() if v:IsShown() then v:Hide() else v:Show() end end

SLASH_CONFIGURE1 = "/install"
SlashCmdList.CONFIGURE = install

SLASH_RESETUI1 = "/resetui"
SlashCmdList.RESETUI = function() f:Show() step1() end