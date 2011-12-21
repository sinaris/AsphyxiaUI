local S, C, L = unpack( Tukui )

if not IsAddOnLoaded( "Omen" ) or not C["Addon_Skins"].Omen == true then return end

if( TukuiThreatBar ) then TukuiThreatBar:Kill() end

local Omen = LibStub( "AceAddon-3.0" ):GetAddon( "Omen" )
local borderWidth = S.Scale( 2, 2 )

Omen.UpdateBarTextureSettings_ = Omen.UpdateBarTextureSettings
Omen.UpdateBarTextureSettings = function( self )
	for i, v in ipairs( self.Bars ) do
		v.texture:SetTexture( C["media"].normTex )
	end
end

Omen.UpdateBarLabelSettings_ = Omen.UpdateBarLabelSettings
Omen.UpdateBarLabelSettings = function( self )
	self:UpdateBarLabelSettings_()
	for i, v in ipairs( self.Bars ) do
		v.Text1:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
		v.Text2:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
		v.Text3:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	end
end

Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
Omen.UpdateTitleBar = function( self )
	Omen.db.profile.Scale = 1
	Omen.db.profile.Background.EdgeSize = 1
	Omen.db.profile.Background.BarInset = borderWidth
	Omen.db.profile.TitleBar.UseSameBG = true
	self:UpdateTitleBar_()
	self.Title:SetHeight( 23 )
	self.TitleText:SetFont( C["media"].pixelfont, 12, "MONOCHROMEOUTLINE" )
	self.TitleText:ClearAllPoints()
	self.TitleText:SetPoint( "CENTER" )
	self.BarList:SetPoint( "TOPLEFT", self.Title, "BOTTOMLEFT", 0, -1 )
end

Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
Omen.UpdateBackdrop = function( self )
	Omen.db.profile.Scale = 1
	Omen.db.profile.Background.EdgeSize = 1
	Omen.db.profile.Background.BarInset = borderWidth
	self:UpdateBackdrop_()
	self.BarList:SetTemplate( "Transparent" )
	self.Title:SetTemplate( "Transparent" )
	self.BarList:SetPoint( "TOPLEFT", self.Title, "BOTTOMLEFT", 0, -1 )
end

local omen_mt = getmetatable( Omen.Bars )
local oldidx = omen_mt.__index
omen_mt.__index = function( self, barID )
	local bar = oldidx( self, barID )
	Omen:UpdateBarTextureSettings()
	Omen:UpdateBarLabelSettings()
	return bar
end

Omen.db.profile.Bar.Spacing = 2

Omen:UpdateBarTextureSettings()
Omen:UpdateBarLabelSettings()
Omen:UpdateTitleBar()
Omen:UpdateBackdrop()
Omen:ReAnchorBars()
Omen:ResizeBars()