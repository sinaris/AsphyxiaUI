local S, C, L = unpack( select( 2, ... ) )

if( C["asphyxia"].screensaver ~= true ) then return end

local color = RAID_CLASS_COLORS[S.myclass]

local AFKPanel = CreateFrame( "Frame", nil, UIParent )
AFKPanel:CreatePanel( "Default", 1, 1, "CENTER", UIParent, "CENTER", 0, 0 )
AFKPanel:ClearAllPoints()
AFKPanel:SetPoint( "TOPLEFT", UIParent, "TOPLEFT", -2, 2 )
AFKPanel:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 2, -2 )
--AFKPanel:SetTemplate( "Transparent" )
AFKPanel:SetFrameLevel( 128 )
AFKPanel:SetFrameStrata( "TOOLTIP" )
AFKPanel:Hide()

local AFKModel = CreateFrame( "PlayerModel", nil, AFKPanel )
AFKModel:SetPoint( "TOPLEFT" )
AFKModel:SetPoint( "BOTTOMLEFT" )
AFKModel:SetPoint( "TOPRIGHT", UIParent, "TOP" )
AFKModel:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOM" )
AFKModel:SetUnit( "player" )
AFKModel:SetFacing( 0.65 )
AFKModel:SetFrameLevel( AFKPanel:GetFrameLevel() + 1 )

AFKModel.Text = S.SetFontString( AFKPanel, C["media"].asphyxiafont, 72, "MONOCHROMEOUTLINE" )
AFKModel.Text:Point( "TOP", AFKPanel, "TOP", 0, -80 )
AFKModel.Text:SetText( S.myname  )
AFKModel.Text:SetTextColor( color.r, color.g, color.b )
AFKModel.Text:SetPoint( "CENTER" )

AFKModel.Text = S.SetFontString( AFKPanel, C["media"].asphyxiafont, 72, "MONOCHROMEOUTLINE" )
AFKModel.Text:Point( "TOP", AFKPanel, "TOP", 0, -150 )
AFKModel.Text:SetText( S.level .. " " .. S.myrace .. " " .. S.myclass  )
AFKModel.Text:SetPoint( "CENTER" )

AFKPanel.Text = S.SetFontString( AFKPanel, C["media"].asphyxiafont, 72, "MONOCHROMEOUTLINE" )
AFKPanel.Text:Point( "CENTER", AFKPanel, "CENTER", 0, 0 )
AFKPanel.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "AsphyxiaUI " .. S.xversion .. " - Screensaver\nDon't waste your time. Play!" )
AFKPanel.Text:SetPoint( "CENTER" )

AFKPanel.Text2 = S.SetFontString( AFKPanel, C["media"].asphyxiafont, 72, "MONOCHROMEOUTLINE" )
AFKPanel.Text2:Point( "BOTTOM", AFKPanel.Text, "TOP", 0, 30 )
AFKPanel.Text2:SetText( "Merry christmas and a happy new year!" )
AFKPanel.Text2:SetPoint( "CENTER" )

local AFKPanelIconLeft = CreateFrame( "Frame", "TukuiTalentIcon", AFKPanel )
AFKPanelIconLeft:CreatePanel( "Default", 100, 100, "RIGHT", AFKPanel.Text, "LEFT", -20, 0 )
AFKPanelIconLeft:SetFrameStrata( AFKPanel:GetFrameStrata() )
AFKPanelIconLeft:SetFrameLevel( AFKPanel:GetFrameLevel() + 1 )
AFKPanelIconLeft:SetTemplate( "Transparent" )

AFKPanelIconLeft.Tex = AFKPanelIconLeft:CreateTexture( nil, "ARTWORK" )
AFKPanelIconLeft.Tex:Point( "TOPLEFT", 2, -2 )
AFKPanelIconLeft.Tex:Point( "BOTTOMRIGHT", -2, 2 )
AFKPanelIconLeft.Tex:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
AFKPanelIconLeft.Tex:SetTexture( C["media"].asphyxia )

local AFKPanelIconRight = CreateFrame( "Frame", "TukuiTalentIcon", AFKPanel )
AFKPanelIconRight:CreatePanel( "Default", 100, 100, "LEFT", AFKPanel.Text, "RIGHT", 20, 0 )
AFKPanelIconRight:SetFrameStrata( AFKPanel:GetFrameStrata() )
AFKPanelIconRight:SetFrameLevel( AFKPanel:GetFrameLevel() + 1 )
AFKPanelIconRight:SetTemplate( "Transparent" )

AFKPanelIconRight.Tex = AFKPanelIconRight:CreateTexture( nil, "ARTWORK" )
AFKPanelIconRight.Tex:Point( "TOPLEFT", 2, -2 )
AFKPanelIconRight.Tex:Point( "BOTTOMRIGHT", -2, 2 )
AFKPanelIconRight.Tex:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
AFKPanelIconRight.Tex:SetTexture( C["media"].asphyxia )

local OnEvent = function( self, event, unit )
	if( event == "PLAYER_FLAGS_CHANGED" ) then
		if( unit == "player" ) then
			if( UnitIsAFK( unit ) ) then
				AFKPanel:Show()
				SpinStart()
			else
				AFKPanel:Hide()
				SpinStop()
			end
		end
	elseif( event == "PLAYER_LEAVING_WORLD" ) then
		AFKPanel:Hide()
		SpinStop()
	end
end

AFKPanel:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AFKPanel:RegisterEvent( "PLAYER_LEAVING_WORLD" )
AFKPanel:RegisterEvent( "PLAYER_FLAGS_CHANGED" )
AFKPanel:SetScript( "OnEvent", OnEvent )

function SpinStart()
	spinning = true
	MoveViewRightStart( 0.1 )
end

function SpinStop()
	if not spinning then return end
	spinning = nil
	MoveViewRightStop()
end