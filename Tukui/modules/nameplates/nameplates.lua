local S, C, L = unpack( select( 2, ... ) )

if( C["nameplate"].enable ~= true ) then return end

local TEXTURE = C["media"].normTex
local FONT = C["media"].pixelfont
local FONTSIZE = 10
local FONTFLAG = "MONOCHROMEOUTLINE"
local hpHeight = 12
local hpWidth = 110
local iconSize = 25
local cbHeight = 5
local cbWidth = 110
local blankTex = C["media"].blank
local OVERLAY = [=[Interface\TargetingFrame\UI-TargetingFrame-Flash]=]
local numChildren = -1
local frames = {}
local noscalemult = S.mult * C["general"].uiscale

if( C["nameplate"].showhealth ~= true ) then
	hpHeight = 7
	iconSize = 20
end

local NamePlates = CreateFrame( "Frame", "TukuiNamePlates", UIParent )
NamePlates:SetScript( "OnEvent", function( self, event, ... ) self[event]( self, ... ) end )
if( C["nameplate"].trackdebuffs == true or C["nameplate"].trackcc == true ) then
	NamePlates:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
end

local function QueueObject( parent, object )
	parent.queue = parent.queue or {}
	parent.queue[object] = true
end

local function HideObjects( parent )
	for object in pairs( parent.queue ) do
		if( object:GetObjectType() == "Texture" ) then
			object:SetTexture(nil)
			object.SetTexture = S.dummy
		elseif( object:GetObjectType() == "FontString" ) then
			object.ClearAllPoints = S.dummy
			object.SetFont = S.dummy
			object.SetPoint = S.dummy
			object:Hide()
			object.Show = S.dummy
			object.SetText = S.dummy
			object.SetShadowOffset = S.dummy
		else
			object:Hide()
			object.Show = S.dummy
		end
	end
end

local function CreateVirtualFrame( parent, point )
	if( point == nil ) then point = parent end

	if( point.backdrop ) then return end
	parent.backdrop = parent:CreateTexture( nil, "BORDER" )
	parent.backdrop:SetDrawLayer( "BORDER", -8 )
	parent.backdrop:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 3, noscalemult * 3 )
	parent.backdrop:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", noscalemult * 3, -noscalemult * 3 )
	parent.backdrop:SetTexture( 0, 0, 0, 1 )

	parent.backdrop2 = parent:CreateTexture( nil, "BORDER" )
	parent.backdrop2:SetDrawLayer( "BORDER", -7 )
	parent.backdrop2:SetAllPoints( point )
	parent.backdrop2:SetTexture( unpack( C["media"].backdropcolor ) )

	parent.bordertop = parent:CreateTexture( nil, "BORDER" )
	parent.bordertop:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 2, noscalemult * 2 )
	parent.bordertop:SetPoint( "TOPRIGHT", point, "TOPRIGHT", noscalemult * 2, noscalemult * 2 )
	parent.bordertop:SetHeight( noscalemult )
	parent.bordertop:SetTexture( unpack( C["media"].bordercolor ) )
	parent.bordertop:SetDrawLayer( "BORDER", -7 )

	parent.borderbottom = parent:CreateTexture( nil, "BORDER" )
	parent.borderbottom:SetPoint( "BOTTOMLEFT", point, "BOTTOMLEFT", -noscalemult * 2, -noscalemult * 2 )
	parent.borderbottom:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", noscalemult * 2, -noscalemult * 2 )
	parent.borderbottom:SetHeight( noscalemult )
	parent.borderbottom:SetTexture( unpack( C["media"].bordercolor ) )
	parent.borderbottom:SetDrawLayer( "BORDER", -7 )

	parent.borderleft = parent:CreateTexture( nil, "BORDER" )
	parent.borderleft:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 2, noscalemult * 2 )
	parent.borderleft:SetPoint( "BOTTOMLEFT", point, "BOTTOMLEFT", noscalemult * 2, -noscalemult * 2 )
	parent.borderleft:SetWidth( noscalemult )
	parent.borderleft:SetTexture( unpack( C["media"].bordercolor ) )
	parent.borderleft:SetDrawLayer( "BORDER", -7 )

	parent.borderright = parent:CreateTexture( nil, "BORDER" )
	parent.borderright:SetPoint( "TOPRIGHT", point, "TOPRIGHT", noscalemult * 2, noscalemult * 2 )
	parent.borderright:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", -noscalemult * 2, -noscalemult * 2 )
	parent.borderright:SetWidth( noscalemult )
	parent.borderright:SetTexture( unpack( C["media"].bordercolor ) )
	parent.borderright:SetDrawLayer( "BORDER", -7 )	
