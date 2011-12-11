local S, C, L = unpack( Tukui )

if( C["Addon_Skins"].background ~= true ) then return end

local AddonBGPanel = CreateFrame("Frame", "AddonBGPanel", UIParent)
AddonBGPanel:CreatePanel( "Transparent", TukuiChatBackgroundRight:GetWidth(), TukuiChatBackgroundRight:GetHeight(), "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMRIGHT", 0, 0 )
AddonBGPanel:SetFrameStrata( "MEDIUM" )

AddonBGPanel:RegisterEvent("PLAYER_ENTERING_WORLD")
AddonBGPanel:RegisterEvent("PLAYER_LOGIN")
if( C["Addon_Skins"].combat_toggle == true ) then
	AddonBGPanel:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	AddonBGPanel:RegisterEvent( "PLAYER_REGEN_DISABLED" )
end

AddonBGPanel:SetScript( "OnEvent", function( self, event )
	if( C["chat"].background == true or C["Addon_Skins"].combat_toggle == true ) then
		if( event == "PLAYER_LOGIN" ) then
			AddonBGPanel:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_ENTERING_WORLD" ) then
			AddonBGPanel:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		end
	end

	if( C["Addon_Skins"].combat_toggle == true ) then
		if( event == "PLAYER_REGEN_ENABLED" ) then
			self:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_REGEN_DISABLED" ) then
			self:Show()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Show() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Show() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( true ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Show() end
		end
	end
end )