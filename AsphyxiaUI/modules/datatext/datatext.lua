local S, C, L = unpack( Tukui )

local DataTextPosition = function( f, t, o )
	local left = TukuiInfoLeft
	local right = TukuiInfoRight
	local mapleft = TukuiMinimapStatsLeft
	local mapright = TukuiMinimapStatsRight
	local center = TukuiInfoCenter
	local centerleft = TukuiInfoCenterLeft
	local centerright = TukuiInfoCenterRight
	
	if( o >= 1 and o <= 12 ) then
		if( o == 1 ) then
			t:ClearAllPoints()
			t:SetParent( left )
			t:SetHeight( left:GetHeight() )
			t:SetPoint( "LEFT", 30, 1 )
		elseif( o == 2 ) then
			t:ClearAllPoints()
			t:SetParent( left )
			t:SetHeight( left:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		elseif( o == 3 ) then
			t:ClearAllPoints()
			t:SetParent( left )
			t:SetHeight( left:GetHeight() )
			t:SetPoint( "RIGHT", -30, 1 )
		elseif( o == 4 ) then
			t:ClearAllPoints()
			t:SetParent( right )
			t:SetHeight( right:GetHeight() )
			t:SetPoint( "LEFT", 30, 1 )
		elseif( o == 5 ) then
			t:ClearAllPoints()
			t:SetParent( right )
			t:SetHeight( right:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		elseif( o == 6 ) then
			t:ClearAllPoints()
			t:SetParent( right )
			t:SetHeight( right:GetHeight() )
			t:SetPoint( "RIGHT", -30, 1 )
		elseif( o == 7 ) then
			t:ClearAllPoints()
			t:SetParent( centerleft )
			t:SetHeight( centerleft:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		elseif( o == 8 ) then
			t:ClearAllPoints()
			t:SetParent( center )
			t:SetHeight( center:GetHeight() )
			t:SetPoint( "LEFT", 30, 1 )
		elseif( o == 9 ) then
			t:ClearAllPoints()
			t:SetParent( center )
			t:SetHeight( center:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		elseif( o == 10 ) then
			t:ClearAllPoints()
			t:SetParent( center )
			t:SetHeight( center:GetHeight() )
			t:SetPoint( "RIGHT", -30, 1 )
		elseif( o == 11 ) then
			t:ClearAllPoints()
			t:SetParent( centerright )
			t:SetHeight( centerright:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		elseif( o == 12 ) then
			t:ClearAllPoints()
			t:SetParent( Tukuiwatch )
			t:SetHeight( Tukuiwatch:GetHeight() )
			t:SetPoint( "CENTER", 0, 1 )
		end
	else
		f:Hide()
		t:Hide()
	end
end

local datatext = { "Guild", "Friends", "Gold", "FPS", "System", "Bags", "Gold", "Time", "Durability", "Heal", "Damage", "Power", 
					"Haste", "Crit", "Avoidance", "Armor", "Currency", "Hit", "Mastery", "MicroMenu", "Regen", "Talent", "CallToArms" }

for _, data in pairs( datatext ) do
	local t = "TukuiStat"
	local frame = _G[t .. data]
	local text = _G[t .. data .. "Text"]

	if( frame and frame.Option ) then
		DataTextPosition( frame, text, frame.Option )
	end
end

if( C["datatext"].armor > 0 ) then
	TukuiStatArmorText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].avd > 0 ) then
	TukuiStatAvoidanceText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].bags > 0 ) then
	TukuiStatBagsText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].battleground == true ) then
	TukuiStatBattleGroundText1:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	TukuiStatBattleGroundText2:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	TukuiStatBattleGroundText3:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].calltoarms > 0 ) then
	TukuiStatCallToArmsText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].crit > 0 ) then
	TukuiStatCritText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].currency > 0 ) then
	TukuiStatCurrencyText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].dps_text > 0 ) then
	TukuiStatDPSText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].dur > 0 ) then
	TukuiStatDurabilityText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].fps_ms > 0 ) then
	TukuiStatFPSText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].friends > 0 ) then
	TukuiStatFriendsText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].gold > 0 ) then
	TukuiStatGoldText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].guild > 0 ) then
	TukuiStatGuildText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].haste > 0 ) then
	TukuiStatHasteText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].hit > 0 ) then
	TukuiStatHitText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].hps_text > 0 ) then
	TukuiStatHealText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].mastery > 0 ) then
	TukuiStatMasteryText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].micromenu > 0 ) then
	TukuiStatMicroMenuText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].power > 0 ) then
	TukuiStatPowerText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].regen > 0 ) then
	TukuiStatRegenText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].system > 0 ) then
	TukuiStatSystemText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].talent > 0 ) then
	TukuiStatTalentText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end

if( C["datatext"].wowtime > 0 ) then
	TukuiStatTimeText:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
end