end

local function SetVirtualBorder( parent, r, g, b )
	parent.bordertop:SetTexture( r, g, b )
	parent.borderbottom:SetTexture( r, g, b )
	parent.borderleft:SetTexture( r, g, b )
	parent.borderright:SetTexture( r, g, b )
end

local goodR, goodG, goodB = unpack( C["nameplate"].goodcolor )
local badR, badG, badB = unpack( C["nameplate"].badcolor )
local transitionR, transitionG, transitionB = unpack( C["nameplate"].transitioncolor )
local function UpdateThreat( frame, elapsed )
	frame.hp:Show()
	if( frame.hasClass == true ) then return end

	if( C["nameplate"].enhancethreat ~= true ) then
		if( frame.region:IsShown() ) then
			local _, val = frame.region:GetVertexColor()
			if( val > 0.7 ) then
				SetVirtualBorder( frame.hp, transitionR, transitionG, transitionB )
			else
				SetVirtualBorder( frame.hp, badR, badG, badB )
			end
		else
			SetVirtualBorder( frame.hp, unpack( C["media"].bordercolor ) )
		end
	else
		if not frame.region:IsShown() then
			if( InCombatLockdown() and frame.isFriendly ~= true ) then
				if( S.Role == "Tank" ) then
					frame.hp:SetStatusBarColor( badR, badG, badB )
					frame.hp.hpbg:SetTexture( badR, badG, badB, 0.25 )
				else
					frame.hp:SetStatusBarColor( goodR, goodG, goodB )
					frame.hp.hpbg:SetTexture( goodR, goodG, goodB, 0.25 )
				end
			else
				frame.hp:SetStatusBarColor( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor )
				frame.hp.hpbg:SetTexture( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor, 0.25 )
			end
		else
			local r, g, b = frame.region:GetVertexColor()
			if( g + b == 0 ) then
				if( S.Role == "Tank" ) then
					frame.hp:SetStatusBarColor( goodR, goodG, goodB )
					frame.hp.hpbg:SetTexture( goodR, goodG, goodB, 0.25 )
				else
					frame.hp:SetStatusBarColor( badR, badG, badB )
					frame.hp.hpbg:SetTexture( badR, badG, badB, 0.25 )
				end
			else
				frame.hp:SetStatusBarColor( transitionR, transitionG, transitionB )	
				frame.hp.hpbg:SetTexture( transitionR, transitionG, transitionB, 0.25 )
			end
		end
	end
end

local function CreateAuraIcon( parent )
	local button = CreateFrame( "Frame", nil, parent )
	button:SetWidth( 20 )
	button:SetHeight( 20 )

	button.bg = button:CreateTexture( nil, "BACKGROUND" )
	button.bg:SetTexture( unpack( C["media"].backdropcolor ) )
	button.bg:SetAllPoints( button )

	button.bord = button:CreateTexture( nil, "BORDER" )
	button.bord:SetTexture( unpack( C["media"].bordercolor ) )
	button.bord:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult, -noscalemult )
	button.bord:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult, noscalemult )

	button.bg2 = button:CreateTexture( nil, "ARTWORK" )
	button.bg2:SetTexture( unpack( C["media"].backdropcolor ) )
	button.bg2:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult * 2, -noscalemult * 2 )
	button.bg2:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult * 2, noscalemult * 2 )	

	button.icon = button:CreateTexture( nil, "OVERLAY" )
	button.icon:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult * 3, -noscalemult * 3 )
	button.icon:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult * 3, noscalemult * 3 )
	button.icon:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
	button.cd = CreateFrame( "Cooldown", nil, button )
	button.cd:SetAllPoints( button )
	button.cd:SetReverse( true )
	button.count = button:CreateFontString( nil, "OVERLAY" )
	button.count:SetFont( FONT, 10, FONTFLAG )
	button.count:SetShadowColor( 0, 0, 0, 0.4 )
	button.count:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 2 )
	return button
