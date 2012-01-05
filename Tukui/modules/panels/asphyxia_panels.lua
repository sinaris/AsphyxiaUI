local S, C, L = unpack( Tukui )

local DataVisibility = 1

---------------------------------------------------------------------------------------------
-- additional (Asphyxia) panels
---------------------------------------------------------------------------------------------
local icenter = CreateFrame( "Frame", "TukuiInfoCenter", TukuiBar1 )
icenter:CreatePanel( "Default", TukuiBar1:GetWidth(), 20, "TOP", TukuiBar1, "BOTTOM", 0, -3 )
icenter:CreateOverlay( icenter )
icenter:CreateShadow( "Default" )
icenter:SetFrameLevel( 2 )
icenter:SetFrameStrata( "BACKGROUND" )

local icenterleft = CreateFrame( "Frame", "TukuiInfoCenterLeft", TukuiSplitBarLeft )
icenterleft:CreatePanel( "Default", TukuiSplitBarLeft:GetWidth(), 20, "TOP", TukuiSplitBarLeft, "BOTTOM", 0, -3 )
icenterleft:CreateOverlay( icenterleft )
icenterleft:CreateShadow( "Default" )
icenterleft:SetFrameLevel( 2 )
icenterleft:SetFrameStrata( "BACKGROUND" )

local icenterright = CreateFrame( "Frame", "TukuiInfoCenterRight", TukuiSplitBarRight )
icenterright:CreatePanel( "Default", TukuiSplitBarRight:GetWidth(), 20, "TOP", TukuiSplitBarRight, "BOTTOM", 0, -3 )
icenterright:CreateOverlay( icenterright )
icenterright:CreateShadow( "Default" )
icenterright:SetFrameLevel( 2 )
icenterright:SetFrameStrata( "BACKGROUND" )

---------------------------------------------------------------------------------------------
-- specswitcher
---------------------------------------------------------------------------------------------
if( C["datatext"].enable_specswitcher ) then
	local specswitcher = CreateFrame( "Button", "TukuiSpecSwitcher", TukuiTabsLeftBackground )
	specswitcher:Size( 50, TukuiTabsLeftBackground:GetHeight() )
	specswitcher:Point( "RIGHT", TukuiTabsLeftBackground, "RIGHT", -41, 0 )
	specswitcher:SetFrameStrata( TukuiTabsLeftBackground:GetFrameStrata() )
	specswitcher:SetFrameLevel( TukuiTabsLeftBackground:GetFrameLevel() + 1 )

	local talenticon = CreateFrame( "Frame", "TukuiTalentIcon", TukuiSpecSwitcher )
	talenticon:CreatePanel( "Default", 19, TukuiTabsLeftBackground:GetHeight() - 4, "LEFT", specswitcher, "RIGHT", 20, 0 )
	talenticon:SetFrameStrata( TukuiTabsLeftBackground:GetFrameStrata() )
	talenticon:SetFrameLevel( TukuiTabsLeftBackground:GetFrameLevel() + 1 )
	talenticon:SetTemplate( "Default" )

	talenticon.tex = talenticon:CreateTexture( nil, "ARTWORK" )
	talenticon.tex:Point( "TOPLEFT", 2, -2 )
	talenticon.tex:Point( "BOTTOMRIGHT", -2, 2 )
	talenticon.tex:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )

	local UpdateTexture = function( self )
		if not GetPrimaryTalentTree() then return end
		local primary = GetPrimaryTalentTree()
		local tex = select( 4, GetTalentTabInfo( primary ) )

		self.tex:SetTexture( tex )
	end

	talenticon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	talenticon:RegisterEvent( "ACTIVE_TALENT_GROUP_CHANGED" )
	talenticon:RegisterEvent( "PLAYER_TALENT_UPDATE" )
	talenticon:SetScript( "OnEvent", UpdateTexture )
end

---------------------------------------------------------------------------------------------
-- time panel
---------------------------------------------------------------------------------------------
local watch = CreateFrame( "Frame", "Tukuiwatch", Minimap )
watch:CreatePanel( "Default", 53, 17, "TOP", Minimap, "BOTTOM", S.Scale( 0 ), 8 )
watch:CreateShadow( "Default" )
watch:SetFrameStrata( "MEDIUM" )
watch:CreateOverlay( watch )
watch:SetFrameLevel( 2 )

