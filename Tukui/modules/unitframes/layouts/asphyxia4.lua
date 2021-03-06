local ADDON_NAME, ns = ...
local oUF = ns.oUF or oUF
assert( oUF, "Tukui was unable to locate oUF install." )

ns._Objects = {}
ns._Headers = {}

local S, C, L = unpack( select( 2, ... ) )

if( C["unitframes"].enable ~= true ) then return end

if( C["asphyxia"].layout ~= "asphyxia4" ) then return end

---------------------------------------------------------------------------------------------
-- some locals we need
---------------------------------------------------------------------------------------------
local font1 = C["media"].uffont
local font2 = C["media"].font
local font = C["media"].pixelfont
local normTex = C["media"].normTex
local glowTex = C["media"].glowTex
local bubbleTex = C["media"].bubbleTex

---------------------------------------------------------------------------------------------
-- the layout starts here
---------------------------------------------------------------------------------------------
local function Shared( self, unit )
	self.colors = S.UnitColor

	self:RegisterForClicks( "AnyUp" )
	self:SetScript( "OnEnter", UnitFrame_OnEnter )
	self:SetScript( "OnLeave", UnitFrame_OnLeave )

	self.menu = S.SpawnMenu

	local InvFrame = CreateFrame( "Frame", nil, self )
	InvFrame:SetFrameStrata( "HIGH" )
	InvFrame:SetFrameLevel( 5 )
	InvFrame:SetAllPoints()

	local RaidIcon = InvFrame:CreateTexture( nil, "OVERLAY" )
	RaidIcon:SetTexture( "Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp" )
	RaidIcon:SetHeight( 20 )
	RaidIcon:SetWidth( 20 )
	RaidIcon:SetPoint( "TOP", 0, 11 )
	self.RaidIcon = RaidIcon

	if( C["unitframes"].fader == true ) then
		if( ( unit and not unit:find( "arena%d" ) ) or ( unit and not unit:find( "boss%d" ) ) ) then
			self.Fader = {
				[1] = { Combat = 1, Arena = 1, Instance = 1 },
				[2] = { PlayerTarget = 1, PlayerNotMaxHealth = 1, PlayerNotMaxMana = 1 },
				[3] = { Stealth = 1 },
				[4] = { notCombat = 0, PlayerTaxi = 0 },
			}
		end
		self.NormalAlpha = 1
	end

	---------------------------------------------------------------------------------------------
	-- player
	---------------------------------------------------------------------------------------------
	if( unit == "player" ) then
		local panel = CreateFrame( "Frame", nil, self )
		if( S.lowversion ) then
			panel:CreatePanel( "Default", 186, 21, "BOTTOM", self, "BOTTOM", 0, 0 )
		else
			panel:CreatePanel( "Default", 250, 21, "BOTTOM", self, "BOTTOM", 0, 0 )
		end
		panel:SetFrameLevel( 2 )
		panel:SetFrameStrata( "MEDIUM" )
		panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		panel:SetAlpha( 0 )
		self.panel = panel

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 20 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "RIGHT", health, "RIGHT", -4, 1 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorTapping = false
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .125, .125, .125, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorTapping = true
			health.colorClass = true
			health.colorReaction = true
		end

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Size( 240, 18 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", -5, 9 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )
		power:SetFrameStrata( "BACKGROUND" )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder.shadow:Point( "TOPLEFT", -3, 0 )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "LEFT", health, "LEFT", 4, 1 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		power.frequentUpdates = true
		power.colorDisconnected = true

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end
		
		if( C["unitframes"].unicolor == true ) then
			power.colorTapping = true
			power.colorClass = true
			powerBackground.multiplier = 0.1
		else
			power.colorPower = true
		end

		-----------------------
		-- portraits
		-----------------------
		if( C["unitframes"].charportrait == true ) then
			local portrait = CreateFrame( "PlayerModel", nil, health )
			portrait:SetFrameLevel( health:GetFrameLevel() )
			portrait.PostUpdate = function( self )
				self:SetAlpha( 0 )
				self:SetAlpha( .15 )
			end
			portrait:SetAllPoints( health )
			table.insert( self.__elements, S.HidePortrait )
			self.Portrait = portrait
		end

		-----------------------
		-- classicons
		-----------------------
		if( C["unitframes"].classicon == true ) then
			local classicon = CreateFrame( "Frame", self:GetName() .. "_ClassIconBorder", self )
			classicon:CreatePanel( "Default", 33, 33, "TOPRIGHT", health, "TOPLEFT", -10, 2 )
			classicon:CreateShadow( "Default" )

			local class = classicon:CreateTexture( self:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			self.ClassIcon = class
		end

		-----------------------
		-- weakenedsoulbar
		-----------------------
		if( S.myclass == "PRIEST" and C["unitframes"].weakenedsoulbar == true ) then
			local ws = CreateFrame( "StatusBar", self:GetName() .. "_WeakenedSoul", power )
			ws:SetAllPoints( power )
			ws:SetStatusBarTexture( normTex )
			ws:GetStatusBarTexture():SetHorizTile( false )
			ws:SetBackdrop( backdrop )
			ws:SetBackdropColor( unpack( C["media"].backdropcolor ) )
			ws:SetStatusBarColor( 191 / 255, 10 / 255, 10 / 255 )
			self.WeakenedSoul = ws
		end

		-----------------------
		-- combat icon
		-----------------------
		local Combat = health:CreateTexture( nil, "OVERLAY" )
		Combat:Height( 19 )
		Combat:Width( 19 )
		Combat:SetPoint( "CENTER", 0, 0 )
		Combat:SetVertexColor( 0.69, 0.31, 0.31 )
		self.Combat = Combat

		-----------------------
		-- mana flash
		-----------------------
		FlashInfo = CreateFrame( "Frame", "TukuiFlashInfo", self )
		FlashInfo:SetScript( "OnUpdate", S.UpdateManaLevel )
		FlashInfo.parent = self
		FlashInfo:SetAllPoints( health )
		FlashInfo.ManaLevel = S.SetFontString( FlashInfo, S.SetUserFont() )
		FlashInfo.ManaLevel:SetPoint( "CENTER", health, "CENTER", 0, 1 )
		self.FlashInfo = FlashInfo

		-----------------------
		-- pvp status icon
		-----------------------
		local PVP = health:CreateTexture( nil, "OVERLAY" )
		PVP:SetHeight( S.Scale( 32 ) )
		PVP:SetWidth( S.Scale( 32 ) )
		PVP:SetPoint( "CENTER", health, "CENTER", 0, -7 )
		self.PvP = PVP

		-----------------------
		-- leader icon
		-----------------------
		local Leader = InvFrame:CreateTexture( nil, "OVERLAY" )
		Leader:Height( 14 )
		Leader:Width( 14 )
		Leader:Point( "TOPLEFT", 2, 8 )
		self.Leader = Leader

		-----------------------
		-- master looter icon
		-----------------------
		local MasterLooter = InvFrame:CreateTexture( nil, "OVERLAY" )
		MasterLooter:Height( 14 )
		MasterLooter:Width( 14 )
		self.MasterLooter = MasterLooter
		self:RegisterEvent( "PARTY_LEADER_CHANGED", S.MLAnchorUpdate )
		self:RegisterEvent( "PARTY_MEMBERS_CHANGED", S.MLAnchorUpdate )

		-----------------------
		-- experience
		-----------------------
		if( S.level ~= MAX_PLAYER_LEVEL ) then
			local Experience = CreateFrame( "StatusBar", self:GetName() .. "_Experience", self )
			Experience:SetStatusBarTexture( normTex )
			Experience:SetStatusBarColor( 0, 0.4, 1, .8 )
			Experience:Size( TukuiChatBackgroundLeft:GetWidth() - 4, 2 )
			Experience:Point( "BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 5 )
			Experience:SetFrameLevel( 8 )
			Experience:SetFrameStrata( "HIGH" )
			Experience.Tooltip = true
			self.Experience = Experience

			local ExperienceBackground = Experience:CreateTexture( nil, "BORDER" )
			ExperienceBackground:SetAllPoints()
			ExperienceBackground:SetTexture( normTex )
			ExperienceBackground:SetVertexColor( 0, 0, 0 )

			Experience.Text = self.Experience:CreateFontString( nil, "OVERLAY" )
			Experience.Text:SetFont( S.SetUserFont() )
			Experience.Text:SetPoint( "CENTER", 0, 1 )
			Experience.Text:SetShadowOffset( S.mult, -S.mult )
			self.Experience.Text = Experience.Text
			self.Experience.PostUpdate = S.ExperienceText

			self.Experience.Rested = CreateFrame( "StatusBar", nil, self.Experience )
			self.Experience.Rested:SetAllPoints( self.Experience )
			self.Experience.Rested:SetStatusBarTexture( normTex )
			self.Experience.Rested:SetStatusBarColor( 1, 0, 1, 0.2 )

			local Resting = self:CreateTexture( nil, "OVERLAY" )
			Resting:SetHeight( 28 )
			Resting:SetWidth( 28 )
			Resting:SetPoint( "BOTTOMRIGHT", self, "TOPLEFT", 6, 7 )
			Resting:SetTexture( [=[Interface\CharacterFrame\UI-StateIcon]=] )
			Resting:SetTexCoord( 0, 0.5, 0, 0.421875 )
			self.Resting = Resting

			local ExperienceFrame = CreateFrame( "Frame", nil, self.Experience )
			ExperienceFrame:SetPoint( "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
			ExperienceFrame:SetPoint( "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
			ExperienceFrame:SetTemplate( "Transparent" )
			ExperienceFrame:CreateShadow( "Default" )
			ExperienceFrame:SetFrameLevel( self.Experience:GetFrameLevel() - 1 )
		end

		-----------------------
		-- reputation
		-----------------------
		if( S.level == MAX_PLAYER_LEVEL ) then
			local Reputation = CreateFrame( "StatusBar", self:GetName() .. "_Reputation", self )
			Reputation:SetStatusBarTexture( normTex )
			Reputation:Size( TukuiChatBackgroundLeft:GetWidth() - 4, 2 )
			Reputation:Point( "BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 5 )
			Reputation:SetFrameLevel( 10 )

			local ReputationBG = Reputation:CreateTexture( nil, "BORDER" )
			ReputationBG:SetAllPoints()
			ReputationBG:SetTexture( normTex )
			ReputationBG:SetVertexColor( 0, 0, 0 )

			Reputation.Text = Reputation:CreateFontString( nil, "OVERLAY" )
			Reputation.Text:SetFont( S.SetUserFont() )
			Reputation.Text:SetPoint( "CENTER", 0, 1 )
			Reputation.Text:SetShadowOffset( S.mult, -S.mult )
			Reputation.Text:Show()
			Reputation.PostUpdate = S.UpdateReputation
			Reputation.Text = Reputation.Text

			Reputation.PostUpdate = S.UpdateReputationColor
			Reputation.Tooltip = true
			self.Reputation = Reputation

			local ReputationFrame = CreateFrame( "Frame", nil, self.Reputation )
			ReputationFrame:SetPoint( "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
			ReputationFrame:SetPoint( "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
			ReputationFrame:SetTemplate( "Transparent" )
			ReputationFrame:CreateShadow( "Default" )
			ReputationFrame:SetFrameLevel( self.Reputation:GetFrameLevel() - 1 )
		end

		-----------------------
		-- druidmana
		-----------------------
		if( S.myclass == "DRUID" ) then
			local DruidManaUpdate = CreateFrame( "Frame" )
			DruidManaUpdate:SetScript( "OnUpdate", function() S.UpdateDruidManaText( self ) end )

			local DruidManaText = S.SetFontString( health, S.SetUserFont() )
			DruidManaText:SetTextColor( 1, 0.49, 0.04 )
			self.DruidManaText = DruidManaText
		end

		-----------------------
		-- classbars
		-----------------------
		if( C["unitframes"].classbar == true ) then
			-----------------------
			-- druid
			-----------------------
			if( S.myclass == "DRUID" ) then
				local DruidManaBackground = CreateFrame( "Frame", nil, self )
				DruidManaBackground:Point( "BOTTOMLEFT", self, "TOPLEFT", 0, 6 )
				DruidManaBackground:Size( 230, 5 )
				DruidManaBackground:SetFrameStrata( "MEDIUM" )
				DruidManaBackground:SetFrameLevel( 8 )
				DruidManaBackground:SetTemplate( "Default" )
				DruidManaBackground:SetBackdropBorderColor( 0, 0, 0, 0 )

				local DruidManaBarStatus = CreateFrame( "StatusBar", nil, DruidManaBackground )
				DruidManaBarStatus:SetPoint( "LEFT", DruidManaBackground, "LEFT", 0, 0 )
				DruidManaBarStatus:SetSize( DruidManaBackground:GetWidth(), DruidManaBackground:GetHeight() )
				DruidManaBarStatus:SetStatusBarTexture( normTex )
				DruidManaBarStatus:SetStatusBarColor( .30, .52, .90 )

				DruidManaBackground:SetScript( "OnShow", function() S.DruidBarDisplay( self, false ) end )
				DruidManaBackground:SetScript( "OnUpdate", function() S.DruidBarDisplay( self, true ) end )
				DruidManaBackground:SetScript( "OnHide", function() S.DruidBarDisplay( self, false ) end )

				self.DruidManaBackground = DruidManaBackground
				self.DruidMana = DruidManaBarStatus

				DruidManaBackground.FrameBackdrop = CreateFrame( "Frame", nil, DruidManaBackground )
				DruidManaBackground.FrameBackdrop:SetTemplate( "Default" )
				DruidManaBackground.FrameBackdrop:SetPoint( "TOPLEFT", -2, 2 )
				DruidManaBackground.FrameBackdrop:SetPoint( "BOTTOMRIGHT", 2, -2 )
				DruidManaBackground.FrameBackdrop:SetFrameLevel( DruidManaBackground:GetFrameLevel() - 1 )

				local eclipseBar = CreateFrame( "Frame", nil, self )
				eclipseBar:Point( "BOTTOMLEFT", self, "TOPLEFT", 0, 6 )
				eclipseBar:Size( 230, 5 )
				eclipseBar:SetFrameStrata( "MEDIUM" )
				eclipseBar:SetFrameLevel( 8 )
				eclipseBar:SetBackdropBorderColor( 0, 0, 0, 0 )
				eclipseBar:SetScript( "OnShow", function() S.DruidBarDisplay( self, false ) end )
				eclipseBar:SetScript( "OnHide", function() S.DruidBarDisplay( self, false ) end )

				local lunarBar = CreateFrame( "StatusBar", nil, eclipseBar )
				lunarBar:SetPoint( "LEFT", eclipseBar, "LEFT", 0, 0 )
				lunarBar:SetSize( eclipseBar:GetWidth(), eclipseBar:GetHeight() )
				lunarBar:SetStatusBarTexture( normTex )
				lunarBar:SetStatusBarColor( .30, .52, .90 )
				eclipseBar.LunarBar = lunarBar

				local solarBar = CreateFrame( "StatusBar", nil, eclipseBar )
				solarBar:SetPoint( "LEFT", lunarBar:GetStatusBarTexture(), "RIGHT", 0, 0 )
				solarBar:SetSize( eclipseBar:GetWidth(), eclipseBar:GetHeight() )
				solarBar:SetStatusBarTexture( normTex )
				solarBar:SetStatusBarColor( .80, .82,  .60 )
				eclipseBar.SolarBar = solarBar

				local eclipseBarText = eclipseBar:CreateFontString( nil, "OVERLAY" )
				eclipseBarText:SetPoint( "TOP", eclipseBar, 0, 25 )
				eclipseBarText:SetPoint( "BOTTOM", eclipseBar )
				eclipseBarText:SetFont( S.SetUserFont() )
				eclipseBarText:SetShadowOffset( S.mult, -S.mult )
				eclipseBarText:SetShadowColor( 0, 0, 0, 0.4 )
				eclipseBar.PostUpdatePower = S.EclipseDirection

				if( eclipseBar and eclipseBar:IsShown() ) then FlashInfo.ManaLevel:SetAlpha( 0 ) end

				self.EclipseBar = eclipseBar
				self.EclipseBar.Text = eclipseBarText

				eclipseBar.FrameBackdrop = CreateFrame( "Frame", nil, eclipseBar )
				eclipseBar.FrameBackdrop:SetTemplate( "Default" )
				eclipseBar.FrameBackdrop:CreateShadow( "Default" )
				eclipseBar.FrameBackdrop:SetPoint( "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
				eclipseBar.FrameBackdrop:SetPoint( "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
				eclipseBar.FrameBackdrop:SetFrameLevel( eclipseBar:GetFrameLevel() - 1 )
			end

			-----------------------
			-- warlock, paladin
			-----------------------
			if( S.myclass == "WARLOCK" or S.myclass == "PALADIN" ) then
				local bars = CreateFrame( "Frame", nil, self )
				bars:Size( 200, 5 )
				bars:Point( "TOP", health, "TOP", 1, 12 )
				bars:SetBackdropBorderColor( 0, 0, 0, 0 )
				bars:SetFrameLevel( self:GetFrameLevel() + 3 )
				bars:SetFrameStrata( "MEDIUM" )

				for i = 1, 3 do
					bars[i] = CreateFrame( "StatusBar", self:GetName() .. "_Shard" .. i, bars )
					bars[i]:Height( 5 )
					bars[i]:SetStatusBarTexture( normTex )
					bars[i]:GetStatusBarTexture():SetHorizTile( false )

					if( S.myclass == "WARLOCK" ) then
						bars[i]:SetStatusBarColor( 148 / 255, 130 / 255, 201 / 255 )
					elseif( S.myclass == "PALADIN" ) then
						bars[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )
					end

					if( i == 1 ) then
						bars[i]:SetPoint( "LEFT", bars )
						bars[i]:SetWidth( S.Scale( 180 / 3 ) )
					else
						bars[i]:Point( "LEFT", bars[i - 1], "RIGHT", S.Scale( 8 ), 0 )
						bars[i]:SetWidth( S.Scale( 180 / 3 ) )
					end

					bars[i].border = CreateFrame( "Frame", nil, bars )
					bars[i].border:SetPoint( "TOPLEFT", bars[i], "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
					bars[i].border:SetPoint( "BOTTOMRIGHT", bars[i], "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
					bars[i].border:SetFrameStrata( "BACKGROUND" )
					bars[i].border:SetFrameLevel( 2 )
					bars[i].border:SetTemplate( "Default" )
					bars[i].border:CreateShadow( "Default" )
				end

				if( S.myclass == "WARLOCK" ) then
					bars.Override = S.UpdateShards
					self.SoulShards = bars
				elseif( S.myclass == "PALADIN" ) then
					bars.Override = S.UpdateHoly
					self.HolyPower = bars
				end
			end

			-----------------------
			-- deathknight
			-----------------------
			if( S.myclass == "DEATHKNIGHT" ) then
				local Runes = CreateFrame( "Frame", nil, self )
				Runes:Point( "LEFT", health, "TOPLEFT", 15, 10 )
				Runes:Size( 120, 5 )
				Runes:SetFrameLevel( self:GetFrameLevel() + 3 )
				Runes:SetFrameStrata( "MEDIUM" )

				for i = 1, 6 do
					Runes[i] = CreateFrame( "StatusBar", self:GetName() .. "_Runes" .. i, self )
					Runes[i]:SetHeight( S.Scale( 5 ) )

					if( i == 1 ) then
						Runes[i]:SetPoint( "LEFT", Runes, "LEFT", 0, 0 )
						Runes[i]:SetWidth( S.Scale( 176 / 6 ) )
					else
						Runes[i]:SetPoint( "LEFT", Runes[i - 1], "RIGHT", S.Scale( 5 ), 0 )
						Runes[i]:SetWidth( S.Scale( 176 / 6 ) )
					end

					Runes[i]:SetStatusBarTexture( normTex )
					Runes[i]:GetStatusBarTexture():SetHorizTile( false )
					Runes[i]:SetBackdrop( backdrop )
					Runes[i]:SetBackdropColor( 0, 0, 0 )
					Runes[i]:SetFrameLevel( 4 )

					Runes[i].bg = Runes[i]:CreateTexture( nil, "BORDER" )
					Runes[i].bg:SetAllPoints( Runes[i] )
					Runes[i].bg:SetTexture( normTex )
					Runes[i].bg.multiplier = 0.3

					Runes[i].border = CreateFrame( "Frame", nil, Runes[i] )
					Runes[i].border:SetPoint( "TOPLEFT", Runes[i], "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
					Runes[i].border:SetPoint( "BOTTOMRIGHT", Runes[i], "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
					Runes[i].border:SetFrameStrata( "MEDIUM" )
					Runes[i].border:SetFrameLevel( 4 )
					Runes[i].border:SetTemplate( "Default" )
					Runes[i].border:CreateShadow( "Default" )
				end

				self.Runes = Runes
			end

			if( S.myclass == "SHAMAN" ) then
				local TotemBar = {}

				TotemBar.Destroy = true
				for i = 1, 4 do
					TotemBar[i] = CreateFrame( "StatusBar", self:GetName() .. "_TotemBar" .. i, self )
					TotemBar[i]:SetFrameLevel( self:GetFrameLevel() + 3 )

					if( i == 1 ) then
						TotemBar[i]:Point( "LEFT", health, "TOPLEFT", 20, 10 )
					else
						TotemBar[i]:SetPoint( "TOPLEFT", TotemBar[i - 1], "TOPRIGHT", S.Scale( 7 ), 0 )
					end

					TotemBar[i]:SetStatusBarTexture( normTex )
					TotemBar[i]:SetHeight( S.Scale( 5 ) )
					TotemBar[i]:SetWidth( S.Scale( 180 ) / 4 )
					TotemBar[i]:SetFrameLevel( 4 )

					TotemBar[i]:SetBackdrop( backdrop )
					TotemBar[i]:SetBackdropColor( 0, 0, 0, 1 )
					TotemBar[i]:SetMinMaxValues( 0, 1 )

					TotemBar[i].bg = TotemBar[i]:CreateTexture( nil, "BORDER" )
					TotemBar[i].bg:SetAllPoints( TotemBar[i] )
					TotemBar[i].bg:SetTexture( normTex )
					TotemBar[i].bg.multiplier = 0.2

					TotemBar[i].border = CreateFrame( "Frame", nil, TotemBar[i] )
					TotemBar[i].border:SetPoint( "TOPLEFT", TotemBar[i], "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
					TotemBar[i].border:SetPoint( "BOTTOMRIGHT", TotemBar[i], "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
					TotemBar[i].border:SetFrameStrata( "MEDIUM" )
					TotemBar[i].border:SetFrameLevel( 4 )
					TotemBar[i].border:CreateShadow( "Default" )
					TotemBar[i].border:SetTemplate( "Default" )
				end

				self.TotemBar = TotemBar
			end
			
		end

		self:SetScript( "OnEnter", function( self )
			if( self.EclipseBar and self.EclipseBar:IsShown() ) then
				self.EclipseBar.Text:Hide()
			end
			FlashInfo.ManaLevel:Hide()
			UnitFrame_OnEnter( self )
		end )

		self:SetScript( "OnLeave", function( self )
			if( self.EclipseBar and self.EclipseBar:IsShown() ) then
				self.EclipseBar.Text:Show()
			end
			FlashInfo.ManaLevel:Show()
			UnitFrame_OnLeave( self ) 
		end )

		-----------------------
		-- castbar
		-----------------------
		if( C["unitframes"].unitcastbar == true ) then
			local castbar = CreateFrame( "StatusBar", self:GetName() .. "CastBar", self )
			castbar:SetStatusBarTexture( normTex )

			castbar.bg = castbar:CreateTexture( nil, "BORDER" )
			castbar.bg:SetAllPoints( castbar )
			castbar.bg:SetTexture( normTex )
			castbar.bg:SetVertexColor( .05, .05, .05 )

			if( C["unitframes"].cbicons == true ) then
				castbar:SetWidth( TukuiBar1:GetWidth() - 31 )
			else
				castbar:SetWidth( TukuiBar1:GetWidth() - 4 )
			end

			castbar:SetHeight( 20 )
			castbar:Point( "BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, 5 )
			castbar:SetFrameLevel( 6 )

			if( C["unitframes"].cbspark == true ) then
				castbar.Spark = castbar:CreateTexture( nil, "OVERLAY" )
				castbar.Spark:SetHeight( 36 )
				castbar.Spark:SetWidth( 15 )
				castbar.Spark:SetBlendMode( "ADD" )
			end

			castbar.border = CreateFrame( "Frame", nil, castbar )
			castbar.border:CreatePanel( "Default", 1, 1, "TOPLEFT", castbar, "TOPLEFT", -2, 2 )
			castbar.border:CreateShadow( "Default" )
			castbar.border:Point( "BOTTOMRIGHT", castbar, "BOTTOMRIGHT", 2, -2 )

			castbar.CustomTimeText = S.CustomCastTimeText
			castbar.CustomDelayText = S.CustomCastDelayText
			castbar.PostCastStart = S.PostCastStart
			castbar.PostChannelStart = S.PostCastStart

			castbar.time = S.SetFontString( castbar, S.SetUserFont() )
			castbar.time:Point( "RIGHT", castbar.bg, "RIGHT", -4, 1 )
			castbar.time:SetTextColor( 0, 4, 0 )
			castbar.time:SetJustifyH( "RIGHT" )

			castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
			castbar.Text:Point( "LEFT", castbar.bg, "LEFT", 4, 1 )
			castbar.Text:SetTextColor( 0.3, 0.2, 1 )
			castbar.Text:Width( 100 )
			castbar.Text:Height( 10 )

			if( C["unitframes"].cbicons == true ) then
				castbar.button = CreateFrame( "Frame", nil, castbar )
				castbar.button:Size( 24 )
				castbar.button:SetTemplate( "Default" )
				castbar.button:CreateShadow( "Default" )
				castbar.button:SetPoint( "RIGHT", castbar, "LEFT", -5, 0 )

				castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
				castbar.icon:Point( "TOPLEFT", castbar.button, 2, -2 )
				castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
				castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )
			end

			if( C["unitframes"].cblatency == true ) then
				castbar.safezone = castbar:CreateTexture( nil, "ARTWORK" )
				castbar.safezone:SetTexture( normTex )
				castbar.safezone:SetVertexColor( 0.8, 0.2, 0.2, 0.75 )
				castbar.SafeZone = castbar.safezone
			end

			self.Castbar = castbar
			self.Castbar.Time = castbar.time
			self.Castbar.Icon = castbar.icon
		end

		if( C["unitframes"].vegeancebar == true ) then
			local classcolor = RAID_CLASS_COLORS[S.myclass]
			local vegeancebar = CreateFrame( "StatusBar", self:GetName() .. "_Vengeance", self )
			vegeancebar:SetFrameStrata( "TOOLTIP" )
			vegeancebar:SetFrameLevel( 20 )
			vegeancebar:Point( "TOPLEFT", TukuiInfoCenterLeft, 2, -2 )
			vegeancebar:Point( "BOTTOMRIGHT", TukuiInfoCenterLeft, -2, 2 )
			vegeancebar:SetStatusBarTexture( C["media"].normTex )
			vegeancebar:GetStatusBarTexture():SetHorizTile( false )
			vegeancebar:SetStatusBarColor( classcolor.r, classcolor.g, classcolor.b, 1 )
			vegeancebar:SetTemplate( "Default", true )
			vegeancebar:SetBackdropBorderColor( 0, 0, 0, 0 )
			vegeancebar.Text = S.SetFontString( vegeancebar, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			vegeancebar.Text:Point( "CENTER", TukuiInfoCenterLeft, "CENTER", 0, 1 )

			self.Vengeance = vegeancebar
		end

		if( C["unitframes"].swingtimer == true ) then
			local swingtimer = CreateFrame( "StatusBar", self:GetName() .. "_Swing", self )
			swingtimer:SetFrameLevel( 2 )

			swingtimer:Point( "BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, 32 )
			swingtimer:SetWidth( TukuiBar1:GetWidth() - 4 )
			swingtimer:Height( 1 )
			swingtimer:SetStatusBarTexture( C["media"].normTex )
			swingtimer:GetStatusBarTexture():SetHorizTile( false )
			swingtimer:SetStatusBarColor( C["media"].bordercolor )

			swingtimer.bg = CreateFrame( "Frame", nil, swingtimer )
			swingtimer.bg:Point( "TOPLEFT", -2, 2 )
			swingtimer.bg:Point( "BOTTOMRIGHT", 2, -2 )
			swingtimer.bg:SetFrameLevel( swingtimer:GetFrameLevel() - 1 )
			swingtimer.bg:SetTemplate( "Default", true )
			swingtimer.bg:CreateShadow( "Default" )

			swingtimer.disableMelee = false
			swingtimer.disableRanged = false
			swingtimer.hideOoc = true

			self.Swing = swingtimer
		end

		-----------------------
		-- combat feedback
		-----------------------
		if( C["unitframes"].combatfeedback == true ) then
			local CombatFeedbackText
			CombatFeedbackText = S.SetFontString( health, S.SetUserFont() )
			CombatFeedbackText:SetPoint( "CENTER", 0, 1 )
			CombatFeedbackText.colors = {
				DAMAGE = { 0.69, 0.31, 0.31 },
				CRUSHING = { 0.69, 0.31, 0.31 },
				CRITICAL = { 0.69, 0.31, 0.31 },
				GLANCING = { 0.69, 0.31, 0.31 },
				STANDARD = { 0.84, 0.75, 0.65 },
				IMMUNE = { 0.84, 0.75, 0.65 },
				ABSORB = { 0.84, 0.75, 0.65 },
				BLOCK = { 0.84, 0.75, 0.65 },
				RESIST = { 0.84, 0.75, 0.65 },
				MISS = { 0.84, 0.75, 0.65 },
				HEAL = { 0.33, 0.59, 0.33 },
				CRITHEAL = { 0.33, 0.59, 0.33 },
				ENERGIZE = { 0.31, 0.45, 0.63 },
				CRITENERGIZE = { 0.31, 0.45, 0.63 },
			}
			self.CombatFeedbackText = CombatFeedbackText
		end

		-----------------------
		-- healcomm
		-----------------------
		if( C["unitframes"].healcomm == true ) then
			local mhpb = CreateFrame( "StatusBar", nil, self.Health )
			mhpb:SetPoint( "TOPLEFT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0 )
			mhpb:SetPoint( "BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0 )
			if( S.lowversion ) then
				mhpb:SetWidth( 186 )
			else
				mhpb:SetWidth( 250 )
			end
			mhpb:SetStatusBarTexture(normTex)
			mhpb:SetStatusBarColor( 0, 1, 0.5, 0.25 )
			mhpb:SetMinMaxValues( 0, 1 )

			local ohpb = CreateFrame( "StatusBar", nil, self.Health )
			ohpb:SetPoint( "TOPLEFT", mhpb:GetStatusBarTexture(), "TOPRIGHT", 0, 0 )
			ohpb:SetPoint( "BOTTOMLEFT", mhpb:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0 )
			ohpb:SetWidth( 250 )
			ohpb:SetStatusBarTexture( normTex )
			ohpb:SetStatusBarColor( 0, 1, 0, 0.25 )

			self.HealPrediction = {
				myBar = mhpb,
				otherBar = ohpb,
				maxOverflow = 1,
			}
		end

		-----------------------
		-- playeraggro
		-----------------------
		if( C["unitframes"].playeraggro == true ) then
			table.insert( self.__elements, S.UpdateThreat )
			self:RegisterEvent( "PLAYER_TARGET_CHANGED", S.UpdateThreat )
			self:RegisterEvent( "UNIT_THREAT_LIST_UPDATE", S.UpdateThreat )
			self:RegisterEvent( "UNIT_THREAT_SITUATION_UPDATE", S.UpdateThreat )
		end
	end

	---------------------------------------------------------------------------------------------
	-- target
	---------------------------------------------------------------------------------------------
	if( unit == "target" ) then
		local panel = CreateFrame( "Frame", nil, self )
		if( S.lowversion ) then
			panel:CreatePanel( "Default", 186, 21, "BOTTOM", self, "BOTTOM", 0, 0 )
		else
			panel:CreatePanel( "Default", 250, 21, "BOTTOM", self, "BOTTOM", 0, 0 )
		end
		panel:SetFrameLevel( 2 )
		panel:SetFrameStrata( "MEDIUM" )
		panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		panel:SetAlpha( 0 )
		self.panel = panel

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 20 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "RIGHT", health, "RIGHT", -4, 1 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorTapping = false
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .125, .125, .125, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorTapping = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:Point( "CENTER", health, "CENTER", 0, 1 )
		Name:SetJustifyH( "LEFT" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort] [Tukui:diffcolor][level] [shortclassification]" )

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Size( 240, 18 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", 5, 9 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )
		power:SetFrameStrata( "BACKGROUND" )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder.shadow:Point( "TOPLEFT", -3, 0 )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "LEFT", health, "LEFT", 4, 1 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		power.frequentUpdates = true
		power.colorDisconnected = true

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end
		
		if( C["unitframes"].unicolor == true ) then
			power.colorTapping = true
			power.colorClass = true
			powerBackground.multiplier = 0.1
		else
			power.colorPower = true
		end

		-----------------------
		-- portraits
		-----------------------
		if( C["unitframes"].charportrait == true ) then
			local portrait = CreateFrame( "PlayerModel", nil, health )
			portrait:SetFrameLevel( health:GetFrameLevel() )
			portrait.PostUpdate = function( self )
				self:SetAlpha( 0 )
				self:SetAlpha( .15 )
			end
			portrait:SetAllPoints( health )
			table.insert( self.__elements, S.HidePortrait ) 
			self.Portrait = portrait
		end

		-----------------------
		-- classicons
		-----------------------
		if( C["unitframes"].classicon == true ) then
			local classicon = CreateFrame( "Frame", self:GetName() .. "_ClassIconBorder", self )
			classicon:CreatePanel( "Default", 33, 33, "TOPLEFT", health, "TOPRIGHT", 10, 2 )
			classicon:CreateShadow( "Default" )

			local class = classicon:CreateTexture( self:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			self.ClassIcon = class
		end

		-----------------------
		-- weakenedsoulbar
		-----------------------
		if( S.myclass == "PRIEST" and C["unitframes"].weakenedsoulbar == true ) then
			local ws = CreateFrame( "StatusBar", self:GetName() .. "_WeakenedSoul", power )
			ws:SetAllPoints( power )
			ws:SetStatusBarTexture( normTex )
			ws:GetStatusBarTexture():SetHorizTile( false )
			ws:SetBackdrop( backdrop )
			ws:SetBackdropColor( unpack( C["media"].backdropcolor ) )
			ws:SetStatusBarColor( 191 / 255, 10 / 255, 10 / 255 )
			self.WeakenedSoul = ws
		end

		-----------------------
		-- combo points
		-----------------------
		--local cp = S.SetFontString( self, font, 15, "MONOCHROMEOUTLINE" )
		--cp:SetPoint( "RIGHT", health.border, "LEFT", -5, 0 )
		--self.CPoints = cp

		-----------------------
		-- buffs, debuffs
		-----------------------
		if( ( unit == "target" and C["unitframes"].targetauras ) or ( unit == "player" and C["unitframes"].playerauras ) ) then
			local buffs = CreateFrame( "Frame", nil, self )
			local debuffs = CreateFrame( "Frame", nil, self )

			if( ( S.myclass == "SHAMAN" or S.myclass == "DEATHKNIGHT" or S.myclass == "PALADIN" or S.myclass == "WARLOCK" ) and ( C["unitframes"].playerauras ) and ( unit == "player" ) ) then
				if( S.lowversion ) then
					buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", 0, 34 )
				else
					buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", 0, 38 )
				end
			else
				if( S.lowversion ) then
					buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", 0, 26 )
				else
					buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", -2, 32 )
				end
			end

			if( S.lowversion ) then
				buffs:SetHeight( 21.5 )
				buffs:SetWidth( 186 )
				buffs.size = 21.5
				buffs.num = 8

				debuffs:SetHeight( 21.5 )
				debuffs:SetWidth( 186 )
				debuffs:SetPoint( "BOTTOMLEFT", buffs, "TOPLEFT", 0, 2 )
				debuffs.size = 21.5
				debuffs.num = 24
			else
				buffs:SetHeight( 26 )
				buffs:SetWidth( 252 )
				buffs.size = 27.5
				buffs.num = 8

				debuffs:SetHeight( 26 )
				debuffs:SetWidth( 247 )
				debuffs:SetPoint( "BOTTOMLEFT", buffs, "TOPLEFT", -2, 2 )
				debuffs.size = 26
				debuffs.num = 24
			end

			buffs.spacing = 2
			buffs.initialAnchor = "TOPLEFT"
			buffs.PostCreateIcon = S.PostCreateAura
			buffs.PostUpdateIcon = S.PostUpdateAura
			self.Buffs = buffs

			debuffs.spacing = 2
			debuffs.initialAnchor = "TOPRIGHT"
			debuffs["growth-y"] = "UP"
			debuffs["growth-x"] = "LEFT"
			debuffs.PostCreateIcon = S.PostCreateAura
			debuffs.PostUpdateIcon = S.PostUpdateAura

			if( unit == "target" ) then
				debuffs.onlyShowPlayer = C["unitframes"].onlyselfdebuffs
			end

			self.Debuffs = debuffs
		end

		-----------------------
		-- castbar
		-----------------------
		if( C["unitframes"].unitcastbar == true ) then
			local castbar = CreateFrame( "StatusBar", self:GetName() .. "CastBar", self )
			castbar:SetStatusBarTexture( normTex )

			castbar.bg = castbar:CreateTexture( nil, "BORDER" )
			castbar.bg:SetAllPoints( castbar )
			castbar.bg:SetTexture( normTex )
			castbar.bg:SetVertexColor( .05, .05, .05 )

			if( C["unitframes"].cbicons == true ) then
				castbar:SetWidth( 225 - 28 )
			else
				castbar:SetWidth( 246 )
			end

			castbar:SetHeight( 20 )
			castbar:Point( "TOPRIGHT", self, "BOTTOMRIGHT", 0, 20 )
			castbar:SetFrameLevel( 6 )

			if( C["unitframes"].cbspark == true ) then
				castbar.Spark = castbar:CreateTexture( nil, "OVERLAY" )
				castbar.Spark:SetHeight( 36 )
				castbar.Spark:SetWidth( 15 )
				castbar.Spark:SetBlendMode( "ADD" )
			end

			castbar.border = CreateFrame( "Frame", nil, castbar )
			castbar.border:CreatePanel( "Default", 1, 1, "TOPLEFT", castbar, "TOPLEFT", -2, 2 )
			castbar.border:CreateShadow( "Default" )
			castbar.border:Point( "BOTTOMRIGHT", castbar, "BOTTOMRIGHT", 2, -2 )

			castbar.CustomTimeText = S.CustomCastTimeText
			castbar.CustomDelayText = S.CustomCastDelayText
			castbar.PostCastStart = S.PostCastStart
			castbar.PostChannelStart = S.PostCastStart

			castbar.time = S.SetFontString( castbar, S.SetUserFont() )
			castbar.time:Point( "RIGHT", castbar.bg, "RIGHT", -4, 1 )
			castbar.time:SetTextColor( 0, 4, 0 )
			castbar.time:SetJustifyH( "RIGHT" )

			castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
			castbar.Text:Point( "LEFT", castbar.bg, "LEFT", 4, 1 )
			castbar.Text:SetTextColor( 0.3, 0.2, 1 )
			castbar.Text:Width( 100 )
			castbar.Text:Height( 10 )

			if( C["unitframes"].cbicons == true ) then
				castbar.button = CreateFrame( "Frame", nil, castbar )
				castbar.button:Size( 24 )
				castbar.button:SetTemplate( "Default" )
				castbar.button:CreateShadow( "Default" )
				castbar.button:SetPoint( "RIGHT", castbar, "LEFT", -5, 0 )

				castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
				castbar.icon:Point( "TOPLEFT", castbar.button, 2, -2 )
				castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
				castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )
			end

			self.Castbar = castbar
			self.Castbar.Time = castbar.time
			self.Castbar.Icon = castbar.icon
		end

		-----------------------
		-- combat feedback
		-----------------------
		if( C["unitframes"].combatfeedback == true ) then
			local CombatFeedbackText
			CombatFeedbackText = S.SetFontString( health, S.SetUserFont() )
			CombatFeedbackText:SetPoint( "CENTER", 0, 1 )
			CombatFeedbackText.colors = {
				DAMAGE = { 0.69, 0.31, 0.31 },
				CRUSHING = { 0.69, 0.31, 0.31 },
				CRITICAL = { 0.69, 0.31, 0.31 },
				GLANCING = { 0.69, 0.31, 0.31 },
				STANDARD = { 0.84, 0.75, 0.65 },
				IMMUNE = { 0.84, 0.75, 0.65 },
				ABSORB = { 0.84, 0.75, 0.65 },
				BLOCK = { 0.84, 0.75, 0.65 },
				RESIST = { 0.84, 0.75, 0.65 },
				MISS = { 0.84, 0.75, 0.65 },
				HEAL = { 0.33, 0.59, 0.33 },
				CRITHEAL = { 0.33, 0.59, 0.33 },
				ENERGIZE = { 0.31, 0.45, 0.63 },
				CRITENERGIZE = { 0.31, 0.45, 0.63 },
			}
			self.CombatFeedbackText = CombatFeedbackText
		end

		-----------------------
		-- healcomm
		-----------------------
		if( C["unitframes"].healcomm == true ) then
			local mhpb = CreateFrame( "StatusBar", nil, self.Health )
			mhpb:SetPoint( "TOPLEFT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0 )
			mhpb:SetPoint( "BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0 )
			if( S.lowversion ) then
				mhpb:SetWidth( 186 )
			else
				mhpb:SetWidth( 250 )
			end
			mhpb:SetStatusBarTexture(normTex)
			mhpb:SetStatusBarColor( 0, 1, 0.5, 0.25 )
			mhpb:SetMinMaxValues( 0, 1 )

			local ohpb = CreateFrame( "StatusBar", nil, self.Health )
			ohpb:SetPoint( "TOPLEFT", mhpb:GetStatusBarTexture(), "TOPRIGHT", 0, 0 )
			ohpb:SetPoint( "BOTTOMLEFT", mhpb:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0 )
			ohpb:SetWidth( 250 )
			ohpb:SetStatusBarTexture( normTex )
			ohpb:SetStatusBarColor( 0, 1, 0, 0.25 )

			self.HealPrediction = {
				myBar = mhpb,
				otherBar = ohpb,
				maxOverflow = 1,
			}
		end

		-----------------------
		-- playeraggro
		-----------------------
		if( C["unitframes"].playeraggro == true ) then
			table.insert( self.__elements, S.UpdateThreat )
			self:RegisterEvent( "PLAYER_TARGET_CHANGED", S.UpdateThreat )
			self:RegisterEvent( "UNIT_THREAT_LIST_UPDATE", S.UpdateThreat )
			self:RegisterEvent( "UNIT_THREAT_SITUATION_UPDATE", S.UpdateThreat )
		end
	end

	---------------------------------------------------------------------------------------------
	-- targettarget
	---------------------------------------------------------------------------------------------
	if( unit == "targettarget" ) then
		local panel = CreateFrame( "Frame", nil, self )
		if( S.lowversion ) then
			panel:CreatePanel( "Default", 129, 17, "BOTTOM", self, "BOTTOM", 0, S.Scale( 0 ) )
			panel:SetFrameLevel( 2 )
			panel:SetFrameStrata( "MEDIUM" )
			panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
			panel:SetAlpha( 0 )
			self.panel = panel
		else
			panel:CreatePanel( "Default", 129, 17, "BOTTOM", self, "BOTTOM", 0, S.Scale( 0 ) )
			panel:SetFrameLevel( 2 )
			panel:SetFrameStrata( "MEDIUM" )
			panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
			panel:SetAlpha( 0 )
			self.panel = panel
		end

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 17 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 2, 2 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort] [Tukui:diffcolor][level] [shortclassification]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Height( 3 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", 9, 1 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -9, -2 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true
		power.colorPower = true
		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		self.Power = power
		self.Power.bg = powerBackground

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		-----------------------
		-- buffs, debuffs
		-----------------------
		if( C["unitframes"].totdebuffs == true and S.lowversion ~= true ) then
			local debuffs = CreateFrame( "Frame", nil, health )
			debuffs:SetHeight( 20 )
			debuffs:SetWidth( 127 )
			debuffs.size = 20
			debuffs.spacing = 2
			debuffs.num = 6

			debuffs:SetPoint( "TOPLEFT", health, "TOPLEFT", -0.5, 24 )
			debuffs.initialAnchor = "TOPLEFT"
			debuffs["growth-y"] = "UP"
			debuffs.PostCreateIcon = S.PostCreateAura
			debuffs.PostUpdateIcon = S.PostUpdateAura
			self.Debuffs = debuffs
		end
	end

	---------------------------------------------------------------------------------------------
	-- pet
	---------------------------------------------------------------------------------------------
	if( unit == "pet" ) then
		local panel = CreateFrame( "Frame", nil, self )
		if( S.lowversion ) then
			panel:CreatePanel( "Default", 129, 17, "BOTTOM", self, "BOTTOM", 0, S.Scale( 0 ) )
			panel:SetFrameLevel( 2 )
			panel:SetFrameStrata( "MEDIUM" )
			panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
			panel:SetAlpha( 0 )
			self.panel = panel
		else
			panel:CreatePanel( "Default", 129, 17, "BOTTOM", self, "BOTTOM", 0, S.Scale( 0 ) )
			panel:SetFrameLevel( 2 )
			panel:SetFrameStrata( "MEDIUM" )
			panel:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
			panel:SetAlpha( 0 )
			self.panel = panel
		end

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		if( C["unitframes"].extendedpet == true ) then
			health:Height( 17 )
		else
			health:Height( 16 )
		end
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.PostUpdate = S.PostUpdatePetColor

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
		
		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true	
			health.colorClass = true
			health.colorReaction = true	
			if( S.myclass == "HUNTER" ) then
				health.colorHappiness = true
			end
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", self.Health, "CENTER", 1, 2 )
		Name:SetFont( S.SetUserFont() )
		Name:SetJustifyH( "CENTER" )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:namemedium]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		if( C["unitframes"].extendedpet == true ) then
			local power = CreateFrame( "StatusBar", nil, self )
			power:Height( 3 )
			power:Point( "TOPLEFT", health, "BOTTOMLEFT", 7, 0 )
			power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -7, -1 )
			power:SetStatusBarTexture( normTex )
			power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

			power.frequentUpdates = true
			power.colorPower = true
			if( C["unitframes"].showsmooth == true ) then
				power.Smooth = true
			end

			local powerBackground = power:CreateTexture( nil, "BORDER" )
			powerBackground:SetAllPoints( power )
			powerBackground:SetTexture( normTex )
			powerBackground.multiplier = 0.3

			local powerBorder = CreateFrame( "Frame", nil, power )
			powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
			powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
			powerBorder:SetTemplate( "Default" )
			powerBorder:CreateShadow( "Default" )
			powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
			self.PowerBorder = powerBorder

			self.Power = power
			self.Power.bg = powerBackground
		end

		self:RegisterEvent( "UNIT_PET", S.updateAllElements )
	end

	---------------------------------------------------------------------------------------------
	-- pettarget
	---------------------------------------------------------------------------------------------
	if( unit == "pettarget" ) then
		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 15 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", -2, 2 )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", 2, -2 )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
			
		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
		Name:SetFont( S.SetUserFont() )
		Name:SetJustifyH( "CENTER" )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:namemedium]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Size( 128, 2 )
		power:Point( "TOP", health, "BOTTOM", 0, -7 )
		power:SetStatusBarTexture( normTex )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", -2, 2 )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", 2, -2 )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		self.Power = power
		self.Power.bg = powerBackground

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			power.colorTapping = true
			power.colorClass = true
			power.colorReaction = true
			powerBackground.multiplier = 0.1
		else
			power.colorPower = true
		end

		self:RegisterEvent( "UNIT_PET", S.updateAllElements )
	end

	---------------------------------------------------------------------------------------------
	-- focus
	---------------------------------------------------------------------------------------------
	if( unit == "focus" ) then
		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 20 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.frequentUpdates = true
		health.colorDisconnected = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
		health.colorClass = true

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "LEFT", 2, 1 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 0, 0 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Height( 3 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", 85, 0 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -9, -3 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true
		power.colorPower = true
		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "RIGHT", -2, 1 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		-----------------------
		-- buffs, debuffs
		-----------------------
		local debuffs = CreateFrame( "Frame", nil, self )
		debuffs:SetHeight( 26 )
		debuffs:SetWidth( 200 )
		debuffs:Point( "LEFT", self, "RIGHT", 4, 6 )
		debuffs.size = 20
		debuffs.num = 8
		debuffs.spacing = 2
		debuffs.initialAnchor = "LEFT"
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = S.PostCreateAura
		debuffs.PostUpdateIcon = S.PostUpdateAura
		self.Debuffs = debuffs

		-----------------------
		-- castbar
		-----------------------
		local castbar = CreateFrame( "StatusBar", self:GetName() .. "CastBar", self )
		castbar:SetPoint( "LEFT", 0, 0 )
		castbar:SetPoint( "RIGHT", -23, 0 )
		castbar:SetPoint( "BOTTOM", 0, -20 )

		castbar:SetHeight( 16 )
		castbar:SetStatusBarTexture( normTex )
		castbar:SetFrameLevel( 6 )

		castbar.bg = CreateFrame( "Frame", nil, castbar )
		castbar.bg:SetTemplate( "Default" )
		castbar.bg:CreateShadow( "Default" )
		castbar.bg:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		castbar.bg:Point( "TOPLEFT", -2, 2 )
		castbar.bg:Point( "BOTTOMRIGHT", 2, -2 )
		castbar.bg:SetFrameLevel( 5 )

		castbar.time = S.SetFontString( castbar, S.SetUserFont() )
		castbar.time:Point( "RIGHT", castbar, "RIGHT", -4, 1 )
		castbar.time:SetTextColor( 0, 4, 0 )
		castbar.time:SetJustifyH( "RIGHT" )
		castbar.CustomTimeText = S.CustomCastTimeText

		castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
		castbar.Text:SetPoint( "LEFT", castbar, "LEFT", 4, 1 )
		castbar.Text:SetTextColor( 0.3, 0.2, 1 )
		castbar.Text:Width( 100 )
		castbar.Text:Height( 12 )

		castbar.CustomDelayText = S.CustomCastDelayText
		castbar.PostCastStart = S.PostCastStart
		castbar.PostChannelStart = S.PostCastStart

		castbar.button = CreateFrame( "Frame", nil, castbar )
		castbar.button:Height( castbar:GetHeight() + 4 )
		castbar.button:Width( castbar:GetHeight() + 4 )
		castbar.button:Point( "LEFT", castbar, "RIGHT", 5, 0 )
		castbar.button:SetTemplate( "Default" )
		castbar.button:CreateShadow( "Default" )
		castbar.button:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )

		castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
		castbar.icon:Point( "TOPLEFT", castbar.button, 2, -2 )
		castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
		castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )

		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	---------------------------------------------------------------------------------------------
	-- focustarget
	---------------------------------------------------------------------------------------------
	if( unit == "focustarget" ) then
		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 20 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.frequentUpdates = true
		health.colorDisconnected = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
		health.colorClass = true

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "LEFT", 2, 1 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 0, 0 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Height( 3 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", 85, 0 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -9, -3 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true
		power.colorPower = true
		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "RIGHT", -2, 1 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		-----------------------
		-- buffs, debuffs
		-----------------------
		local debuffs = CreateFrame( "Frame", nil, self )
		debuffs:SetHeight( 26 )
		debuffs:SetWidth( 200 )
		debuffs:Point( "LEFT", self, "RIGHT", 4, 6 )
		debuffs.size = 20
		debuffs.num = 8
		debuffs.spacing = 2
		debuffs.initialAnchor = "LEFT"
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = S.PostCreateAura
		debuffs.PostUpdateIcon = S.PostUpdateAura
		self.Debuffs = debuffs

		-----------------------
		-- castbar
		-----------------------
		local castbar = CreateFrame( "StatusBar", self:GetName() .. "CastBar", self )
		castbar:SetPoint( "LEFT", 0, 0 )
		castbar:SetPoint( "RIGHT", -23, 0 )
		castbar:SetPoint( "BOTTOM", 0, -20 )

		castbar:SetHeight( 16 )
		castbar:SetStatusBarTexture( normTex )
		castbar:SetFrameLevel( 6 )

		castbar.bg = CreateFrame( "Frame", nil, castbar )
		castbar.bg:SetTemplate( "Default" )
		castbar.bg:CreateShadow( "Default" )
		castbar.bg:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		castbar.bg:Point( "TOPLEFT", -2, 2 )
		castbar.bg:Point( "BOTTOMRIGHT", 2, -2 )
		castbar.bg:SetFrameLevel( 5 )

		castbar.time = S.SetFontString( castbar, S.SetUserFont() )
		castbar.time:Point( "RIGHT", castbar, "RIGHT", -4, 1 )
		castbar.time:SetTextColor( 0, 4, 0 )
		castbar.time:SetJustifyH( "RIGHT" )
		castbar.CustomTimeText = S.CustomCastTimeText

		castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
		castbar.Text:SetPoint( "LEFT", castbar, "LEFT", 4, 1 )
		castbar.Text:SetTextColor( 0.3, 0.2, 1 )
		castbar.Text:Width( 100 )
		castbar.Text:Height( 12 )

		castbar.CustomDelayText = S.CustomCastDelayText
		castbar.PostCastStart = S.PostCastStart
		castbar.PostChannelStart = S.PostCastStart

		castbar.button = CreateFrame( "Frame", nil, castbar )
		castbar.button:Height( castbar:GetHeight() + 4 )
		castbar.button:Width( castbar:GetHeight() + 4 )
		castbar.button:Point( "LEFT", castbar, "RIGHT", 5, 0 )
		castbar.button:SetTemplate( "Default" )
		castbar.button:CreateShadow( "Default" )
		castbar.button:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )

		castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
		castbar.icon:Point( "TOPLEFT", castbar.button, 2, -2 )
		castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
		castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )

		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	---------------------------------------------------------------------------------------------
	-- arena
	---------------------------------------------------------------------------------------------
	if( unit and unit:find( "arena%d" ) and C["arena"].unitframes == true ) then
		self:SetAttribute( "type2", "focus" )

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 22 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.frequentUpdates = true
		health.colorDisconnected = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
		health.colorClass = true

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "LEFT", 2, 0.5 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 0, 1 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		Name.frequentUpdates = 0.2
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Height( 3 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", 85, 0 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -9, -3 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true
		power.colorPower = true
		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "RIGHT", -2, 0.5 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		-----------------------
		-- buffs, debuffs
		-----------------------
		local debuffs = CreateFrame( "Frame", nil, self )
		debuffs:SetHeight( 26 )
		debuffs:SetWidth( 200 )
		debuffs:SetPoint( "TOPLEFT", self, "TOPRIGHT", S.Scale( 5 ), 2 )
		debuffs.size = 26
		debuffs.num = 0
		debuffs.spacing = 3
		debuffs.initialAnchor = "LEFT"
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = S.PostCreateAura
		debuffs.PostUpdateIcon = S.PostUpdateAura
		self.Debuffs = debuffs

		-----------------------
		-- trinket
		-----------------------
		local Trinketbg = CreateFrame( "Frame", nil, self )
		Trinketbg:SetHeight( 26 )
		Trinketbg:SetWidth( 26 )
		Trinketbg:SetPoint( "TOPRIGHT", self, "TOPLEFT", -5, 2 )
		Trinketbg:SetTemplate( "Default" )
		Trinketbg:CreateShadow( "Default" )
		Trinketbg:SetFrameLevel( 0 )
		self.Trinketbg = Trinketbg

		local Trinket = CreateFrame( "Frame", nil, Trinketbg )
		Trinket:SetAllPoints( Trinketbg )
		Trinket:SetPoint( "TOPLEFT", Trinketbg, S.Scale( 2 ), S.Scale( -2 ) )
		Trinket:SetPoint( "BOTTOMRIGHT", Trinketbg, S.Scale( -2 ), S.Scale( 2 ) )
		Trinket:SetFrameLevel( 1 )
		Trinket.trinketUseAnnounce = true
		self.Trinket = Trinket

		-----------------------
		-- castbar
		-----------------------
		local castbar = CreateFrame( "StatusBar", self:GetName().."CastBar", self )
		castbar:SetPoint( "LEFT", 23, -1 )
		castbar:SetPoint( "RIGHT", 0, -1 )
		castbar:SetPoint( "BOTTOM", 0, -21 )

		castbar:SetHeight( 16 )
		castbar:SetStatusBarTexture( normTex )
		castbar:SetFrameLevel( 6 )

		castbar.bg = CreateFrame( "Frame", nil, castbar )
		castbar.bg:SetTemplate( "Default" )
		castbar.bg:CreateShadow( "Default" )
		castbar.bg:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		castbar.bg:Point( "TOPLEFT", -2, 2 )
		castbar.bg:Point( "BOTTOMRIGHT", 2, -2 )
		castbar.bg:SetFrameLevel( 5 )

		castbar.time = S.SetFontString( castbar, S.SetUserFont() )
		castbar.time:Point( "RIGHT", castbar, "RIGHT", -4, 1 )
		castbar.time:SetTextColor( 0, 4, 0 )
		castbar.time:SetJustifyH( "RIGHT" )
		castbar.CustomTimeText = S.CustomCastTimeText

		castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
		castbar.Text:Point( "LEFT", castbar, "LEFT", 4, 1 )
		castbar.Text:SetTextColor( 0.3, 0.2, 1 )
		castbar.Text:Width( 100 )
		castbar.Text:Height( 10 )

		castbar.CustomDelayText = S.CustomCastDelayText
		castbar.PostCastStart = S.PostCastStart
		castbar.PostChannelStart = S.PostCastStart

		castbar.button = CreateFrame( "Frame", nil, castbar )
		castbar.button:Height( castbar:GetHeight() + 4 )
		castbar.button:Width( castbar:GetHeight() + 4 )
		castbar.button:Point( "RIGHT", castbar, "LEFT", -5, 0 )
		castbar.button:SetTemplate( "Default" )
		castbar.button:CreateShadow( "Default" )
		castbar.button:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )

		castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
		castbar.icon:Point( "TOPLEFT", castbar.button, S.Scale( 2 ), S.Scale( -2 ) )
		castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
		castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )

		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	---------------------------------------------------------------------------------------------
	-- boss
	---------------------------------------------------------------------------------------------
	if( unit and unit:find( "boss%d" ) and C["unitframes"].showboss == true ) then
		self:SetAttribute( "type2", "focus" )

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 22 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		health.frequentUpdates = true
		health.colorDisconnected = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end
		health.colorClass = true

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		health.value = S.SetFontString( health, S.SetUserFont() )
		health.value:Point( "LEFT", 2, 0.5 )
		health.PostUpdate = S.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 0, 1 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		Name.frequentUpdates = 0.2
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
		self.Name = Name

		-----------------------
		-- power
		-----------------------
		local power = CreateFrame( "StatusBar", nil, self )
		power:Height( 3 )
		power:Point( "TOPLEFT", health, "BOTTOMLEFT", 85, 0 )
		power:Point( "TOPRIGHT", health, "BOTTOMRIGHT", -9, -3 )
		power:SetStatusBarTexture( normTex )
		power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )

		local powerBorder = CreateFrame( "Frame", nil, power )
		powerBorder:SetPoint( "TOPLEFT", power, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		powerBorder:SetPoint( "BOTTOMRIGHT", power, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		powerBorder:SetTemplate( "Default" )
		powerBorder:CreateShadow( "Default" )
		powerBorder:SetFrameLevel( power:GetFrameLevel() - 1 )
		self.PowerBorder = powerBorder

		power.frequentUpdates = true
		power.colorPower = true
		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		local powerBackground = power:CreateTexture( nil, "BORDER" )
		powerBackground:SetAllPoints( power )
		powerBackground:SetTexture( normTex )
		powerBackground.multiplier = 0.3

		power.value = S.SetFontString( health, S.SetUserFont() )
		power.value:Point( "RIGHT", -2, 0.5 )
		power.PreUpdate = S.PreUpdatePower
		power.PostUpdate = S.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBackground

		-----------------------
		-- buffs, debuffs
		-----------------------
		local buffs = CreateFrame( "Frame", nil, self )
		buffs:SetHeight( 26 )
		buffs:SetWidth( 252 )
		buffs:Point( "TOPRIGHT", self, "TOPLEFT", -5, 2 )
		buffs.size = 26
		buffs.num = 3
		buffs.spacing = 3
		buffs.initialAnchor = "RIGHT"
		buffs["growth-x"] = "LEFT"
		buffs.PostCreateIcon = S.PostCreateAura
		buffs.PostUpdateIcon = S.PostUpdateAura
		self.Buffs = buffs

		local debuffs = CreateFrame( "Frame", nil, self )
		debuffs:SetHeight( 26 )
		debuffs:SetWidth( 200 )
		debuffs:SetPoint( "TOPLEFT", self, "TOPRIGHT", S.Scale( 5 ), 2 )
		debuffs.size = 26
		debuffs.num = 0
		debuffs.spacing = 3
		debuffs.initialAnchor = "LEFT"
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = S.PostCreateAura
		debuffs.PostUpdateIcon = S.PostUpdateAura
		self.Debuffs = debuffs

		-----------------------
		-- alt power bar
		-----------------------
		local AltPowerBar = CreateFrame( "StatusBar", nil, self.Health )
		AltPowerBar:SetFrameLevel( self.Health:GetFrameLevel() + 1 )
		AltPowerBar:Height( 4 )
		AltPowerBar:SetStatusBarTexture( normTex )
		AltPowerBar:GetStatusBarTexture():SetHorizTile( false )
		AltPowerBar:SetStatusBarColor( 1, 0, 0 )

		AltPowerBar:SetPoint( "LEFT")
		AltPowerBar:SetPoint( "RIGHT")
		AltPowerBar:SetPoint( "TOP", self.Health, "TOP" )

		AltPowerBar:SetBackdrop( backdrop )
		AltPowerBar:SetBackdropColor( 0, 0, 0 )

		self.AltPowerBar = AltPowerBar

		self:HookScript( "OnShow", S.updateAllElements )

		-----------------------
		-- castbar
		-----------------------
		local castbar = CreateFrame( "StatusBar", self:GetName().."CastBar", self )
		castbar:SetPoint( "LEFT", 23, -1 )
		castbar:SetPoint( "RIGHT", 0, -1 )
		castbar:SetPoint( "BOTTOM", 0, -21 )

		castbar:SetHeight( 16 )
		castbar:SetStatusBarTexture( normTex )
		castbar:SetFrameLevel( 6 )

		castbar.bg = CreateFrame( "Frame", nil, castbar )
		castbar.bg:SetTemplate( "Default" )
		castbar.bg:CreateShadow( "Default" )
		castbar.bg:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )
		castbar.bg:Point( "TOPLEFT", -2, 2 )
		castbar.bg:Point( "BOTTOMRIGHT", 2, -2 )
		castbar.bg:SetFrameLevel( 5 )

		castbar.time = S.SetFontString( castbar, S.SetUserFont() )
		castbar.time:Point( "RIGHT", castbar, "RIGHT", -4, 1 )
		castbar.time:SetTextColor( 0, 4, 0 )
		castbar.time:SetJustifyH( "RIGHT" )
		castbar.CustomTimeText = S.CustomCastTimeText

		castbar.Text = S.SetFontString( castbar, S.SetUserFont() )
		castbar.Text:Point( "LEFT", castbar, "LEFT", 4, 1 )
		castbar.Text:SetTextColor( 0.3, 0.2, 1 )
		castbar.Text:Width( 100 )
		castbar.Text:Height( 10 )

		castbar.CustomDelayText = S.CustomCastDelayText
		castbar.PostCastStart = S.PostCastStart
		castbar.PostChannelStart = S.PostCastStart

		castbar.button = CreateFrame( "Frame", nil, castbar )
		castbar.button:Height( castbar:GetHeight() + 4 )
		castbar.button:Width( castbar:GetHeight() + 4 )
		castbar.button:Point( "RIGHT", castbar, "LEFT", -5, 0 )
		castbar.button:SetTemplate( "Default" )
		castbar.button:CreateShadow( "Default" )
		castbar.button:SetBackdropBorderColor( unpack( C["media"].bordercolor ) )

		castbar.icon = castbar.button:CreateTexture( nil, "ARTWORK" )
		castbar.icon:Point( "TOPLEFT", castbar.button, S.Scale( 2 ), S.Scale( -2 ) )
		castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
		castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )

		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	---------------------------------------------------------------------------------------------
	-- maintank and mainassist
	---------------------------------------------------------------------------------------------
	if( self:GetParent():GetName():match"TukuiMainTank" or self:GetParent():GetName():match"TukuiMainAssist" ) then
		self:SetAttribute( "type2", "focus" )

		-----------------------
		-- health
		-----------------------
		local health = CreateFrame( "StatusBar", nil, self )
		health:Height( 20 )
		health:SetPoint( "TOPLEFT" )
		health:SetPoint( "TOPRIGHT" )
		health:SetStatusBarTexture( normTex )

		local healthBackground = health:CreateTexture( nil, "BORDER" )
		healthBackground:SetAllPoints()
		healthBackground:SetTexture( 0, 0, 0 )

		local healthBorder = CreateFrame( "Frame", nil, health )
		healthBorder:SetPoint( "TOPLEFT", health, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
		healthBorder:SetPoint( "BOTTOMRIGHT", health, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
		healthBorder:SetTemplate( "Default" )
		healthBorder:CreateShadow( "Default" )
		healthBorder:SetFrameLevel( 2 )
		self.HealthBorder = healthBorder

		self.Health = health
		self.Health.bg = healthBackground

		health.frequentUpdates = true
		if( C["unitframes"].showsmooth == true ) then
			health.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor( .150, .150, .150, 1 )
			healthBackground:SetVertexColor( 0, 0, 0, 1 )
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end

		local Name = health:CreateFontString( nil, "OVERLAY" )
		Name:SetPoint( "CENTER", health, "CENTER", 0, 1 )
		Name:SetJustifyH( "CENTER" )
		Name:SetFont( S.SetUserFont() )
		Name:SetShadowColor( 0, 0, 0 )
		Name:SetShadowOffset( 1.25, -1.25 )
		self:Tag( Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
		self.Name = Name
	end

	return self
end

---------------------------------------------------------------------------------------------
-- spawn unitframes
---------------------------------------------------------------------------------------------
oUF:RegisterStyle( "Tukui", Shared )

local player = oUF:Spawn( "player", "TukuiPlayer" )
local target = oUF:Spawn( "target", "TukuiTarget" )
local tot = oUF:Spawn( "targettarget", "TukuiTargetTarget" )
local pet = oUF:Spawn( "pet", "TukuiPet" )
local focus = oUF:Spawn( "focus", "TukuiFocus" )

player:Size( 230, player.Health:GetHeight() + player.Power:GetHeight() + player.panel:GetHeight() + 6 )
target:Size( 230, target.Health:GetHeight() + target.Power:GetHeight() + target.panel:GetHeight() + 6 )
tot:Size( 130, tot.Health:GetHeight() + tot.Power:GetHeight() + tot.panel:GetHeight() + 6 )
pet:Size( 130, pet.Health:GetHeight() + 2 + pet.panel:GetHeight() + 6 )
focus:Size( 180, 29 )

local f = CreateFrame( "Frame" )
f:RegisterEvent( "PLAYER_ENTERING_WORLD" )
f:SetScript( "OnEvent", function( self, event, addon )
	player:ClearAllPoints()
	target:ClearAllPoints()
	tot:ClearAllPoints()
	pet:ClearAllPoints()
	focus:ClearAllPoints()

	if( IsAddOnLoaded( "Tukui_Raid" ) ) then
		player:Point( "TOP", UIParent, "BOTTOM", -170 , 260 )
		target:Point( "TOP", UIParent, "BOTTOM", 170, 260 )
		tot:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -20 )
		pet:Point( "TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -20 )
		focus:Point( "TOP", UIParent, "BOTTOM", -450, 602 )
	elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
		player:Point( "TOP", UIParent, "BOTTOM", -309 , 350 )
		target:Point( "TOP", UIParent, "BOTTOM", 309, 350 )
		tot:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -25 )
		pet:Point( "TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -25 )
		focus:Point( "TOP", UIParent, "BOTTOM", -450, 602 )
	else
		player:Point( "TOP", UIParent, "BOTTOM", -309 , 350 )
		target:Point( "TOP", UIParent, "BOTTOM", 309, 350 )
		tot:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -25 )
		pet:Point( "TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -25 )
		focus:Point( "TOP", UIParent, "BOTTOM", -450, 602 )	
	end
end )

if( C["unitframes"].pettarget == true ) then
	local pettarget = oUF:Spawn( "pettarget", "TukuiPetTarget" )
	pettarget:SetPoint( "BOTTOMRIGHT", player, "TOPRIGHT", 0, 5 )
	pettarget:Size( 128, 26 )
end

if( C["unitframes"].showfocustarget ) then
	local focustarget = oUF:Spawn( "focustarget", "TukuiFocusTarget" )
	focustarget:SetPoint( "TOP", TukuiFocus, "BOTTOM", 0 , -35 )
	focustarget:Size( 180, 29 )
end

if( C["arena"].unitframes ) then
	local arena = {}
	for i = 1, 5 do
		arena[i] = oUF:Spawn( "arena" .. i, "TukuiArena" .. i )
		if( i == 1 ) then
			arena[i]:SetPoint( "TOP", UIParent, "BOTTOM", 500, 550 )
		else
			arena[i]:SetPoint( "BOTTOM", arena[i - 1], "TOP", 0, 35 )
		end
		arena[i]:Size( 200, 27 )
	end
end

if( C["unitframes"].showboss == true ) then
	for i = 1, MAX_BOSS_FRAMES do
		local t_boss = _G["Boss" .. i .. "TargetFrame"]
		t_boss:UnregisterAllEvents()
		t_boss.Show = S.dummy
		t_boss:Hide()
		_G["Boss" .. i .. "TargetFrame" .. "HealthBar"]:UnregisterAllEvents()
		_G["Boss" .. i .. "TargetFrame" .. "ManaBar"]:UnregisterAllEvents()
	end

	local boss = {}
	for i = 1, MAX_BOSS_FRAMES do
		boss[i] = oUF:Spawn( "boss" .. i, "TukuiBoss" .. i )
		if( i == 1 ) then
			boss[i]:SetPoint( "TOP", UIParent, "BOTTOM", 500, 550 )
		else
			boss[i]:SetPoint( "BOTTOM", boss[i - 1], "TOP", 0, 35 )
		end
		boss[i]:Size( 200, 27 )
	end
end

local assisttank_width = 100
local assisttank_height  = 20
if( C["unitframes"].maintank == true ) then
	local tank = oUF:SpawnHeader( "TukuiMainTank", nil, "raid",
		"oUF-initialConfigFunction", ( [[
			self:SetWidth( %d )
			self:SetHeight( %d )
		]] ):format( assisttank_width, assisttank_height ),
		"showRaid", true,
		"groupFilter", "MAINTANK",
		"yOffset", 7,
		"point", "BOTTOM",
		"template", "oUF_TukuiMtt"
	)
	tank:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 )
end

if( C["unitframes"].mainassist == true ) then
	local assist = oUF:SpawnHeader( "TukuiMainAssist", nil, "raid",
		"oUF-initialConfigFunction", ( [[
			self:SetWidth( %d )
			self:SetHeight( %d )
		]] ):format( assisttank_width, assisttank_height ),
		"showRaid", true,
		"groupFilter", "MAINASSIST",
		"yOffset", 7,
		"point", "BOTTOM",
		"template", "oUF_TukuiMtt"
	)
	if( C["unitframes"].maintank == true ) then
		assist:SetPoint( "TOPLEFT", TukuiMainTank, "BOTTOMLEFT", 2, -50 )
	else
		assist:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 )
	end
end

local party = oUF:SpawnHeader( "oUF_noParty", nil, "party", "showParty", true )

local PET_DISMISS = "PET_DISMISS"
local REPORT_PLAYER = "REPORT_PLAYER"
if( S.myclass == "HUNTER" ) then PET_DISMISS = nil end
if( S.build < 15595 ) then REPORT_PLAYER = nil end

do
	UnitPopupMenus["SELF"] = { "PVP_FLAG", "LOOT_METHOD", "LOOT_THRESHOLD", "OPT_OUT_LOOT_TITLE", "LOOT_PROMOTE", "DUNGEON_DIFFICULTY", "RAID_DIFFICULTY", "RESET_INSTANCES", "RAID_TARGET_ICON", "SELECT_ROLE", "CONVERT_TO_PARTY", "CONVERT_TO_RAID", "LEAVE", "CANCEL" }
	UnitPopupMenus["PET"] = { "PET_PAPERDOLL", "PET_RENAME", "PET_ABANDON", PET_DISMISS, "CANCEL" }
	UnitPopupMenus["PARTY"] = { "MUTE", "UNMUTE", "PARTY_SILENCE", "PARTY_UNSILENCE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "PROMOTE", "PROMOTE_GUIDE", "LOOT_PROMOTE", "VOTE_TO_KICK", "UNINVITE", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	UnitPopupMenus["PLAYER"] = { "WHISPER", "INSPECT", "INVITE", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	if( S.toc < 40300 ) then
		UnitPopupMenus["RAID_PLAYER"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "RAID_LEADER", "RAID_PROMOTE", "RAID_DEMOTE", "LOOT_PROMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
		UnitPopupMenus["RAID"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "RAID_LEADER", "RAID_PROMOTE", "RAID_MAINTANK", "RAID_MAINASSIST", "LOOT_PROMOTE", "RAID_DEMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "CANCEL" }
	else
		UnitPopupMenus["RAID_PLAYER"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "RAID_LEADER", "RAID_PROMOTE", "RAID_DEMOTE", "LOOT_PROMOTE", "VOTE_TO_KICK", "RAID_REMOVE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
		UnitPopupMenus["RAID"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "RAID_LEADER", "RAID_PROMOTE", "RAID_MAINTANK", "RAID_MAINASSIST", "LOOT_PROMOTE", "RAID_DEMOTE", "VOTE_TO_KICK", "RAID_REMOVE", "PVP_REPORT_AFK", "CANCEL" }
	end
	UnitPopupMenus["VEHICLE"] = { "RAID_TARGET_ICON", "VEHICLE_LEAVE", "CANCEL" }
	UnitPopupMenus["TARGET"] = { "RAID_TARGET_ICON", "CANCEL" }
	UnitPopupMenus["ARENAENEMY"] = { "CANCEL" }
	UnitPopupMenus["FOCUS"] = { "RAID_TARGET_ICON", "CANCEL" }
	UnitPopupMenus["BOSS"] = { "RAID_TARGET_ICON", "CANCEL" }
end