end

local function UpdateAuraIcon( button, unit, index, filter )
	local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura( unit, index, filter )
	
	button.icon:SetTexture( icon )
	button.cd:SetCooldown( expirationTime - duration, duration )
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	if( count > 1 ) then
		button.count:SetText( count )
	else
		button.count:SetText( "" )
	end
	button.cd:SetScript( "OnUpdate", function( self )
		if not button.cd.timer then
			self:SetScript( "OnUpdate", nil )
			return
		end
		button.cd.timer.text:SetFont( FONT, 10, FONTFLAG )
		button.cd.timer.text:SetShadowColor( 0, 0, 0, 0.4 )
	end )
	button:Show()
end

local function OnAura( frame, unit )
	if not frame.icons or not frame.unit then return end
	local i = 1
	for index = 1,40 do
		if( i > 5 ) then return end
		local match
		local name, _, _, _, _, duration, _, caster, _, _, spellid = UnitAura( frame.unit, index, "HARMFUL" )

		if( C["nameplate"].trackdebuffs == true ) then
			if( caster == "player" ) then match = true end
		end

		if( C["nameplate"].trackcc == true ) then
			if( S.DebuffWhiteList[name] ) then match = true end
		end

		if( duration and match == true ) then
			if not frame.icons[i] then frame.icons[i] = CreateAuraIcon(frame) end
			local icon = frame.icons[i]
			if( i == 1 ) then icon:SetPoint( "RIGHT", frame.icons, "RIGHT" ) end
			if( i ~= 1 and i <= 5 ) then icon:SetPoint( "RIGHT", frame.icons[i - 1], "LEFT", -2, 0 ) end
			i = i + 1
			UpdateAuraIcon( icon, frame.unit, index, "HARMFUL" )
		end
	end
	for index = i, #frame.icons do frame.icons[index]:Hide() end
end

local function UpdateCastbar( frame )
	frame:ClearAllPoints()
	frame:SetSize( cbWidth, cbHeight )
	frame:SetPoint( "TOP", frame:GetParent().hp, "BOTTOM", 0, -8 )
	frame:GetStatusBarTexture():SetHorizTile( true )
	if( frame.shield:IsShown() ) then
		frame:SetStatusBarColor( 0.78, 0.25, 0.25, 1 )
	end
end	

local function UpdateCastText( frame, curValue )
	local minValue, maxValue = frame:GetMinMaxValues()

	if( UnitChannelInfo( "target" ) ) then
		frame.time:SetFormattedText( "%.1f ", curValue )
		frame.name:SetText( select( 1, ( UnitChannelInfo( "target" ) ) ) )
	end

	if( UnitCastingInfo("target") ) then
		frame.time:SetFormattedText( "%.1f ", maxValue - curValue )
		frame.name:SetText( select( 1, ( UnitCastingInfo( "target" ) ) ) )
	end
end

local OnValueChanged = function( self, curValue )
	UpdateCastText( self, curValue )
	if( self.needFix ) then
		UpdateCastbar( self )
		self.needFix = nil
	end
end

local OnSizeChanged = function( self )
	self.needFix = true
end

