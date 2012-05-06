local S, C, L = unpack( Tukui )

local panel_height = ( ( S.Scale( 5 ) * 4 ) + ( S.Scale( 22 ) * 4 ) )
local r, g, b = C["media"].backdropcolor

local function CreateUtilities( self, event, addon )
	if( addon == "Tukui_Raid_Healing" or addon == "Tukui_Raid" ) then
		if not TukuiMinimap then return end

		local TukuiRaidUtility = CreateFrame( "Frame", "TukuiRaidUtility", UIParent )
		TukuiRaidUtility:CreatePanel( "Transparent", TukuiMinimap:GetWidth(), panel_height, "TOP", UIParent, "TOP", -200, 2 )
		TukuiRaidUtility:Hide()
		TukuiRaidUtility:SetFrameLevel( 10 )
		TukuiRaidUtility:SetFrameStrata( "Medium" )

		local function CheckRaidStatus()
			local inInstance, instanceType = IsInInstance()
			if( UnitIsRaidOfficer( "player" ) or IsPartyLeader() ) and not ( inInstance and ( instanceType == "pvp" or instanceType == "arena" ) ) then
				return true
			else
				return false
			end
		end

		local function ButtonEnter( self )
			local color = RAID_CLASS_COLORS[S.myclass]
			self:SetBackdropBorderColor( color.r, color.g, color.b )
		end

		local function ButtonLeave( self )
			self:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		end

		local function CreateButton( name, parent, template, width, height, point, relativeto, point2, xOfs, yOfs, text, texture )
			local b = CreateFrame( "Button", name, parent, template )
			b:SetWidth( width )
			b:SetHeight( height )
			b:SetPoint( point, relativeto, point2, xOfs, yOfs )
			b:HookScript( "OnEnter", ButtonEnter )
			b:HookScript( "OnLeave", ButtonLeave )
			b:EnableMouse( true )
			b:SetTemplate( "Default" )
			if( text ) then
				local t = b:CreateFontString( nil, "OVERLAY", b )
				t:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				t:SetPoint( "CENTER" )
				t:SetJustifyH( "CENTER" )
				t:SetText( text )
				b:SetFontString( t )
			elseif( texture ) then
				local t = b:CreateTexture( nil, "OVERLAY", nil )
				t:SetTexture( normTex )
				t:SetPoint( "TOPLEFT", b, "TOPLEFT", S.mult, -S.mult )
				t:SetPoint( "BOTTOMRIGHT", b, "BOTTOMRIGHT", -S.mult, S.mult )
			end
		end

		CreateButton( "TukuiRaidUtilityShowButton", UIParent, "UIMenuButtonStretchTemplate, SecureHandlerClickTemplate", TukuiMinimap:GetWidth(), 21, "TOP", UIParent, "TOP", -200, 2, RAID_ASSISTANT, nil )
		TukuiRaidUtilityShowButton:SetFrameRef( "TukuiRaidUtility", TukuiRaidUtility )
		TukuiRaidUtilityShowButton:SetAttribute( "_onclick", [=[self:Hide(); self:GetFrameRef("TukuiRaidUtility"):Show();]=] )
		TukuiRaidUtilityShowButton:SetScript( "OnMouseUp", function( self ) TukuiRaidUtility.toggled = true end )
		TukuiRaidUtilityShowButton:Hide()

		CreateButton( "TukuiRaidUtilityCloseButton", TukuiRaidUtility, "UIMenuButtonStretchTemplate, SecureHandlerClickTemplate", TukuiMinimap:GetWidth(), 21, "TOP", TukuiRaidUtility, "BOTTOM", 0, -2, CLOSE, nil )
		TukuiRaidUtilityCloseButton:SetFrameRef("TukuiRaidUtilityShowButton", TukuiRaidUtilityShowButton )
		TukuiRaidUtilityCloseButton:SetAttribute( "_onclick", [=[self:GetParent():Hide(); self:GetFrameRef("TukuiRaidUtilityShowButton"):Show();]=] )
		TukuiRaidUtilityCloseButton:SetScript( "OnMouseUp", function( self ) TukuiRaidUtility.toggled = false end )

		CreateButton( "TukuiRaidUtilityDisbandRaidButton", TukuiRaidUtility, "UIMenuButtonStretchTemplate", TukuiRaidUtility:GetWidth() * 0.95, S.Scale( 21 ), "TOP", TukuiRaidUtility, "TOP", 0, S.Scale( -5 ), "Disband Group", nil )
		TukuiRaidUtilityDisbandRaidButton:SetScript( "OnMouseUp", function( self )
			if( CheckRaidStatus() ) then
				StaticPopup_Show( "TUKUIDISBAND_RAID" )
			end
		end )

		CreateButton( "TukuiRaidUtilityRoleCheckButton", TukuiRaidUtility, "UIMenuButtonStretchTemplate", TukuiRaidUtility:GetWidth() * 0.95, S.Scale( 21 ), "TOP", TukuiRaidUtilityDisbandRaidButton, "BOTTOM", 0, S.Scale( -5 ), ROLE_POLL, nil )
		TukuiRaidUtilityRoleCheckButton:SetScript( "OnMouseUp", function( self )
			if( CheckRaidStatus() ) then
				InitiateRolePoll()
			end
		end )

		CreateButton( "TukuiRaidUtilityMainTankButton", TukuiRaidUtility, "SecureActionButtonTemplate, UIMenuButtonStretchTemplate", ( TukuiRaidUtilityDisbandRaidButton:GetWidth() / 2 ) - S.Scale( 2 ), S.Scale( 21 ), "TOPLEFT", TukuiRaidUtilityRoleCheckButton, "BOTTOMLEFT", 0, S.Scale( -5 ), MAINTANK, nil )
		TukuiRaidUtilityMainTankButton:SetAttribute( "type", "maintank" )
		TukuiRaidUtilityMainTankButton:SetAttribute( "unit", "target" )
		TukuiRaidUtilityMainTankButton:SetAttribute( "action", "set" )

		CreateButton( "TukuiRaidUtilityMainAssistButton", TukuiRaidUtility, "SecureActionButtonTemplate, UIMenuButtonStretchTemplate", ( TukuiRaidUtilityDisbandRaidButton:GetWidth() / 2 ) - S.Scale( 2 ), S.Scale( 21 ), "TOPRIGHT", TukuiRaidUtilityRoleCheckButton, "BOTTOMRIGHT", 0, S.Scale( -5 ), MAINASSIST, nil )
		TukuiRaidUtilityMainAssistButton:SetAttribute( "type", "mainassist" )
		TukuiRaidUtilityMainAssistButton:SetAttribute( "unit", "target" )
		TukuiRaidUtilityMainAssistButton:SetAttribute( "action", "set" )

		CreateButton( "TukuiRaidUtilityReadyCheckButton", TukuiRaidUtility, "UIMenuButtonStretchTemplate", TukuiRaidUtilityRoleCheckButton:GetWidth() * 0.75, S.Scale( 21 ), "TOPLEFT", TukuiRaidUtilityMainTankButton, "BOTTOMLEFT", 0, S.Scale( -5 ), READY_CHECK, nil )
		TukuiRaidUtilityReadyCheckButton:SetScript( "OnMouseUp", function( self )
			if( CheckRaidStatus() ) then
				DoReadyCheck()
			end
		end )

		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:ClearAllPoints()
		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetPoint( "TOPRIGHT", TukuiRaidUtilityMainAssistButton, "BOTTOMRIGHT", 0, S.Scale( -5 ) )
		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetParent( TukuiRaidUtility )
		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetHeight( S.Scale( 21 ) )
		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetWidth( TukuiRaidUtilityRoleCheckButton:GetWidth() * 0.22 )

		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:ClearAllPoints()
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:SetPoint( "BOTTOMLEFT", CompactRaidFrameManagerDisplayFrameLockedModeToggle, "TOPLEFT", 0, 1 )
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:SetPoint( "BOTTOMRIGHT", CompactRaidFrameManagerDisplayFrameHiddenModeToggle, "TOPRIGHT", 0, 1 )

		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:ClearAllPoints()
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:SetPoint( "BOTTOMLEFT", CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck, "TOPLEFT", 0, 1 )
		CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:SetPoint( "BOTTOMRIGHT", CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck, "TOPRIGHT", 0, 1 )

		do
			local buttons = {
				"CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton",
				"TukuiRaidUtilityDisbandRaidButton",
				"TukuiRaidUtilityMainTankButton",
				"TukuiRaidUtilityMainAssistButton",
				"TukuiRaidUtilityRoleCheckButton",
				"TukuiRaidUtilityReadyCheckButton",
				"TukuiRaidUtilityShowButton",
				"TukuiRaidUtilityCloseButton"
			}

			for i, button in pairs( buttons ) do
				local f = _G[button]
				_G[button .. "Left"]:SetAlpha( 0 )
				_G[button .. "Middle"]:SetAlpha( 0 )
				_G[button .. "Right"]:SetAlpha( 0 )
				f:SetHighlightTexture( "" )
				f:SetDisabledTexture( "" )
				f:HookScript( "OnEnter", ButtonEnter )
				f:HookScript( "OnLeave", ButtonLeave )
				f:SetTemplate( "Default", true )
			end
		end

		local function ToggleRaidUtil( self, event )
			if( InCombatLockdown() ) then
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
				return
			end

			if( CheckRaidStatus() ) then
				if not TukuiRaidUtility.toggled then TukuiRaidUtilityShowButton:Show() end
			else
				TukuiRaidUtilityShowButton:Hide()
				if TukuiRaidUtility:IsShown() then TukuiRaidUtility:Hide() end
			end

			if( event == "PLAYER_REGEN_ENABLED" ) then
				self:UnregisterEvent( "PLAYER_REGEN_ENABLED" )
			end
		end

		local LeadershipCheck = CreateFrame( "Frame" )
		LeadershipCheck:RegisterEvent( "RAID_ROSTER_UPDATE" )
		LeadershipCheck:SetScript( "OnEvent", ToggleRaidUtil )
	end
end

local AddonLoaded = CreateFrame( "Frame" )
AddonLoaded:RegisterEvent( "ADDON_LOADED" )
AddonLoaded:SetScript( "OnEvent", CreateUtilities )