---------------------------------------------------------------------------------------------
-- layout switch
---------------------------------------------------------------------------------------------
if( C["chat"].background == true ) then
	local swl = CreateFrame( "Button", "TukuiSwitchLayoutButton", TukuiTabsRightBackground )
	swl:Size( 75, TukuiTabsRightBackground:GetHeight() )
	swl:Point( "RIGHT", TukuiTabsRightBackground, "RIGHT", -21, 0 )
	swl:SetFrameStrata( TukuiTabsRightBackground:GetFrameStrata() )
	swl:SetFrameLevel( TukuiTabsRightBackground:GetFrameLevel() + 1 )
	swl:RegisterForClicks( "AnyUp" )
	swl:SetScript( "OnClick", function()
		if( IsAddOnLoaded( "Tukui_Raid" ) ) then
			DisableAddOn( "Tukui_Raid" )
			EnableAddOn( "Tukui_Raid_Healing" )
			ReloadUI()
		elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
			DisableAddOn( "Tukui_Raid_Healing" )
			EnableAddOn( "Tukui_Raid" )
			ReloadUI()
		elseif not IsAddOnLoaded( "Tukui_Raid_Healing" ) and not IsAddOnLoaded( "Tukui_Raid" ) then
			EnableAddOn( "Tukui_Raid" )
			ReloadUI()
		end
	end )

	swl.Text = S.SetFontString( swl, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	swl.Text:Point( "RIGHT", swl, "RIGHT", -5, 1 )
	swl.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "switch layout" )

	local swlbutton = CreateFrame( "Button", "TukuiSpecSwitcher", TukuiTabsRightBackground )
	swlbutton:Size( 19, TukuiTabsRightBackground:GetHeight() - 4 )
	swlbutton:Point( "RIGHT", TukuiTabsRightBackground, "RIGHT", -2, 0 )
	swlbutton:SetFrameStrata( TukuiTabsRightBackground:GetFrameStrata() )
	swlbutton:SetFrameLevel( TukuiTabsRightBackground:GetFrameLevel() + 1 )
	swlbutton:SetTemplate( "Default" )

	swlbutton.tex = swlbutton:CreateTexture( nil, "ARTWORK" )
	swlbutton.tex:Point( "TOPLEFT", 2, -2 )
	swlbutton.tex:Point( "BOTTOMRIGHT", -2, 2 )
	swlbutton.tex:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )

	local UpdateTexture = function( self )
		if( IsAddOnLoaded( "Tukui_Raid" ) ) then
			newTex = C["media"].switchlayoutdd
		elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
			newTex = C["media"].switchlayoutheal
		end

		self.tex:SetTexture( newTex )
	end

	swlbutton:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	swlbutton:SetScript( "OnEvent", UpdateTexture )
end

---------------------------------------------------------------------------------------------
-- version button
---------------------------------------------------------------------------------------------
local verbutton = CreateFrame( "Button", "TukuiVersionButton", TukuiMinimap, "SecureActionButtonTemplate" )
verbutton:CreatePanel( "Default", 13, 17, "LEFT", Tukuiwatch, "RIGHT", 3, 0 )
verbutton:CreateShadow( "Default" )
verbutton:CreateOverlay( verbutton )
verbutton:SetAttribute( "type", "macro" )
verbutton:SetAttribute( "macrotext", "/version" )
verbutton:SetFrameStrata( "MEDIUM" )
verbutton:SetFrameLevel( 2 )

verbutton.Text = S.SetFontString( verbutton, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
verbutton.Text:Point( "CENTER", verbutton, "CENTER", 2, 1 )
verbutton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "V" )

verbutton:SetScript( "OnMouseDown", function( self )
if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end
	if not TukuiVersionFrame:IsShown() then
		S.fadeIn( TukuiVersionFrame )
	else
		S.fadeOut( TukuiVersionFrame )
	end
end )

---------------------------------------------------------------------------------------------
-- version logo (Asphyxia Avatar)
---------------------------------------------------------------------------------------------
local avatar = CreateFrame( "Frame", "Avatar", TukuiVersionFrame )
avatar:CreatePanel( avatar, 58, 58, "BOTTOM", TukuiVersionFrame, "TOP", 0, 2 )
avatar:SetFrameLevel( 2 )
avatar:SetFrameStrata( "BACKGROUND" )
avatar:SetTemplate( "Default" )
avatar:CreateShadow( "Default" )
	
local avatar_tex = avatar:CreateTexture( nil, "OVERLAY" )
avatar_tex:SetTexture( C["media"].asphyxia )
avatar_tex:SetPoint( "TOPLEFT", avatar, "TOPLEFT", 2, -2 )
avatar_tex:SetPoint( "BOTTOMRIGHT", avatar, "BOTTOMRIGHT", -2, 2 )

