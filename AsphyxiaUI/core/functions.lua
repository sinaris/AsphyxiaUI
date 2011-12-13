local S, C, L = unpack( Tukui )

S.buttonsize = S.Scale( C["actionbar"].buttonsize )
S.petbuttonsize = S.Scale( C["actionbar"].petbuttonsize )
S.stancebuttonsize = S.Scale( C["actionbar"].stancebuttonsize )
S.buttonspacing = S.Scale( C["actionbar"].buttonspacing )

local dr, dg, db = unpack( C["media"].datatextcolor2 )
S.datacolor = ( "|cff%.2x%.2x%.2x" ):format( dr * 255, dg * 255, db * 255 )

S.DataBarPoint = function( p, obj )
	obj:SetPoint( "TOPRIGHT", S.databars[p], "TOPRIGHT", -2, -2 )
	obj:SetPoint( "BOTTOMLEFT", S.databars[p], "BOTTOMLEFT", 2, 2 )
end

S.DataBarTooltipAnchor = function( barNum )
	local xoff = -S.databars[barNum]:GetWidth()
	local yoff = S.Scale(-5)
	
	if( C["databars"]["settings"].vertical == true ) then
		xoff = S.Scale( 5 )
		yoff = S.databars[barNum]:GetHeight()
	end

	return xoff, yoff
end

local ShortValue = function( v )
	if( v <= 999 ) then return v end
	if( v >= 1000000 ) then
		local value = string.format( "%.1fm", v / 1000000 )
		return value
	elseif( v >= 1000 ) then
		local value = string.format( "%.1fk", v / 1000 )
		return value
	end
end

S.PostCastStart = function( self, unit, name, rank, castid )
	if( unit == "vehicle" ) then unit = "player" end

	if( name == "Opening" ) then
		self.Text:SetText( "Opening" )
	end

	if( self.interrupt and unit ~= "player" ) then
		if( UnitCanAttack( "player", unit ) ) then
			self:SetStatusBarColor( unpack( C["castbar"].nointerruptcolor ) )
		else
			self:SetStatusBarColor( unpack( C["castbar"].nointerruptcolor ) )
		end
	else
		if( C["castbar"].classcolor and ( unit == "player" or unit == "target" ) ) then
			local color = RAID_CLASS_COLORS[S.myclass]
			self:SetStatusBarColor( color.r, color.g, color.b )
		else
			self:SetStatusBarColor( unpack( C["castbar"].castbarcolor ) )
		end
	end
end

hooksecurefunc( S, "PostUpdatePower", function( power, unit, min, max )
	local self = power:GetParent()
	local pType, pToken = UnitPowerType(unit)
	local color = S.UnitColor.power[pToken]

	if color then
		power.value:SetTextColor( color[1], color[2], color[3] )
	end
end )

function S.update_alpha( self )
	if( self.parent:GetAlpha() == 0 ) then 
		self.parent:Hide()
		self:Hide()
	end
end

function S.fadeOut( self ) 
	UIFrameFadeOut( self, .4, 1, 0 ) 
	self.frame:Show() 
end

function S.fadeIn( p )
	p.frame = CreateFrame( "Frame", nil, p )
	p.frame:Hide()
	p.frame.parent = p
	p.frame:SetScript( "OnUpdate", S.update_alpha )
	p:SetScript( "OnShow", function() 
		p.frame:Hide() 
		UIFrameFadeIn( p, .4, 0, 1 )
	end )
	p.fadeOut = S.fadeOut
end