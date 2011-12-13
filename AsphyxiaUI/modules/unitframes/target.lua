local S, C, L = unpack( Tukui )

S.EnableTukuiTarget = function()
	local layout = C["asphyxia"].layout
	local self = _G["TukuiTarget"]

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

			self.Name:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
			self.Name:SetParent( self.Health )
			self.Name:SetShadowOffset( 1.25, -1.25 )
			self.Name:ClearAllPoints()
			self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
			self.Name.ClearAllPoints = S.dummy
			self.Name.SetPoint = S.dummy

			self:Tag( self.Name, "[Tukui:getnamecolor][Tukui:nameshort] [Tukui:diffcolor][level] [shortclassification]" )
		end

		---------------------------------------------------------------------------------------------
		-- power
		---------------------------------------------------------------------------------------------
		do
			self.Power:Size( 230, 2 )
			self.Power:CreateLargeBorder( "", true )
			self.Power:ClearAllPoints()
			self.Power:Point( "TOPLEFT", self.Health, "BOTTOMLEFT", 0, -7 )

			if( C["unitframes"].unicolor == true ) then
				self.Power.colorTapping = true
				self.Power.colorClass = true
				self.Power.colorReaction = true
				self.Power.bg.multiplier = 0.1
			else
				self.Power.colorPower = true
			end

			self.Power.value = S.SetFontString( self.Health, C["media"].pixelfont, 12, "MONOCHROMEOUTLINE" )
			self.Power.value:Point( "LEFT", self.Health, "LEFT", 4, 1 )

			self.Power.PreUpdate = S.PreUpdatePower
			self.Power.PostUpdate = S.PostUpdatePower
		end

		---------------------------------------------------------------------------------------------
		-- classicons
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].classicon == true ) then
				local classicon = CreateFrame( "Frame", self:GetName() .. "_ClassIconBorder", self )
				classicon:CreatePanel( "Default", 30, 30, "TOPLEFT", self.Health, "TOPRIGHT", 5, 2 )
				classicon:CreateShadow( "Default" )

				local class = classicon:CreateTexture( self:GetName() .. "_ClassIcon", "ARTWORK" )
				class:Point( "TOPLEFT", 2, -2 )
				class:Point( "BOTTOMRIGHT", -2, 2 )
				
				self.ClassIcon = class
				self:EnableElement( "ClassIcon" )
			end
		end

		---------------------------------------------------------------------------------------------
		-- portrait
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].charportrait == true ) then
				self.Portrait:ClearAllPoints()
				self.Portrait:SetAllPoints( TukuiTarget.Health )
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
			if( C["unitframes"].targetauras == true ) then
				self.Buffs:ClearAllPoints()
				self.Buffs:SetPoint( "TOPLEFT", self, "TOPLEFT", -2, 32 )
				self.Buffs:SetHeight( 26 )
				self.Buffs:SetWidth( 252 )
				self.Buffs.size = 27.5
				self.Buffs.num = 8
				self.Buffs.spacing = 2
				self.Buffs.initialAnchor = "TOPLEFT"
				self.Buffs.PostCreateIcon = S.PostCreateAura
				self.Buffs.PostUpdateIcon = S.PostUpdateAura
				self.Buffs.ClearAllPoints = S.dummy
				self.Buffs.SetPoint = S.dummy
				self.Buffs.Point = S.dummy

				self.Debuffs:ClearAllPoints()
				self.Debuffs:Point( "BOTTOMLEFT", self.Buffs, "TOPLEFT", -2, 2 )
				self.Debuffs:SetHeight( 26 )
				self.Debuffs:SetWidth( 252 )
				self.Debuffs.size = 26
				self.Debuffs.num = 24
				self.Debuffs.spacing = 2
				self.Debuffs["growth-y"] = "UP"
				self.Debuffs["growth-x"] = "LEFT"
				self.Debuffs.initialAnchor = "TOPRIGHT"
				self.Debuffs.PostCreateIcon = S.PostCreateAura
				self.Debuffs.PostUpdateIcon = S.PostUpdateAura
				self.Debuffs.ClearAllPoints = S.dummy
				self.Debuffs.SetPoint = S.dummy
				self.Debuffs.Point = S.dummy
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
					self.Castbar:SetWidth( 225 - 28 )

					self.Castbar.button:ClearAllPoints()
					self.Castbar.button:Size( 24 )
					self.Castbar.button:SetPoint( "RIGHT", self.Castbar, "LEFT", -5, 0 )
				else
					self.Castbar:SetWidth( 246 )
				end
				self.Castbar:SetHeight( 20 )
				self.Castbar:Point( "TOPRIGHT", self, "BOTTOMRIGHT", 0, -14 )
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

				self.Castbar.PostCastStart = S.PostCastStart
				self.Castbar.PostChannelStart = S.PostCastStart
			end
		end

		---------------------------------------------------------------------------------------------
		-- combatfeedback
		---------------------------------------------------------------------------------------------
		do
			if( C["unitframes"].combatfeedback == true ) then
				self.CombatFeedbackText:SetFont( C["media"].pixelfont, C["datatext"].fontsize + 1, "MONOCHROMEOUTLINE" )
				self.CombatFeedbackText.colors = {
					DAMAGE			= { 0.69, 0.31, 0.31 },
					CRUSHING		= { 0.69, 0.31, 0.31 },
					CRITICAL		= { 0.69, 0.31, 0.31 },
					GLANCING		= { 0.69, 0.31, 0.31 },
					STANDARD		= { 0.84, 0.75, 0.65 },
					IMMUNE			= { 0.84, 0.75, 0.65 },
					ABSORB			= { 0.84, 0.75, 0.65 },
					BLOCK			= { 0.84, 0.75, 0.65 },
					RESIST			= { 0.84, 0.75, 0.65 },
					MISS			= { 0.84, 0.75, 0.65 },
					HEAL			= { 0.33, 0.59, 0.33 },
					CRITHEAL		= { 0.33, 0.59, 0.33 },
					ENERGIZE		= { 0.31, 0.45, 0.63 },
					CRITENERGIZE	= { 0.31, 0.45, 0.63 },
				}
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
				local frame = _G["TukuiTarget"]
				if( IsAddOnLoaded( "Tukui_Raid" ) ) then
					frame:Point( "TOP", UIParent, "BOTTOM", 170, 260 )
				elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
					frame:Point( "TOP", UIParent, "BOTTOM", 309, 350 )
				else
					frame:Point( "TOP", UIParent, "BOTTOM", 309, 350 )
				end
			end )
		end
	elseif( layout == "asphyxia2" ) then
	
	elseif( layout == "smelly" ) then
	
	else
	
	end
end