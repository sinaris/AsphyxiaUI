local S, C, L = unpack( Tukui )

S.EnableTukuiBoss = function()
	for i = 1, MAX_BOSS_FRAMES do
		local layout = C["asphyxia"].layout
		local self = _G["TukuiBoss" .. i]

		if( layout == "asphyxia" ) then
			---------------------------------------------------------------------------------------------
			-- not needed
			---------------------------------------------------------------------------------------------
			do
				self.shadow:Kill()
				self:SetBackdrop( nil )
			end

			---------------------------------------------------------------------------------------------
			-- health
			---------------------------------------------------------------------------------------------
			do
				self.Health:SetHeight( 18 )
				self.Health:CreateLargeBorder( "", true )
				self.Health.bg:SetTexture( 0, 0, 0 )

				self.Health.value = S.SetFontString( self.Health, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Health.value:Point( "LEFT", self.Health, "LEFT", 2, 1 )
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

				self.Name:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Name:SetParent( self.Health )
				self.Name:SetShadowOffset( 1.25, -1.25 )
				self.Name:ClearAllPoints()
				self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
				self.Name.ClearAllPoints = S.dummy
				self.Name.SetPoint = S.dummy

				self:Tag( self.Name, "[Tukui:getnamecolor][Tukui:nameshort]" )
			end

			---------------------------------------------------------------------------------------------
			-- power
			---------------------------------------------------------------------------------------------
			do
				self.Power:Size( 200, 2 )
				self.Power:CreateLargeBorder( "", true )
				self.Power:ClearAllPoints()
				self.Power:Point( "TOP", self.Health, "BOTTOM", 0, -7 )

				if( C["unitframes"].unicolor == true ) then
					self.Power.colorTapping = true
					self.Power.colorClass = true
					self.Power.colorReaction = true
					self.Power.bg.multiplier = 0.1
				else
					self.Power.colorPower = true
				end

				self.Power.value = S.SetFontString( self.Health, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
				self.Power.value:Point( "RIGHT", self.Health, "RIGHT", 2, 1 )
			end

			---------------------------------------------------------------------------------------------
			-- buffs, debuffs
			---------------------------------------------------------------------------------------------
			do
				self.Buffs:ClearAllPoints()
				self.Buffs:SetPoint( "TOPRIGHT", self, "TOPLEFT", -5, 2 )
				self.Buffs:SetHeight( 31 )
				self.Buffs:SetWidth( 102 )
				self.Buffs.size = 31
				self.Buffs.num = 3
				self.Buffs.spacing = 3
				self.Buffs.initialAnchor = "RIGHT"
				self.Buffs.PostCreateIcon = S.PostCreateAura
				self.Buffs.PostUpdateIcon = S.PostUpdateAura
				self.Buffs.ClearAllPoints = S.dummy
				self.Buffs.SetPoint = S.dummy
				self.Buffs.Point = S.dummy

				self.Debuffs:ClearAllPoints()
				self.Debuffs:Point( "TOPLEFT", self, "TOPRIGHT", 5, 2 )
				self.Debuffs:SetHeight( 31 )
				self.Debuffs:SetWidth( 102 )
				self.Debuffs.size = 31
				self.Debuffs.num = 3
				self.Debuffs.spacing = 3
				self.Debuffs["growth-x"] = "RIGHT"
				self.Debuffs.initialAnchor = "LEFT"
				self.Debuffs.PostCreateIcon = S.PostCreateAura
				self.Debuffs.PostUpdateIcon = S.PostUpdateAura
				self.Debuffs.ClearAllPoints = S.dummy
				self.Debuffs.SetPoint = S.dummy
				self.Debuffs.Point = S.dummy
			end

			---------------------------------------------------------------------------------------------
			-- castbar
			---------------------------------------------------------------------------------------------
			do
				self.Castbar:ClearAllPoints()
				self.Castbar:SetHeight( 16 )
				self.Castbar:SetPoint( "RIGHT", 0, 0 )
				self.Castbar:SetPoint( "LEFT", 23, 0 )
				self.Castbar:SetPoint( "BOTTOM", 0, -30 )

				self.Castbar.PostCastStart = S.PostCastStart
				self.Castbar.PostChannelStart = S.PostCastStart

				self.Castbar.time:SetFont( C["media"].pixelfont, 12, "MONOCHROMEOUTLINE" )
				self.Castbar.time:SetParent( self.Castbar )
				self.Castbar.time:SetTextColor( 0, 4, 0 )
				self.Castbar.time:ClearAllPoints()
				self.Castbar.time:SetPoint( "RIGHT", self.Castbar, "RIGHT", -4, 0 )
				self.Castbar.time.ClearAllPoints = S.dummy
				self.Castbar.time.SetPoint = S.dummy

				self.Castbar.Text:SetFont( C["media"].pixelfont, 12, "MONOCHROMEOUTLINE" )
				self.Castbar.Text:SetParent( self.Castbar )
				self.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )
				self.Castbar.Text:ClearAllPoints()
				self.Castbar.Text:SetPoint( "LEFT", self.Castbar, "LEFT", 4, 0 )
				self.Castbar.Text.ClearAllPoints = S.dummy
				self.Castbar.Text.SetPoint = S.dummy

				self.Castbar.button:ClearAllPoints()
				self.Castbar.button:Point( "RIGHT", self.Castbar, "LEFT", -5, 0 )
			end

			---------------------------------------------------------------------------------------------
			-- size, position
			---------------------------------------------------------------------------------------------
			do
				self:Size( 200, 18 )
				self:ClearAllPoints()
				if( i == 1 ) then
					self:SetPoint( "TOP", UIParent, "BOTTOM", 500, 550 )
				else
					self:SetPoint( "BOTTOM", _G["TukuiBoss" .. i - 1]  , "TOP", 0, 37 )
				end
			end
		elseif( layout == "asphyxia2" ) then
		
		elseif( layout == "smelly" ) then
		
		else
		
		end
	end
end