---------------------------------------------------------------------------------------------
-- help button
---------------------------------------------------------------------------------------------
local helpbutton = CreateFrame( "Button", "TukuiHelpButton", TukuiMinimap, "SecureActionButtonTemplate" )
helpbutton:CreatePanel( "Default", 13, 17, "RIGHT", Tukuiwatch, "LEFT", -3, 0 )
helpbutton:CreateShadow( "Default" )
helpbutton:CreateOverlay( helpbutton )
helpbutton:SetAttribute( "type", "macro" )
helpbutton:SetAttribute( "macrotext", "/ahelp" )
helpbutton:SetFrameStrata( "MEDIUM" )
helpbutton:SetFrameLevel( 2 )

helpbutton.Text = S.SetFontString( helpbutton, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
helpbutton.Text:Point( "CENTER", helpbutton, "CENTER", 1.5, 1 )
helpbutton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "H" )

---------------------------------------------------------------------------------------------
-- invisbutton, another thing :O
---------------------------------------------------------------------------------------------
local invisButton = CreateFrame( "Frame", "invisButton", UIParent )
invisButton:CreatePanel( "Transparent", 100, 20, "BOTTOM", UIParent, "BOTTOM", 0, 2, true )
invisButton:SetFrameLevel( 0 )
invisButton:SetAlpha( 0 )

---------------------------------------------------------------------------------------------
-- /resetui button
---------------------------------------------------------------------------------------------
local resetuibutton = CreateFrame( "Button", "TukuiResetUIButton", UIParent, "SecureActionButtonTemplate" )
resetuibutton:CreatePanel( "Default", 26, 20, "RIGHT", invisButton, "LEFT", -3, 0 )
resetuibutton:SetFrameStrata( "HIGH" )
resetuibutton:CreateShadow( "Default" )
resetuibutton:CreateOverlay( resetuibutton )
resetuibutton:SetAttribute( "type", "macro" )
resetuibutton:SetAttribute( "macrotext", "/resetui" )
resetuibutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
resetuibutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

resetuibutton.Text = S.SetFontString( resetuibutton, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
resetuibutton.Text:Point( "CENTER", resetuibutton, "CENTER", 1, 1 )
resetuibutton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "RS" )

if( C["asphyxia"].cp_onmouseover == true ) then
	resetuibutton:SetAlpha( 0 )
	resetuibutton:SetScript( "OnEnter", function()
		if( InCombatLockdown() ) then return end
		resetuibutton:FadeIn()
	end )

	resetuibutton:SetScript( "OnLeave", function()
		resetuibutton:FadeOut()
	end )
end

---------------------------------------------------------------------------------------------
-- /reloadui button
---------------------------------------------------------------------------------------------
local rluibutton = CreateFrame( "Button", "TukuiReloadUIButton", UIParent, "SecureActionButtonTemplate" )
rluibutton:CreatePanel( "Default", 26, 20, "LEFT", invisButton, "RIGHT", 3, 0 )
rluibutton:SetFrameStrata( "HIGH" )
rluibutton:CreateShadow( "Default" )
rluibutton:CreateOverlay( rluibutton )
rluibutton:SetAttribute( "type", "macro" )
rluibutton:SetAttribute( "macrotext", "/rl" )
rluibutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
rluibutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

rluibutton.Text = S.SetFontString( rluibutton, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
rluibutton.Text:Point( "CENTER", rluibutton, "CENTER", 1, 1 )
rluibutton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "RL" )

if( C["asphyxia"].cp_onmouseover == true ) then
	rluibutton:SetAlpha( 0 )
	rluibutton:SetScript( "OnEnter", function()
		if( InCombatLockdown() ) then return end
		rluibutton:FadeIn()
	end )

	rluibutton:SetScript( "OnLeave", function()
		rluibutton:FadeOut()
	end )
end

---------------------------------------------------------------------------------------------
-- world state frame
---------------------------------------------------------------------------------------------
WorldStateAlwaysUpFrame:ClearAllPoints()
WorldStateAlwaysUpFrame:SetPoint( "TOP", UIParent, "TOP", 0, S.Scale( -35 ) )

---------------------------------------------------------------------------------------------
-- unitframes show/hide
---------------------------------------------------------------------------------------------
if( C["unitframes"].hideunitframes == true ) then
	local HideUnitframes = function( self, event )
		if( event == "PLAYER_REGEN_DISABLED" ) then
			UIFrameFadeIn( TukuiPlayer, 0.5, 0, 1 )
		else
			UIFrameFadeIn( TukuiPlayer, 0.5, 1, 0 )
		end
	end

	local f = CreateFrame( "Frame" )
	f:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	f:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	f:RegisterEvent( "PLAYER_REGEN_DISABLED" )
	f:SetScript( "OnEvent", HideUnitframes )
