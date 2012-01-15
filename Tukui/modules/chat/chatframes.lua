local S, C, L = unpack( select( 2, ... ) )

if( C["chat"].enable ~= true ) then return end

local TukuiChat = CreateFrame( "Frame", "TukuiChat" )
local tabalpha = 1
local tabnoalpha = 0
local _G = _G
local origs = {}
local type = type
local strings = {
	BATTLEGROUND = L.chat_BATTLEGROUND_GET,
	GUILD = L.chat_GUILD_GET,
	PARTY = L.chat_PARTY_GET,
	RAID = L.chat_RAID_GET,
	OFFICER = L.chat_OFFICER_GET,
	BATTLEGROUND_LEADER = L.chat_BATTLEGROUND_LEADER_GET,
	PARTY_LEADER = L.chat_PARTY_LEADER_GET,
	RAID_LEADER = L.chat_RAID_LEADER_GET,

	-- zhCN
	Battleground = L.chat_BATTLEGROUND_GET,
	Guild = L.chat_GUILD_GET,
	raid = L.chat_RAID_GET,
	Party = L.chat_PARTY_GET,
}

local function ShortChannel( channel )
	return string.format( "|Hchannel:%s|h[%s]|h", channel, strings[channel] or channel:gsub( "channel:", "" ) )
end

local function AddMessage( frame, str, ... )
	str = str:gsub( "|Hplayer:(.-)|h%[(.-)%]|h", "|Hplayer:%1|h%2|h" )
	str = str:gsub( "|HBNplayer:(.-)|h%[(.-)%]|h", "|HBNplayer:%1|h%2|h" )
	str = str:gsub( "|Hchannel:(.-)|h%[(.-)%]|h", ShortChannel )

	str = str:gsub( "^To (.-|h)", "To %1" )
	str = str:gsub( "^(.-|h) whispers", "From %1" )
	str = str:gsub( "^(.-|h) says", "%1" )
	str = str:gsub( "^(.-|h) yells", "%1" )
	str = str:gsub( "<" .. AFK .. ">", "|cffFF0000" .. L.chat_FLAG_AFK .. "|r " )
	str = str:gsub( "<" .. DND .. ">", "|cffE7E716" .. L.chat_FLAG_DND .. "|r " )
	str = str:gsub( "^%[" .. RAID_WARNING .. "%]", L.chat_RAID_WARNING_GET )

	return origs[frame]( frame, str, ... )
end

FriendsMicroButton:Kill()
ChatFrameMenuButton:Kill()

