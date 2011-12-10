local S, C, L = unpack( Tukui )

S.EnableTukuiPlayer = function()
	local layout = C["asphyxia"].layout
	local self = _G["TukuiPlayer"]

	if( layout == "asphyxia" ) then
		---------------------------------------------------------------------------------------------
		-- not needed
		---------------------------------------------------------------------------------------------
		do
			self.panel:Kill()
			self.shadow:Kill()
			self:SetBackdrop( nil )
		end

		---------------------------------------------------------------------------------------------
		-- health
		---------------------------------------------------------------------------------------------
		do
			self.Health:SetHeight( 26 )
			self.Health:CreateLargeBorder( "", true )
			self.Health.bg:SetTexture( 0, 0, 0 )

			self.Health.value = S.SetFontString( self.Health, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			self.Health.value:Point( "RIGHT", self.Health, "RIGHT", -4, 1 )
			self.Health.PostUpdate = S.PostUpdateHealth

			if( C["unitframes"].unicolor == true ) then
				self.Health.colorTapping = false
				self.Health.colorDisconnected = false
				self.Health.colorClass = false
				self.Health:SetStatusBarColor( .150, .150, .150, 1 )
				self.Health.bg:SetVertexColor( 0, 0, 0, 1 )		
			else
				self.Health.colorDisconnected = true
				self.Health.colorTapping = true	
				self.Health.colorClass = true
				self.Health.colorReaction = true			
			end
		end

		---------------------------------------------------------------------------------------------
		-- power
		---------------------------------------------------------------------------------------------
		do
			self.Power:Size( 230, 2 )
			self.Power:CreateLargeBorder( "", true )
			self.Power:ClearAllPoints()
			self.Power:Point( "TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -7 )

			self.Power.value = S.SetFontString( self.Power, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			self.Power.value:Point( "LEFT", self.Health, "LEFT", 4, 1 )

			if( C["unitframes"].unicolor == true ) then
				self.Power.colorTapping = true
				self.Power.colorClass = true
				self.Power.colorReaction = true
				self.Power.bg.multiplier = 0.1
			else
				self.Power.colorPower = true
			end
		end

		---------------------------------------------------------------------------------------------
		-- classicons
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].classicon == true ) then
				local classicon = CreateFrame( "Frame", self:GetName() .. "_ClassIconBorder", self )
				classicon:CreatePanel( "Default", 30, 30, "TOPRIGHT", self.Health, "TOPLEFT", -5, 2 )
				classicon:CreateShadow( "Default" )

				local class = classicon:CreateTexture( self:GetName() .. "_ClassIcon", "ARTWORK" )
				class:Point( "TOPLEFT", 2, -2 )
				class:Point( "BOTTOMRIGHT", -2, 2 )
				
				self.ClassIcon = class
				self:EnableElement( "ClassIcon" )
			end
		end

		---------------------------------------------------------------------------------------------
		-- experience and reputation bar
		---------------------------------------------------------------------------------------------
		do
			if( S.level ~= MAX_PLAYER_LEVEL ) then
				self.Experience:ClearAllPoints()
				self.Experience:SetStatusBarColor( 0, 0.4, 1, .8 )
				self.Experience:Size( TukuiChatBackgroundLeft:GetWidth() - 4, 2 )
				self.Experience:Point( "BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 5 )
				self.Experience:CreateLargeBorder( "Transparent", true )
				self.Experience:SetAlpha( 1 )
				self.Experience:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

				self.Experience.Text = self.Experience:CreateFontString( nil, "OVERLAY" )
				self.Experience.Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Experience.Text:SetPoint( "CENTER", 0, 1 )
				self.Experience.Text:SetShadowOffset( S.mult, -S.mult )
				self.Experience.Text = self.Experience.Text
				self.Experience.PostUpdate = S.ExperienceText

				self.Resting:ClearAllPoints()
				self.Resting:SetPoint("BOTTOMRIGHT", self, "TOPLEFT", 10 -4)
			end

			if( S.level == MAX_PLAYER_LEVEL ) then
				self.Reputation:ClearAllPoints()
				self.Reputation:SetStatusBarColor( 0, 0.4, 1, .8 )
				self.Reputation:Size( TukuiChatBackgroundLeft:GetWidth() - 4, 2 )
				self.Reputation:Point( "BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 5 )
				self.Reputation:CreateLargeBorder( "Transparent", true )
				self.Reputation:SetAlpha( 1 )
				self.Reputation:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

				self.Reputation.Text = self.Reputation:CreateFontString( nil, "OVERLAY" )
				self.Reputation.Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Reputation.Text:SetPoint( "CENTER", 0, 1 )
				self.Reputation.Text:SetShadowOffset( S.mult, -S.mult )
				self.Reputation.Text:Show()
				self.Reputation.PostUpdate = S.UpdateReputation
				self.Reputation.Text = self.Reputation.Text
				self.Reputation.PostUpdate = S.UpdateReputationColor
			end
		end

		---------------------------------------------------------------------------------------------
		-- classbar
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].classbar == true ) then
				if( S.myclass == "DRUID" ) then
				
				end

				if( S.myclass == "WARLOCK" or S.myclass == "PALADIN" ) then
				
				end

				if( S.myclass == "DEATHKNIGHT" ) then
					self.Runes:ClearAllPoints()
					self.Runes:Point( "BOTTOMLEFT", self, "TOPLEFT", 0, 7 )
					self.Runes:Size( 230, 2 )
					self.Runes:CreateLargeBorder( "", true )

					for i = 1, 6 do
						self.Runes[i]:SetHeight( 2 )
						if( i == 1 ) then
							self.Runes[i]:SetWidth( 35 )
						else
							self.Runes[i]:SetWidth( 228 / 6 )
						end

						if( i == 1 ) then
							self.Runes[i]:Point( "BOTTOMLEFT", self, "TOPLEFT", 0, 7 )
						else
							self.Runes[i]:Point( "TOPLEFT", self.Runes[i - 1], "TOPRIGHT", 1, 0 )
						end
					end
				end

				if( S.myclass == "SHAMAN" ) then
				
				end
			end
		end

		---------------------------------------------------------------------------------------------
		-- portrait
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].charportrait == true ) then
				self.Portrait:ClearAllPoints()
				self.Portrait:SetAllPoints( TukuiPlayer.Health )
				self.Portrait:SetFrameLevel( self.Health:GetFrameLevel() )
				self.Portrait:SetAlpha( 0.15 )
				self.Portrait.SetAlpha = S.dummy
				self.Health:SetPoint( "TOPLEFT", 0, 0 )
				self.Health:SetPoint( "TOPRIGHT" )
			end
		end

		---------------------------------------------------------------------------------------------
		-- buffs, debuffs
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].playerauras == true ) then
				if( ( S.myclass == "SHAMAN" or S.myclass == "DEATHKNIGHT" or S.myclass == "PALADIN" or S.myclass == "WARLOCK" ) and ( C["unitframes"].playerauras ) ) then
					self.Buffs:ClearAllPoints()
					self.Buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", 0, 38 )
				else
					self.Buffs:ClearAllPoints()
					self.Buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", -2, 32 )
				end
			end
		end

		---------------------------------------------------------------------------------------------
		-- castbar
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].unitcastbar == true ) then
				self.Castbar:ClearAllPoints()
				self.Castbar.bg:SetVertexColor( .05, .05, .05 )

				if( C["unitframes"].cbicons == true ) then
					self.Castbar:SetWidth( TukuiBar1:GetWidth() - 31 )

					self.Castbar.button:ClearAllPoints()
					self.Castbar.button:Size( 24 )
					self.Castbar.button:SetPoint( "RIGHT", self.Castbar, "LEFT", -5, 0 )
				else
					self.Castbar:SetWidth( TukuiBar1:GetWidth() - 4 )
				end
				self.Castbar:SetHeight( 20 )
				self.Castbar:Point( "BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, 5 )
				self.Castbar:CreateLargeBorder( "", true )

				self.Castbar.time:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Castbar.time:SetParent( self.Castbar )
				self.Castbar.time:ClearAllPoints()
				self.Castbar.time:Point( "RIGHT", self.Castbar.bg, "RIGHT", -4, 0 )
				self.Castbar.time:SetTextColor( 0, 4, 0 )
				self.Castbar.time:SetJustifyH( "RIGHT" )
				self.Castbar.time.ClearAllPoints = S.dummy
				self.Castbar.time.SetPoint = S.dummy

				self.Castbar.Text:SetFont( C["media"].pixelfont, 12, "MONOCHROMEOUTLINE" )
				self.Castbar.Text:SetParent( self.Castbar )
				self.Castbar.Text:ClearAllPoints()
				self.Castbar.Text:Point( "LEFT", self.Castbar.bg, "LEFT", 4, 0 )
				self.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )
				self.Castbar.Text:Width( 100 )
				self.Castbar.Text:Height( 10 )
				self.Castbar.Text.ClearAllPoints = S.dummy
				self.Castbar.Text.SetPoint = S.dummy

				if( C["unitframes"].cblatency == true ) then
					self.Castbar.safezone:SetVertexColor( 0.8, 0.2, 0.2, 0.75 )
				end

				self.Castbar.PostCastStart = S.PostCastStart
				self.Castbar.PostChannelStart = S.PostCastStart
			end
		end

		---------------------------------------------------------------------------------------------
		-- size, position
		---------------------------------------------------------------------------------------------
		do
			self:Size( 230, 26 )
			self:ClearAllPoints()
			local f = CreateFrame( "Frame" )
			f:RegisterEvent( "PLAYER_ENTERING_WORLD" )
			f:SetScript( "OnEvent", function( self, event, addon )
				local frame = _G["TukuiPlayer"]
				if( IsAddOnLoaded( "Tukui_Raid" ) ) then
					frame:Point( "TOP", UIParent, "BOTTOM", -170 , 260 )
				elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
					frame:Point( "TOP", UIParent, "BOTTOM", -309 , 350 )
				else
					frame:Point( "TOP", UIParent, "BOTTOM", -309 , 350 )
				end
			end )
		end
	elseif( layout == "asphyxia2" ) then
	
	elseif( layout == "smelly" ) then
	
	else
	
	end
end