end

---------------------------------------------------------------------------------------------
-- datatext panel toggle (button)
---------------------------------------------------------------------------------------------
local icb = CreateFrame( "Frame", "InfoCenterButton", TukuiChatBackgroundRight )
icb:CreatePanel( nil, 30, 15, "TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -2, -68 )
icb:SetAlpha( 0 )
icb:SetFrameStrata( "MEDIUM" )
icb:SetFrameLevel( 10 )
icb:CreateOverlay( icb )
icb:EnableMouse( true )
icb.f = icb:CreateFontString( nil, overlay )
icb.f:SetPoint( "CENTER" )
icb.f:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
icb.f:SetText( "|cff9a1212-|r" )
icb.f:Point( "CENTER", 1, 0 )
icb:SetScript( "OnMouseDown", function( self )
	ToggleFrame( TukuiInfoCenterRight )
	ToggleFrame( TukuiInfoCenterLeft )
	ToggleFrame( TukuiInfoCenter )
	if( icenter:IsShown() ) then
		self.f:SetText( "|cff9a1212-|r" )
	else
		self.f:SetText( "|cff9a1212+|r" )
	end
end )

icb:SetScript( "OnEnter", function()
	if( InCombatLockdown() ) then return end
	icb:FadeIn()
end )

icb:SetScript( "OnLeave", function()
	icb:FadeOut()
end )

---------------------------------------------------------------------------------------------
-- minimap buttons skinning
---------------------------------------------------------------------------------------------
local function SkinButton( f )
	if( f:GetObjectType() ~= "Button" ) then return end

	f:SetPushedTexture( nil )
	f:SetHighlightTexture( nil )
	f:SetDisabledTexture( nil )
	f:SetSize( 22, 22 )

	for i = 1, f:GetNumRegions() do
		local region = select( i, f:GetRegions() )
		if( region:GetObjectType() == "Texture" ) then
			local tex = region:GetTexture()
			if( tex:find( "Border" ) or tex:find( "Background" ) ) then
				region:SetTexture( nil )
			else
				region:SetDrawLayer( "OVERLAY", 5 )
				region:ClearAllPoints()
				region:Point( "TOPLEFT", f, "TOPLEFT", 2, -2 )
				region:Point( "BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2 )
				region:SetTexCoord( .08, .92, .08, .92 )
			end
		end
	end

	f:SetTemplate( "Default" )
	f:SetFrameLevel( f:GetFrameLevel() + 2 )
end

local x = CreateFrame( "Frame" )
x:RegisterEvent( "PLAYER_LOGIN" )
x:SetScript( "OnEvent", function( self, event )
	for i = 1, Minimap:GetNumChildren() do
		SkinButton( select( i, Minimap:GetChildren() ) )
	end

	self = nil
end )

---------------------------------------------------------------------------------------------
-- world state up (move frame)
---------------------------------------------------------------------------------------------
MiniMapBattlefieldFrame:ClearAllPoints()
MiniMapBattlefieldFrame:Point( "BOTTOMRIGHT", TukuiMinimap, "BOTTOMRIGHT", -4, 4 )

---------------------------------------------------------------------------------------------
-- minimap toggle button
---------------------------------------------------------------------------------------------
local mToggle = CreateFrame( "Button", "TukuiMinimapToggle", UIParent )
mToggle:CreatePanel( "Default", 11, 30, "TOPLEFT", TukuiAurasPlayerBuffs, "TOPRIGHT", 3, 0 )
mToggle:CreateShadow( "Default" )
mToggle:CreateOverlay( mToggle )
mToggle:HookScript( "OnEnter", S.SetModifiedBackdrop )
mToggle:HookScript( "OnLeave", S.SetOriginalBackdrop )

mToggle.Text = S.SetFontString( mToggle, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
mToggle.Text:Point( "CENTER", mToggle, "CENTER", 2, 0.5 )
mToggle.Text:SetText( "|cffFF0000-|r" )

mToggle:SetScript( "OnMouseDown", function()
    if( TukuiMinimap:IsVisible() ) then
		TukuiMinimap:Hide()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:Point( "TOPRIGHT", -18, -10 )
		TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", -18, -150 )
		mToggle.Text:SetText( "|cff00FF00+|r" )
    else
		TukuiMinimap:Show()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:Point( "TOPRIGHT", -204, -10 )
		TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", -204, -150 )
		mToggle.Text:SetText( "|cffFF0000-|r" )
    end
end )