local function OnHide( frame )
	frame.hp:SetStatusBarColor( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor )
	frame.overlay:Hide()
	frame.cb:Hide()
	frame.unit = nil
	frame.guid = nil
	frame.hasClass = nil
	frame.isFriendly = nil
	frame.hp.rcolor = nil
	frame.hp.gcolor = nil
	frame.hp.bcolor = nil
	if( frame.icons ) then
		for _, icon in ipairs( frame.icons ) do
			icon:Hide()
		end
	end

	frame:SetScript( "OnUpdate", nil )
end

local function Colorize( frame )
	local r, g, b = frame.healthOriginal:GetStatusBarColor()

	for class, color in pairs( RAID_CLASS_COLORS ) do
		local r, g, b = floor( r * 100 + .5 ) / 100, floor( g * 100 + .5 ) / 100, floor( b * 100 + .5 ) / 100
		if( RAID_CLASS_COLORS[class].r == r and RAID_CLASS_COLORS[class].g == g and RAID_CLASS_COLORS[class].b == b ) then
			frame.hasClass = true
			frame.isFriendly = false
			frame.hp:SetStatusBarColor( unpack( S.UnitColor.class[class] ) )
			return
		end
	end

	if( g + b == 0 ) then
		r, g, b = unpack( S.UnitColor.reaction[1] )
		frame.isFriendly = false
	elseif( r + b == 0 ) then
		r, g, b = unpack( S.UnitColor.power["MANA"] )
		frame.isFriendly = true
	elseif( r + g > 1.95 ) then
		r, g, b = unpack( S.UnitColor.reaction[4] )
		frame.isFriendly = false
	elseif( r + g == 0 ) then
		r, g, b = unpack( S.UnitColor.reaction[5] )
		frame.isFriendly = true
	else
		frame.isFriendly = false
	end
	frame.hasClass = false

	frame.hp:SetStatusBarColor( r, g, b )
end

local function UpdateObjects( frame )
	local frame = frame:GetParent()

	local r, g, b = frame.hp:GetStatusBarColor()

	frame.hp:ClearAllPoints()
	frame.hp:SetSize( hpWidth, hpHeight )
	frame.hp:SetPoint( "TOP", frame, "TOP", 0, -15 )
	frame.hp:GetStatusBarTexture():SetHorizTile( true )

	frame.hp:SetMinMaxValues( frame.healthOriginal:GetMinMaxValues() )
	frame.hp:SetValue( frame.healthOriginal:GetValue() )
	frame.healthOriginal:SetScript( "OnValueChanged", function()
		frame.hp:SetMinMaxValues( frame.healthOriginal:GetMinMaxValues() )
		frame.hp:SetValue( frame.healthOriginal:GetValue() )
	end )

	Colorize( frame )
	frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor = frame.hp:GetStatusBarColor()
	frame.hp.hpbg:SetTexture( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor, 0.25 )
	SetVirtualBorder( frame.hp, unpack( C["media"].bordercolor ) )
	if( C["nameplate"].enhancethreat == true ) then
		frame.hp.name:SetTextColor( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor )
	end

	frame.hp.name:SetText( frame.hp.oldname:GetText() )

	local level, elite, mylevel = tonumber( frame.hp.oldlevel:GetText() ), frame.hp.elite:IsShown(), UnitLevel( "player" )
	frame.hp.level:ClearAllPoints()
	if( C["nameplate"].showhealth == true ) then
		frame.hp.level:SetPoint( "RIGHT", frame.hp, "RIGHT", 2, 1 )
	else
		frame.hp.level:SetPoint( "RIGHT", frame.hp, "LEFT", -1, 1 )
	end

	frame.hp.level:SetTextColor( frame.hp.oldlevel:GetTextColor() )
	if( frame.hp.boss:IsShown() ) then
		frame.hp.level:SetText( "??" )
		frame.hp.level:SetTextColor( 0.8, 0.05, 0 )
		frame.hp.level:Show()
	elseif not elite and level == mylevel then
		frame.hp.level:Hide()
	else
		frame.hp.level:SetText( level .. ( elite and "+" or "" ) )
		frame.hp.level:Show()
	end

	frame.overlay:ClearAllPoints()
	frame.overlay:SetAllPoints( frame.hp )

	if( C["nameplate"].trackdebuffs == true or C["nameplate"].trackcc == true ) then
		if frame.icons then return end
		frame.icons = CreateFrame( "Frame", nil, frame )
		frame.icons:SetPoint( "BOTTOMRIGHT", frame.hp, "TOPRIGHT", 0, FONTSIZE + 5 )
		frame.icons:SetWidth( 20 + hpWidth )
		frame.icons:SetHeight( 25 )
		frame.icons:SetFrameLevel( frame.hp:GetFrameLevel() + 2 )
		frame:RegisterEvent( "UNIT_AURA" )
		frame:HookScript( "OnEvent", OnAura )
	end	

	HideObjects( frame )
