local S, C, L = unpack( select( 2, ... ) )

StaticPopupDialogs["TUKUIDISABLE_UI"] = {
	text = L.popup_disableui,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() DisableAddOn( "Tukui" ) ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["TUKUIDISABLE_RAID"] = {
	text = L.popup_2raidactive,
	button1 = "DPS - TANK",
	button2 = "HEAL",
	OnAccept = function() DisableAddOn( "Tukui_Raid_Healing" ) EnableAddOn( "Tukui_Raid" ) ReloadUI() end,
	OnCancel = function() EnableAddOn( "Tukui_Raid_Healing" ) DisableAddOn( "Tukui_Raid" ) ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["TUKUIDISBAND_RAID"] = {
	text = L.disband,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if( InCombatLockdown() ) then return end

		SendChatMessage( ERR_GROUP_DISBANDED, "RAID" or "PARTY" )
		if( UnitInRaid( "player" ) ) then
			for i = 1, GetNumRaidMembers() do
				local name, _, _, _, _, _, _, online = GetRaidRosterInfo( i )
				if( online and name ~= S.myname ) then
					UninviteUnit( name )
				end
			end
		else
			for i = MAX_PARTY_MEMBERS, 1, -1 do
				if( GetPartyMember( i ) ) then
					UninviteUnit( UnitName( "party" .. i ) )
				end
			end
		end
		LeaveParty()
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["TUKUI_FIX_AB"] = {
	text = L.popup_fix_ab,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = ReloadUI,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["TUKUIENABLE_CHATBACKGROUND"] = {
	text = "You don't have chatbackgrounds enabled, do you wish to enable them? If you don't choose to do so, this edit will not work!",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if not ( TukuiConfigPublic["chat"] ) then TukuiConfigPublic["chat"] = {} end
			TukuiConfigPublic["chat"]["background"] = true
		end
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}