local function SetChatStyle( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]
	local editbox = _G[chat .. "EditBox"]

	tab:SetAlpha( 1 )
	tab.SetAlpha = S.dummy
	tab:HookScript( "OnClick", function() editbox:Hide() end )

	if( C["chat"].background ~= true ) then
		_G[chat .. "TabText"]:Hide()
		tab:HookScript( "OnEnter", function() _G[chat .. "TabText"]:Show() end )
		tab:HookScript( "OnLeave", function() _G[chat .. "TabText"]:Hide() end )
	end

	_G[chat .. "TabText"]:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	if( id < 11 ) then
		_G[chat .. "TabText"]:SetTextColor( unpack( C["media"].datatextcolor2 ) )
		_G[chat .. "TabText"].SetTextColor = S.dummy
	end

	_G[chat]:SetClampRectInsets( 0, 0, 0, 0 )
	_G[chat]:SetClampedToScreen( false )
	_G[chat]:SetFading( false )

	_G[chat]:SetMinResize( 371, 111 )
	_G[chat]:SetMinResize( S.InfoLeftRightWidth + 1, 111 )

	_G[chat .. "EditBox"]:ClearAllPoints()
	_G[chat .. "EditBox"]:Point( "TOPLEFT", TukuiTabsLeftBackground or TukuiInfoLeft, 2, -2 )
	_G[chat .. "EditBox"]:Point( "BOTTOMRIGHT", TukuiTabsLeftBackground or TukuiInfoLeft, -2, 2 )	

	for j = 1, #CHAT_FRAME_TEXTURES do
		_G[chat .. CHAT_FRAME_TEXTURES[j]]:SetTexture( nil )
	end

	_G[format( "ChatFrame%sTabLeft", id )]:Kill()
	_G[format( "ChatFrame%sTabMiddle", id )]:Kill()
	_G[format( "ChatFrame%sTabRight", id )]:Kill()

	_G[format( "ChatFrame%sTabSelectedLeft", id )]:Kill()
	_G[format( "ChatFrame%sTabSelectedMiddle", id )]:Kill()
	_G[format( "ChatFrame%sTabSelectedRight", id )]:Kill()

	_G[format( "ChatFrame%sTabHighlightLeft", id )]:Kill()
	_G[format( "ChatFrame%sTabHighlightMiddle", id )]:Kill()
	_G[format( "ChatFrame%sTabHighlightRight", id )]:Kill()

	_G[format( "ChatFrame%sTabSelectedLeft", id )]:Kill()
	_G[format( "ChatFrame%sTabSelectedMiddle", id )]:Kill()
	_G[format( "ChatFrame%sTabSelectedRight", id )]:Kill()

	_G[format( "ChatFrame%sButtonFrameUpButton", id )]:Kill()
	_G[format( "ChatFrame%sButtonFrameDownButton", id )]:Kill()
	_G[format( "ChatFrame%sButtonFrameBottomButton", id )]:Kill()
	_G[format( "ChatFrame%sButtonFrameMinimizeButton", id )]:Kill()
	_G[format( "ChatFrame%sButtonFrame", id )]:Kill()

	_G[format( "ChatFrame%sEditBoxFocusLeft", id )]:Kill()
	_G[format( "ChatFrame%sEditBoxFocusMid", id )]:Kill()
	_G[format( "ChatFrame%sEditBoxFocusRight", id )]:Kill()

	local a, b, c = select( 6, _G[chat .. "EditBox"]:GetRegions() ) a:Kill() b:Kill() c:Kill()

	if( tab.conversationIcon ) then tab.conversationIcon:Kill() end

	_G[chat .. "EditBox"]:SetAltArrowKeyMode( false )
	_G[chat .. "EditBox"]:Hide()
	_G[chat .. "EditBox"]:HookScript( "OnEditFocusLost", function( self ) self:Hide() end )

	_G[chat .. "Tab"]:HookScript( "OnClick", function() _G[chat .. "EditBox"]:Hide() end )

	local EditBoxBackground = CreateFrame( "frame", "TukuiChatchatEditBoxBackground", _G[chat .. "EditBox"] )
	EditBoxBackground:CreatePanel( "Default", 1, 1, "LEFT", _G[chat .. "EditBox"], "LEFT", 0, 0 )
	EditBoxBackground:ClearAllPoints()
	EditBoxBackground:SetAllPoints( TukuiTabsLeftBackground or TukuiInfoLeft )
	EditBoxBackground:SetFrameStrata( "LOW" )
	EditBoxBackground:SetFrameLevel( 1 )

	local function colorize( r, g, b )
		EditBoxBackground:SetBackdropBorderColor( r, g, b )
	end

	hooksecurefunc( "ChatEdit_UpdateHeader", function()
		local type = _G[chat .. "EditBox"]:GetAttribute( "chatType" )
		if( type == "CHANNEL" ) then
			local id = GetChannelName( _G[chat .. "EditBox"]:GetAttribute( "channelTarget" ) )
			if( id == 0 ) then
				colorize( unpack( C["media"].bordercolor ) )
			else
				colorize( ChatTypeInfo[type .. id].r, ChatTypeInfo[type .. id].g, ChatTypeInfo[type .. id].b )
			end
		else
			colorize( ChatTypeInfo[type].r, ChatTypeInfo[type].g, ChatTypeInfo[type].b )
		end
	end )

	if( _G[chat] ~= _G["ChatFrame2"] ) then	
		origs[_G[chat]] = _G[chat].AddMessage
		_G[chat].AddMessage = AddMessage
	else
		CombatLogQuickButtonFrame_Custom:StripTextures()
		CombatLogQuickButtonFrame_Custom:SetTemplate( "Default" )
		S.SkinCloseButton( CombatLogQuickButtonFrame_CustomAdditionalFilterButton )
		CombatLogQuickButtonFrame_CustomAdditionalFilterButton.t:SetText( "V" )
		CombatLogQuickButtonFrame_CustomAdditionalFilterButton.t:ClearAllPoints()
		CombatLogQuickButtonFrame_CustomAdditionalFilterButton.t:Point( "RIGHT", -8, 4 )
		CombatLogQuickButtonFrame_CustomProgressBar:ClearAllPoints()
		CombatLogQuickButtonFrame_CustomProgressBar:SetPoint( "TOPLEFT", CombatLogQuickButtonFrame_Custom, 2, -2 )
		CombatLogQuickButtonFrame_CustomProgressBar:SetPoint( "BOTTOMRIGHT", CombatLogQuickButtonFrame_Custom, -2, 2 )
		CombatLogQuickButtonFrame_CustomProgressBar:SetStatusBarTexture( C["media"].normTex )
	end

	frame.isSkinned = true