end

local function SkinObjects( frame )
	local oldhp, cb = frame:GetChildren()
	local threat, hpborder, overlay, oldname, oldlevel, bossicon, raidicon, elite = frame:GetRegions()
	local _, cbborder, cbshield, cbicon = cb:GetRegions()

	frame.healthOriginal = oldhp
	local hp = CreateFrame( "Statusbar", nil, frame )
	hp:SetFrameLevel( oldhp:GetFrameLevel() )
	hp:SetFrameStrata( oldhp:GetFrameStrata() )
	hp:SetStatusBarTexture( TEXTURE )
	CreateVirtualFrame( hp )

	hp.level = hp:CreateFontString( nil, "OVERLAY" )
	hp.level:SetFont( FONT, FONTSIZE, FONTFLAG )
	hp.level:SetShadowColor( 0, 0, 0, 0.4 )
	hp.level:SetTextColor( 1, 1, 1 )
	hp.level:SetShadowOffset( S.mult, -S.mult )
	hp.oldlevel = oldlevel
	hp.boss = bossicon
	hp.elite = elite

	if( C["nameplate"].showhealth == true ) then
		hp.value = hp:CreateFontString( nil, "OVERLAY" )
		hp.value:SetFont( FONT, FONTSIZE, FONTFLAG )
		hp.value:SetShadowColor( 0, 0, 0, 0.4 )
		hp.value:SetPoint( "CENTER", 0, 1 )
		hp.value:SetTextColor( 1, 1, 1 )
		hp.value:SetShadowOffset( S.mult, -S.mult )
	end

	hp.name = hp:CreateFontString( nil, "OVERLAY" )
	hp.name:SetPoint( "BOTTOMLEFT", hp, "TOPLEFT", -10, 3 )
	hp.name:SetPoint( "BOTTOMRIGHT", hp, "TOPRIGHT", 10, 3 )
	hp.name:SetFont( FONT, FONTSIZE, FONTFLAG )
	hp.name:SetShadowColor( 0, 0, 0, 0.4 )
	hp.name:SetShadowOffset( S.mult, -S.mult )
	hp.oldname = oldname

	hp.hpbg = hp:CreateTexture( nil, "BORDER" )
	hp.hpbg:SetAllPoints( hp )
	hp.hpbg:SetTexture( 1, 1, 1, 0.25 )

	hp:HookScript( "OnShow", UpdateObjects )
	frame.hp = hp

	cb:SetFrameLevel( 1 )
	cb:SetStatusBarTexture( TEXTURE )
	CreateVirtualFrame(cb)

	cb.time = cb:CreateFontString( nil, "ARTWORK" )
	cb.time:SetPoint( "RIGHT", cb, "LEFT", -1, 0 )
	cb.time:SetFont( FONT, FONTSIZE, FONTFLAG )
	cb.time:SetShadowColor( 0, 0, 0, 0.4 )
	cb.time:SetTextColor( 1, 1, 1 )
	cb.time:SetShadowOffset( S.mult, -S.mult )

	cb.name = cb:CreateFontString( nil, "ARTWORK" )
	cb.name:SetPoint( "TOP", cb, "BOTTOM", 0, -3 )
	cb.name:SetFont( FONT, FONTSIZE, FONTFLAG )
	cb.name:SetTextColor( 1, 1, 1 )
	cb.name:SetShadowColor( 0, 0, 0, 0.4 )
	cb.name:SetShadowOffset( S.mult, -S.mult )

	cbicon:ClearAllPoints()
	cbicon:SetPoint( "TOPLEFT", hp, "TOPRIGHT", 8, 0 )
	cbicon:SetSize( iconSize, iconSize )
	cbicon:SetTexCoord( .07, .93, .07, .93 )
	cbicon:SetDrawLayer( "OVERLAY" )
	cb.icon = cbicon
	CreateVirtualFrame( cb, cb.icon )

	cb.shield = cbshield
	cbshield:ClearAllPoints()
	cbshield:SetPoint( "TOP", cb, "BOTTOM" )
	cb:HookScript( "OnShow", UpdateCastbar )
	cb:HookScript( "OnSizeChanged", OnSizeChanged )
	cb:HookScript( "OnValueChanged", OnValueChanged )
	frame.cb = cb

	overlay:SetTexture( 1, 1, 1, 0.15 )
	overlay:SetAllPoints( hp )	
	frame.overlay = overlay

	raidicon:ClearAllPoints()
	raidicon:SetPoint( "BOTTOM", hp, "TOP", 0, 16 )
	raidicon:SetSize( iconSize * 1.4, iconSize * 1.4 )
	raidicon:SetTexture( [[Interface\AddOns\Tukui\medias\textures\raidicons.blp]] )
	frame.raidicon = raidicon

	QueueObject( frame, oldhp )
	QueueObject( frame, oldlevel )
	QueueObject( frame, threat )
	QueueObject( frame, hpborder )
	QueueObject( frame, cbshield )
	QueueObject( frame, cbborder )
	QueueObject( frame, oldname )
	QueueObject( frame, bossicon )
	QueueObject( frame, elite )
	
	UpdateObjects( hp )
	UpdateCastbar( cb )

	frame:HookScript( "OnHide", OnHide )
	frames[frame] = true
