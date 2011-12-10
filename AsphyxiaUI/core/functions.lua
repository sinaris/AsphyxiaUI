local S, C, L = unpack( Tukui )

local ShortValue = function(v)
	if v <= 999 then return v end
	if v >= 1000000 then
		local value = string.format("%.1fm", v/1000000)
		return value
	elseif v >= 1000 then
		local value = string.format("%.1fk", v/1000)
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
		power.value:SetTextColor(color[1], color[2], color[3])
	end
end )