end

local function SetupChat( self )
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format( "ChatFrame%s", i )]
		SetChatStyle( frame )
		FCFTab_UpdateAlpha( frame )
	end

	ChatTypeInfo.WHISPER.sticky = 1
	ChatTypeInfo.BN_WHISPER.sticky = 1
	ChatTypeInfo.OFFICER.sticky = 1
	ChatTypeInfo.RAID_WARNING.sticky = 1
	ChatTypeInfo.CHANNEL.sticky = 1
end

TukuiChat:RegisterEvent( "ADDON_LOADED" )
TukuiChat:SetScript("OnEvent", function( self, event, addon )
	if( addon == "Blizzard_CombatLog" ) then
		self:UnregisterEvent( "ADDON_LOADED" )
		SetupChat( self )
	end
end )

local function SetupTempChat()
	local frame = FCF_GetCurrentChatFrame()

	if( frame.isSkinned ) then return end

	frame.temp = true
	SetChatStyle( frame )
end
hooksecurefunc( "FCF_OpenTemporaryWindow", SetupTempChat )

BNToastFrame:HookScript( "OnShow", function( self )
	self:ClearAllPoints()
	if( C["chat"].background == true and TukuiChatBackgroundLeft ) then
		self:Point( "BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 0, 3 )
	else
		self:Point( "BOTTOMLEFT", ChatFrame1, "TOPLEFT", 0, 3 )
	end
end )

S.SkinCloseButton( BNToastFrameCloseButton )

ChatConfigFrameDefaultButton:Kill()

S.SetDefaultChatPosition = function( frame )
	if( frame ) then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo( id )
		local fontSize = select( 2, frame:GetFont() )

		if( fontSize < 12 ) then
			FCF_SetChatWindowFontSize( nil, frame, 12 )
		else
			FCF_SetChatWindowFontSize( nil, frame, fontSize )
		end

		if( id == 1 ) then
			frame:ClearAllPoints()
			frame:Point( "TOPLEFT", TukuiTabsLeftBackground, "BOTTOMLEFT", 0, -2 )
			frame:Point( "BOTTOMRIGHT", TukuiInfoLeft, "TOPRIGHT", 0, 2 )
		elseif( id == 4 and name == LOOT ) then
			if not frame.isDocked then
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", TukuiTabsRightBackground, "BOTTOMLEFT", 0, -2 )
				frame:Point( "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 2 )
				if( C["chat"].justifyRight == true ) then
					frame:SetJustifyH("RIGHT")
				end
			end
		end

		if not frame.isLocked then FCF_SetLocked( frame, 1 ) end
	end
end
hooksecurefunc( "FCF_RestorePositionAndDimensions", S.SetDefaultChatPosition )