end

local function CheckBlacklist( frame, ... )
	if( S.PlateBlacklist[frame.hp.name:GetText()] ) then
		frame:SetScript("OnUpdate", function() end)
		frame.hp:Hide()
		frame.cb:Hide()
		frame.overlay:Hide()
		frame.hp.oldlevel:Hide()
	end
end

local function HideDrunkenText( frame, ... )
	if( frame and frame.hp.oldlevel and frame.hp.oldlevel:IsShown() ) then
		frame.hp.oldlevel:Hide()
	end
end

local function AdjustNameLevel( frame, ... )
	if( UnitName("target") == frame.hp.name:GetText() and frame:GetAlpha() == 1 ) then
		frame.hp.name:SetDrawLayer( "OVERLAY" )
	else
		frame.hp.name:SetDrawLayer( "BORDER" )
	end
end

local function ShowHealth( frame, ... )
	local minHealth, maxHealth = frame.healthOriginal:GetMinMaxValues()
	local valueHealth = frame.healthOriginal:GetValue()
	local d =( valueHealth / maxHealth ) * 100
	
	if( C["nameplate"].showhealth == true ) then
		frame.hp.value:SetText( S.ShortValue( valueHealth ) .. " - " .. ( string.format( "%d%%", math.floor( ( valueHealth / maxHealth ) *100 ) ) ) )
	end

	if( frame.hasClass == true or frame.isFriendly == true ) then
		if( d <= 50 and d >= 20 ) then
			SetVirtualBorder( frame.hp, 1, 1, 0 )
		elseif( d < 20 ) then
			SetVirtualBorder( frame.hp, 1, 0, 0 )
		else
			SetVirtualBorder( frame.hp, unpack( C["media"].bordercolor ) )
		end
	elseif( ( frame.hasClass ~= true and frame.isFriendly ~= true ) and C["nameplate"].enhancethreat == true ) then
		SetVirtualBorder( frame.hp, unpack( C["media"].bordercolor ) )
	end
