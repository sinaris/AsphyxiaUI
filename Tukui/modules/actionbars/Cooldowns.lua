local S, C, L = unpack(select(2, ...))

if( IsAddOnLoaded( "OmniCC" ) or IsAddOnLoaded( "ncCooldown" ) or C["cooldown"].enable ~= true ) then return end

OmniCC = true
local ICON_SIZE = 36
local DAY, HOUR, MINUTE = 86400, 3600, 60
local DAYISH, HOURISH, MINUTEISH = 3600 * 23.5, 60 * 59.5, 59.5
local HALFDAYISH, HALFHOURISH, HALFMINUTEISH = DAY / 2 + 0.5, HOUR / 2 + 0.5, MINUTE / 2 + 0.5

local FONT_FACE = C["media"].pixelfont
local FONT_SIZE = 20
local MIN_SCALE = 0.5
local MIN_DURATION = 2.5
local EXPIRING_DURATION = C["cooldown"].treshold

local EXPIRING_FORMAT = S.RGBToHex( 1, 0, 0 ) .. '%.1f|r'
local SECONDS_FORMAT = S.RGBToHex( 1, 1, 0 ) .. '%d|r'
local MINUTES_FORMAT = S.RGBToHex( 1, 1, 1 ) .. '%dm|r'
local HOURS_FORMAT = S.RGBToHex( 0.4, 1, 1 ) .. '%dh|r'
local DAYS_FORMAT = S.RGBToHex( 0.4, 0.4, 1 ) .. '%dh|r'

local floor = math.floor
local min = math.min
local GetTime = GetTime

local function getTimeText( s )
	if( s < MINUTEISH ) then
		local seconds = tonumber( S.Round( s ) )
		if( seconds > EXPIRING_DURATION ) then
			return SECONDS_FORMAT, seconds, s - ( seconds - 0.51 )
		else
			return EXPIRING_FORMAT, s, 0.051
		end

	elseif( s < HOURISH ) then
		local minutes = tonumber( S.Round( s / MINUTE ) )
		return MINUTES_FORMAT, minutes, minutes > 1 and ( s - ( minutes * MINUTE - HALFMINUTEISH ) ) or ( s - MINUTEISH )

	elseif( s < DAYISH ) then
		local hours = tonumber( S.Round( s / HOUR ) )
		return HOURS_FORMAT, hours, hours > 1 and ( s - ( hours * HOUR - HALFHOURISH ) ) or ( s - HOURISH )

	else
		local days = tonumber( S.Round( s / DAY ) )
		return DAYS_FORMAT, days,  days > 1 and ( s - ( days * DAY - HALFDAYISH ) ) or ( s - DAYISH )
	end
end

local function Timer_Stop( self )
	self.enabled = nil
	self:Hide()
end

local function Timer_ForceUpdate( self )
	self.nextUpdate = 0
	self:Show()
end

local function Timer_OnSizeChanged( self, width, height )
	local fontScale = S.Round( width ) / ICON_SIZE
	if( fontScale == self.fontScale ) then
		return
	end

	self.fontScale = fontScale
	if( fontScale < MIN_SCALE ) then
		self:Hide()
	else
		self.text:SetFont( FONT_FACE, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
		self.text:SetShadowColor( 0, 0, 0, 0.5 )
		self.text:SetShadowOffset( 2, -2 )
		if( self.enabled ) then
			Timer_ForceUpdate( self )
		end
	end
end

local function Timer_OnUpdate( self, elapsed )
	if( self.nextUpdate > 0 ) then
		self.nextUpdate = self.nextUpdate - elapsed
	else
		local remain = self.duration - ( GetTime() - self.start )
		if( tonumber( S.Round( remain ) ) > 0 ) then
			if( ( self.fontScale * self:GetEffectiveScale() / UIParent:GetScale() ) < MIN_SCALE ) then
				self.text:SetText( "" )
				self.nextUpdate  = 1
			else
				local formatStr, time, nextUpdate = getTimeText( remain )
				self.text:SetFormattedText( formatStr, time )
				self.nextUpdate = nextUpdate
			end
		else
			Timer_Stop( self )
		end
	end
end

local function Timer_Create( self )
	local scaler = CreateFrame( "Frame", nil, self )
	scaler:SetAllPoints( self )

	local timer = CreateFrame( "Frame", nil, scaler )
	timer:Hide()
	timer:SetAllPoints( scaler )
	timer:SetScript( "OnUpdate", Timer_OnUpdate )

	local text = timer:CreateFontString( nil, "OVERLAY" )
	text:Point( "CENTER", 2, 0 )
	text:SetJustifyH( "CENTER" )
	timer.text = text

	Timer_OnSizeChanged( timer, scaler:GetSize() )
	scaler:SetScript( "OnSizeChanged", function( self, ... ) Timer_OnSizeChanged( timer, ... ) end )

	self.timer = timer
	return timer
end

local function Timer_Start( self, start, duration )
	if( self.noOCC ) then return end

	if( start > 0 and duration > MIN_DURATION ) then
		local timer = self.timer or Timer_Create( self )
		timer.start = start
		timer.duration = duration
		timer.enabled = true
		timer.nextUpdate = 0
		if( timer.fontScale >= MIN_SCALE ) then timer:Show() end
	else
		local timer = self.timer
		if( timer ) then
			Timer_Stop( timer )
		end
	end
end

hooksecurefunc( getmetatable( ActionButton1Cooldown ).__index, "SetCooldown", Timer_Start )

if( S.toc < 40300 ) then return end

local active = {}
local hooked = {}

local function cooldown_OnShow( self )
	active[self] = true
end

local function cooldown_OnHide( self )
	active[self] = nil
end

local function cooldown_ShouldUpdateTimer( self, start, duration )
	local timer = self.timer
	if not timer then
		return true
	end
	return timer.start ~= start
end

local function cooldown_Update( self )
	local button = self:GetParent()
	local start, duration, enable = GetActionCooldown( button.action )

	if( cooldown_ShouldUpdateTimer( self, start, duration ) ) then
		Timer_Start( self, start, duration )
	end
end

local EventWatcher = CreateFrame( "Frame" )
EventWatcher:Hide()
EventWatcher:SetScript( "OnEvent", function( self, event )
	for cooldown in pairs( active ) do
		cooldown_Update( cooldown )
	end
end )
EventWatcher:RegisterEvent( "ACTIONBAR_UPDATE_COOLDOWN" )

local function actionButton_Register( frame )
	local cooldown = frame.cooldown
	if not hooked[cooldown] then
		cooldown:HookScript( "OnShow", cooldown_OnShow )
		cooldown:HookScript( "OnHide", cooldown_OnHide )
		hooked[cooldown] = true
	end
end

if( _G["ActionBarButtonEventsFrame"].frames ) then
	for i, frame in pairs( _G["ActionBarButtonEventsFrame"].frames ) do
		actionButton_Register( frame )
	end
end

hooksecurefunc( "ActionBarButtonEventsFrame_RegisterFrame", actionButton_Register )