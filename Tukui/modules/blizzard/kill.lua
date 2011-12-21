local S, C, L = unpack( select( 2, ... ) )

local Kill = CreateFrame( "Frame" )
Kill:RegisterEvent( "ADDON_LOADED" )
Kill:SetScript( "OnEvent", function( self, event, addon )
	if( addon == "Blizzard_AchievementUI" ) then
		if( C["tooltip"].enable == true ) then
			hooksecurefunc( "AchievementFrameCategories_DisplayButton", function( button ) button.showTooltipFunc = nil end )
		end
	end

	if( addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" ) then
		InterfaceOptionsFrameCategoriesButton11:SetScale( 0.00001 )
		InterfaceOptionsFrameCategoriesButton11:SetAlpha( 0 )

		local function KillRaidFrame()
			CompactRaidFrameManager:UnregisterAllEvents()
			if not InCombatLockdown() then CompactRaidFrameManager:Hide() end

			local shown = CompactRaidFrameManager_GetSetting( "IsShown" )
			if( shown and shown ~= "0" ) then
				CompactRaidFrameManager_SetSetting( "IsShown", "0" )
			end
		end

		hooksecurefunc( "CompactRaidFrameManager_UpdateShown", function()
			KillRaidFrame()
		end )

		KillRaidFrame()

		local function KillPartyFrame()
			CompactPartyFrame:Kill()

			for i = 1, MEMBERS_PER_RAID_GROUP do
				local name = "CompactPartyFrameMember" .. i
				local frame = _G[name]
				frame:UnregisterAllEvents()
			end
		end

		for i = 1, MAX_PARTY_MEMBERS do
			local name = "PartyMemberFrame" .. i
			local frame = _G[name]

			frame:Kill()

			_G[name .. "HealthBar"]:UnregisterAllEvents()
			_G[name .. "ManaBar"]:UnregisterAllEvents()
		end
		
		if( CompactPartyFrame ) then
			KillPartyFrame()
		elseif( CompactPartyFrame_Generate ) then
			hooksecurefunc( "CompactPartyFrame_Generate", KillPartyFrame )
		end
	end

	if( addon ~= "Tukui" ) then return end

	StreamingIcon:Kill()
	Advanced_UseUIScale:Kill()
	Advanced_UIScaleSlider:Kill()
	PartyMemberBackground:Kill()
	TutorialFrameAlertButton:Kill()
	GuildChallengeAlertFrame:Kill()

	if( C["auras"].player == true or C["unitframes"].playerauras == true ) then
		BuffFrame:Kill()
		TemporaryEnchantFrame:Kill()
		ConsolidatedBuffs:Kill()
		InterfaceOptionsFrameCategoriesButton12:SetScale( 0.00001 )
		InterfaceOptionsFrameCategoriesButton12:SetAlpha( 0 )
	end

	InterfaceOptionsUnitFramePanelPartyBackground:Kill()

	SetCVar( "showArenaEnemyFrames", 0 )

	if( C["arena"].unitframes == true ) then
		InterfaceOptionsFrameCategoriesButton10:SetScale( 0.00001 )
		InterfaceOptionsFrameCategoriesButton10:SetAlpha( 0 ) 
		InterfaceOptionsUnitFramePanelArenaEnemyFrames:Kill()
		InterfaceOptionsUnitFramePanelArenaEnemyCastBar:Kill()
		InterfaceOptionsUnitFramePanelArenaEnemyPets:Kill()
	end

	if( C["chat"].enable == true ) then
		SetCVar( "WholeChatWindowClickable", 0 )
		SetCVar( "ConversationMode", "inline" )
		InterfaceOptionsSocialPanelWholeChatWindowClickable:Kill()
		InterfaceOptionsSocialPanelConversationMode:Kill()
	end

	if( C["unitframes"].enable == true ) then
		PlayerFrame:Kill()
		InterfaceOptionsFrameCategoriesButton9:SetScale( 0.00001 )
		InterfaceOptionsFrameCategoriesButton9:SetAlpha( 0 )
	end

	if( C["actionbar"].enable == true ) then
		InterfaceOptionsActionBarsPanelBottomLeft:Kill()
		InterfaceOptionsActionBarsPanelBottomRight:Kill()
		InterfaceOptionsActionBarsPanelRight:Kill()
		InterfaceOptionsActionBarsPanelRightTwo:Kill()
		InterfaceOptionsActionBarsPanelAlwaysShowActionBars:Kill()
	end

	if( C["nameplate"].enable == true and C["nameplate"].enhancethreat == true ) then
		InterfaceOptionsDisplayPanelAggroWarningDisplay:Kill()
	end

	local TaintFix = CreateFrame( "Frame" )
	TaintFix:SetScript( "OnUpdate", function( self, elapsed )
		if( LFRBrowseFrame.timeToClear ) then
			LFRBrowseFrame.timeToClear = nil
		end 
	end )
end )