end

local function CheckUnit_Guid( frame, ... )
	if( UnitExists( "target" ) and frame:GetAlpha() == 1 and UnitName( "target" ) == frame.hp.name:GetText() ) then
		frame.guid = UnitGUID( "target" )
		frame.unit = "target"
		OnAura( frame, "target" )
	elseif( frame.overlay:IsShown() and UnitExists( "mouseover" ) and UnitName( "mouseover" ) == frame.hp.name:GetText() ) then
		frame.guid = UnitGUID( "mouseover" )
		frame.unit = "mouseover"
		OnAura( frame, "mouseover" )
	else
		frame.unit = nil
	end
end

local function MatchGUID( frame, destGUID, spellID )
	if not frame.guid then return end

	if( frame.guid == destGUID ) then
		for _, icon in ipairs( frame.icons ) do
			if( icon.spellID == spellID ) then
				icon:Hide()
			end
		end
	end
end

local function ForEachPlate( functionToRun, ... )
	for frame in pairs( frames ) do
		if( frame:IsShown() ) then
			functionToRun( frame, ... )
		end
	end
end

local select = select
local function HookFrames( ... )
	for index = 1, select( "#", ... ) do
		local frame = select( index, ... )
		local region = frame:GetRegions()

		if( not frames[frame] and ( frame:GetName() and frame:GetName():find( "NamePlate%d" ) ) and region and region:GetObjectType() == "Texture" and region:GetTexture() == OVERLAY ) then
			SkinObjects(frame)
			frame.region = region
		end
	end
end

CreateFrame( "Frame" ):SetScript( "OnUpdate", function( self, elapsed )
	if( WorldFrame:GetNumChildren() ~= numChildren ) then
		numChildren = WorldFrame:GetNumChildren()
		HookFrames(WorldFrame:GetChildren())
	end

	if( self.elapsed and self.elapsed > 0.2 ) then
		ForEachPlate( UpdateThreat, self.elapsed )
		ForEachPlate( AdjustNameLevel )
		self.elapsed = 0
	else
		self.elapsed = ( self.elapsed or 0 ) + elapsed
	end

	ForEachPlate( ShowHealth )
	ForEachPlate( CheckBlacklist )
	ForEachPlate( HideDrunkenText )
	ForEachPlate( CheckUnit_Guid )
end )

function NamePlates:COMBAT_LOG_EVENT_UNFILTERED( _, event, _, _, sourceName, _, destGUID, _, _, spellID )
	if( event == "SPELL_AURA_REMOVED" ) then
		ForEachPlate( MatchGUID, destGUID, spellID )
	end
end

if( C["nameplate"].combat == true ) then
	NamePlates:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	NamePlates:RegisterEvent( "PLAYER_REGEN_DISABLED" )

	function NamePlates:PLAYER_REGEN_ENABLED()
		SetCVar( "nameplateShowEnemies", 0 )
	end

	function NamePlates:PLAYER_REGEN_DISABLED()
		SetCVar( "nameplateShowEnemies", 1 )
	end
end

NamePlates:RegisterEvent( "PLAYER_ENTERING_WORLD" )
function NamePlates:PLAYER_ENTERING_WORLD()
	if( C["nameplate"].combat == true ) then
		if( InCombatLockdown() ) then
			SetCVar( "nameplateShowEnemies", 1 )
		else
			SetCVar( "nameplateShowEnemies", 0 )
		end
	end

	if( C["nameplate"].enable == true and C["nameplate"].enhancethreat == true ) then
		SetCVar( "threatWarning", 3 )
	end

	SetCVar( "bloatthreat", 0 )
	SetCVar( "bloattest", 0 )
	SetCVar( "bloatnameplates", 0 )
	if( S.eyefinity ) then
		SetCVar( "nameplateMotion", "0" )
		InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown:Kill()
	end
end