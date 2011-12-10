local S, C, L = unpack( Tukui )

S.EnableTukuiTargetTarget = function()
	local layout = C["asphyxia"].layout
	local self = _G["TukuiTargetTarget"]

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
			self.Health:SetHeight( 15 )
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

			self:Tag( self.Name, "[Tukui:getnamecolor][Tukui:namemedium]" )
		end

		---------------------------------------------------------------------------------------------
		-- size, position
		---------------------------------------------------------------------------------------------
		do
			self:Size( 130, 15 )
			self:ClearAllPoints()
			local f = CreateFrame( "Frame" )
			f:RegisterEvent( "PLAYER_ENTERING_WORLD" )
			f:SetScript( "OnEvent", function( self, event, addon )
				local frame = _G["TukuiTargetTarget"]
				if( IsAddOnLoaded( "Tukui_Raid" ) ) then
					frame:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -49 )
				elseif( IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
					frame:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -25 )
				else
					frame:Point( "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -25 )
				end
			end )
		end
	elseif( layout == "asphyxia2" ) then
	
	elseif( layout == "smelly" ) then
	
	else
	
	end
end