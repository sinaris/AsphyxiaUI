local S, C, L = unpack( select( 2, ... ) )

local frame = CreateFrame( "Frame", "TukuiAuras" )
frame.content = {}

local icon
local faction = S.myfaction
local alliance = [[Interface\Icons\Pvpcurrency-honor-alliance]]
local horde = [[Interface\Icons\Pvpcurrency-honor-horde]]
local flash = C["auras"].flash
local filter = C["auras"].consolidate

if( faction == "Horde" ) then
	icon = horde
else
	icon = alliance
end

local StartStopFlash = function( self, timeLeft )
	if( timeLeft < 31 ) then
		if( not self:IsPlaying() ) then
			self:Play()
		end
	elseif( self:IsPlaying() ) then
		self:Stop()
	end
end

local OnUpdate = function( self, elapsed )
	local timeLeft

	if( self.offset ) then
		local expiration = select( self.offset, GetWeaponEnchantInfo() )
		if( expiration ) then
			timeLeft = expiration / 1e3
		else
			timeLeft = 0
		end
	else
		timeLeft = self.timeLeft - elapsed
	end

	self.timeLeft = timeLeft

	if( timeLeft <= 0 ) then
		self.timeLeft = nil

		self.Duration:SetText( "" )
		return self:SetScript( "OnUpdate", nil )
	else
		local text = S.FormatTime( timeLeft )

		if( timeLeft < 60.5 ) then
			if flash then
				StartStopFlash( self.Animation, timeLeft )
			end

			if( timeLeft < 5 ) then
				self.Duration:SetTextColor( 255 / 255, 20 / 255, 20 / 255 )
			else
				self.Duration:SetTextColor( 255 / 255, 165 / 255, 0 / 255 )
			end
		else
			self.Duration:SetTextColor( .9, .9, .9 )
		end

		self.Duration:SetText( text )
	end
end

local UpdateAura = function( self, index )
	local name, rank, texture, count, dtype, duration, expirationTime, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff = UnitAura( self:GetParent():GetAttribute( "unit" ), index, self.filter )
	local consolidate = self.consolidate
	if( name ) then
		if( duration > 0 and expirationTime and not consolidate ) then
			local timeLeft = expirationTime - GetTime()
			if( not self.timeLeft ) then
				self.timeLeft = timeLeft
				self:SetScript( "OnUpdate", OnUpdate )
			else
				self.timeLeft = timeLeft
			end

			if( flash ) then
				StartStopFlash( self.Animation, timeLeft )
			end
		else
			if( flash ) then
				self.Animation:Stop()
			end
			self.timeLeft = nil
			self.Duration:SetText( "" )
			self:SetScript( "OnUpdate", nil )
		end

		if( count > 1 ) then
			self.Count:SetText( count )
		else
			self.Count:SetText( "" )
		end

		if( self.filter == "HARMFUL" ) then
			local color = DebuffTypeColor[dtype or "none"]
			self:SetBackdropBorderColor( color.r * 3 / 5, color.g * 3 / 5, color.b * 3 / 5 )
		end

		self.Icon:SetTexture( texture )
	end
end

local UpdateTempEnchant = function( self, slot )
	self.Icon:SetTexture( GetInventoryItemTexture( "player", slot ) )

	local offset
	local weapon = self:GetName():sub( -1 )
	if( weapon:match( "1" ) ) then
		offset = 2
	elseif( weapon:match( "2" ) ) then
		offset = 5
	elseif( weapon:match( "3" ) ) then
		offset = 8
	end

	local expiration = select( offset, GetWeaponEnchantInfo() )
	if( expiration ) then
		self.offset = offset
		self:SetScript( "OnUpdate", OnUpdate )
	else
		self.offset = nil
		self.timeLeft = nil
		self:SetScript( "OnUpdate", nil )
	end
end

local OnAttributeChanged = function( self, attribute, value )
	if( attribute == "index" ) then
		if( filter ) then
			local consolidate = self:GetName():match( "Consolidate" )
			if(  consolidate ) then
				self.consolidate = true
			end
		end
		
		return UpdateAura( self, value )
	elseif( attribute == "target-slot" ) then
		return UpdateTempEnchant( self, value )
	end
end

local Skin = function( self )
	local proxy = self:GetName():sub( -11 ) == "ProxyButton"
	local Icon = self:CreateTexture( nil, "BORDER" )
	Icon:SetTexCoord( .07, .93, .07, .93 )
	Icon:Point( "TOPLEFT", 2, -2 )
	Icon:Point( "BOTTOMRIGHT", -2, 2 )
	self.Icon = Icon

	local Count = self:CreateFontString( nil, "OVERLAY" )
	Count:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	Count:SetPoint( "TOP", self, 1, -4 )
	self.Count = Count

	if( not proxy ) then
		local Duration = self:CreateFontString( nil, "OVERLAY" )
		Duration:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
		Duration:SetPoint( "BOTTOM", 0, -1 )
		self.Duration = Duration

		if( flash ) then
			local Animation = self:CreateAnimationGroup()
			Animation:SetLooping( "BOUNCE" )

			local FadeOut = Animation:CreateAnimation( "Alpha" )
			FadeOut:SetChange( -.5 )
			FadeOut:SetDuration( .4 )
			FadeOut:SetSmoothing( "IN_OUT" )

			self.Animation = Animation
		end

		self:SetScript( "OnAttributeChanged", OnAttributeChanged )

		self.filter = self:GetParent():GetAttribute( "filter" )
	else
		local Overlay = self:CreateTexture( nil, "OVERLAY" )
		local x = self:GetWidth()
		local y = self:GetHeight()
		Overlay:SetTexture( icon )
		Overlay:SetPoint( "CENTER" )
		Overlay:Size( x - 2, y - 2 )
		Overlay:SetTexCoord( .07, .93, .07, .93 )
		self.Overlay = Overlay
	end

	self:SetTemplate( "Default" )
	self:CreateShadow( "Default" )
end

frame:SetScript( "OnEvent", function( self, event, ... )
	self[event]( self, event, ... )
end )

function frame:PLAYER_ENTERING_WORLD()
	for _, header in next, frame.content do
		local child = header:GetAttribute( "child1" )
		local i = 1
		while( child ) do
			UpdateAura( child, child:GetID() )

			i = i + 1
			child = header:GetAttribute( "child" .. i )
		end
	end
end
frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )

function frame:VARIABLES_LOADED()
	for _, header in next, frame.content do
		if( header == TukuiAurasPlayerBuffs ) then
			local buffs = TukuiAurasPlayerBuffs
			local debuffs = TukuiAurasPlayerDebuffs
			local position = buffs:GetPoint()
			if( position:match( "LEFT" ) ) then
				buffs:SetAttribute( "xOffset", 35 )
				buffs:SetAttribute( "point", position )
				debuffs:SetAttribute( "xOffset", 35 )
				debuffs:SetAttribute( "point", position )
			end
		end
	end
end
frame:RegisterEvent( "VARIABLES_LOADED" )

for frame, func in next, {
	Skin = Skin,
	Update = Update,
} do
	TukuiAuras[frame] = func
end