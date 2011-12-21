local S, C, L = unpack( select( 2, ... ) )

local noop = S.dummy
local floor = math.floor
local class = S.myclass
local texture = C.media.blank
local backdropr, backdropg, backdropb = unpack( C["media"].backdropcolor )
local borderr, borderg, borderb = unpack( C["media"].bordercolor )
local backdropa = 1
local bordera = 1
local template
local inset = 0
local noinset = C["media"].noinset

local mult = 768 / string.match( GetCVar( "gxResolution" ), "%d+x(%d+)") / C["general"].uiscale
local Scale = function( x )
    return mult * math.floor( x / mult + .5 )
end

S.Scale = function( x ) return Scale( x ) end
S.mult = mult

if( noinset ) then inset = mult end

local function UpdateColor( t )
	if( t == template ) then return end

	if( t == "ClassColor" or t == "Class Color" or t == "Class" ) then
		local c = S.UnitColor.class[class]
		borderr, borderg, borderb = c[1], c[2], c[3]
		backdropr, backdropg, backdropb = unpack( C["media"].backdropcolor )
		backdropa = 1
	else
		local balpha = 1
		if( t == "Transparent" ) then balpha = 0.7 end
		borderr, borderg, borderb = unpack( C["media"].bordercolor )
		backdropr, backdropg, backdropb = unpack( C["media"].backdropcolor )
		backdropa = balpha
	end
	
	template = t
end

local function Animate( self, x, y, duration )
	self.anim = self:CreateAnimationGroup( "Move_In" )
	self.anim.in1 = self.anim:CreateAnimation( "Translation" )
	self.anim.in1:SetDuration( 0 )
	self.anim.in1:SetOrder( 1 )
	self.anim.in2 = self.anim:CreateAnimation( "Translation" )
	self.anim.in2:SetDuration( duration )
	self.anim.in2:SetOrder( 2 )
	self.anim.in2:SetSmoothing( "OUT" )
	self.anim.out1 = self:CreateAnimationGroup( "Move_Out" )
	self.anim.out2 = self.anim.out1:CreateAnimation( "Translation" )
	self.anim.out2:SetDuration( duration )
	self.anim.out2:SetOrder( 1 )
	self.anim.out2:SetSmoothing( "IN" )
	self.anim.in1:SetOffset( Scale( x ), Scale( y ) )
	self.anim.in2:SetOffset( Scale( -x ), Scale( -y ) )
	self.anim.out2:SetOffset( Scale( x ), Scale( y ) )
	self.anim.out1:SetScript( "OnFinished", function() self:Hide() end )
end

local function CreateBackdrop( f, t, tex )
	if not t then t = "Default" end

	local b = CreateFrame( "Frame", nil, f )
	b:Point( "TOPLEFT", -2 + inset, 2 - inset )
	b:Point( "BOTTOMRIGHT", 2 - inset, -2 + inset )
	b:SetTemplate( t, tex )

	if( f:GetFrameLevel() - 1 >= 0 ) then
		b:SetFrameLevel( f:GetFrameLevel() - 1 )
	else
		b:SetFrameLevel( 0 )
	end

	f.backdrop = b
end

local function CreateBorder( f, i, o )
	if( i ) then
		if( f.iborder ) then return end
		local border = CreateFrame( "Frame", f:GetName() and f:GetName() .. "InnerBorder" or nil, f )
		border:Point( "TOPLEFT", mult, -mult )
		border:Point( "BOTTOMRIGHT", -mult, mult )
		border:SetBackdrop( {
			edgeFile = C["media"].blank, 
			edgeSize = mult, 
			insets = { left = mult, right = mult, top = mult, bottom = mult }
		} )
		border:SetBackdropBorderColor( 0, 0, 0 )
		f.iborder = border
	end

	if( o ) then
		if( f.oborder ) then return end
		local border = CreateFrame( "Frame", f:GetName() and f:GetName() .. "OuterBorder" or nil, f )
		border:Point( "TOPLEFT", -mult, mult )
		border:Point( "BOTTOMRIGHT", mult, -mult )
		border:SetFrameLevel( f:GetFrameLevel() + 1 )
		border:SetBackdrop( {
			edgeFile = C["media"].blank, 
			edgeSize = mult, 
			insets = { left = mult, right = mult, top = mult, bottom = mult }
		} )
		border:SetBackdropBorderColor( 0, 0, 0 )
		f.oborder = border
	end
end

local function CreatePanel( f, t, w, h, a1, p, a2, x, y )
	UpdateColor( t )

	local sh = Scale( h )
	local sw = Scale( w )
	f:SetFrameLevel( 1 )
	f:SetHeight( sh )
	f:SetWidth( sw )
	f:SetFrameStrata( "BACKGROUND" )
	f:SetPoint( a1, p, a2, Scale( x ), Scale( y ) )
	f:SetBackdrop( {
		bgFile = C["media"].blank, 
		edgeFile = C["media"].blank, 
		tile = false, tileSize = 0, edgeSize = mult, 
		insets = { left = -mult + inset + inset, right = -mult + inset + inset, top = -mult + inset + inset, bottom = -mult + inset + inset }
	} )

	f:SetBackdropColor( backdropr, backdropg, backdropb, backdropa )
	f:SetBackdropBorderColor( borderr, borderg, borderb )
end

local function CreateOverlay( f )
	if( f.overlay ) then return end

	local overlay = f:CreateTexture( f:GetName() and f:GetName() .. "Overlay" or nil, "BORDER", f )
	overlay:ClearAllPoints()
	overlay:Point( "TOPLEFT", 2, -2 )
	overlay:Point( "BOTTOMRIGHT", -2, 2 )
	overlay:SetTexture( C["media"].normTex )
	overlay:SetVertexColor( .05, .05, .05 )
	f.overlay = overlay
end

local function CreateShadow( f, t )
	if( f.shadow ) then return end

	local shadow = CreateFrame( "Frame", nil, f )
	shadow:SetFrameLevel( 1 )
	shadow:SetFrameStrata( f:GetFrameStrata() )
	shadow:Point( "TOPLEFT", -3, 3 )
	shadow:Point( "BOTTOMLEFT", -3, -3 )
	shadow:Point( "TOPRIGHT", 3, 3 )
	shadow:Point( "BOTTOMRIGHT", 3, -3 )
	shadow:SetBackdrop( { 
		edgeFile = C["media"].glowTex, edgeSize = S.Scale( 3 ),
		insets = { left = S.Scale( 5 ), right = S.Scale( 5 ), top = S.Scale( 5 ), bottom = S.Scale( 5 ) },
	} )
	shadow:SetBackdropColor( 0, 0, 0, 0 )
	shadow:SetBackdropBorderColor( 0, 0, 0, 0.8 )
	f.shadow = shadow
end

local function FadeIn( f )
	UIFrameFadeIn( f, .4, f:GetAlpha(), 1 )
end
	
local function FadeOut( f )
	UIFrameFadeOut( f, .8, f:GetAlpha(), 0 )
end

local function FontString( parent, name, fontName, fontHeight, fontStyle )
	local fs = parent:CreateFontString( nil, "OVERLAY" )
	fs:SetFont( fontName, fontHeight, fontStyle )
	fs:SetJustifyH( "LEFT" )
	fs:SetShadowColor( 0, 0, 0 )
	fs:SetShadowOffset( mult, -mult )

	if not name then
		parent.text = fs
	else
		parent[name] = fs
	end

	return fs
end

local function Height( frame, height )
	frame:SetHeight( Scale( height ) )
end

local function HighlightTarget( self, event, unit )
	if( self.unit == "target" ) then return end
	if( UnitIsUnit( 'target', self.unit ) ) then
		self.HighlightTarget:Show()
	else
		self.HighlightTarget:Hide()
	end
end

local function HighlightUnit( f, r, g, b )
	if( f.HighlightTarget ) then return end

	local glowBorder = { edgeFile = C["media"].blank, edgeSize = 1 }
	f.HighlightTarget = CreateFrame( "Frame", nil, f )
	f.HighlightTarget:Point( "TOPLEFT", f, "TOPLEFT", -2, 2 )
	f.HighlightTarget:Point( "BOTTOMRIGHT", f, "BOTTOMRIGHT", 2, -2 )
	f.HighlightTarget:SetBackdrop( glowBorder )
	f.HighlightTarget:SetFrameLevel( f:GetFrameLevel() + 1 )
	f.HighlightTarget:SetBackdropBorderColor( r, g, b, 1 )
	f.HighlightTarget:Hide()
	f:RegisterEvent( "PLAYER_TARGET_CHANGED", HighlightTarget )
end

local function Kill( object )
	if( object.UnregisterAllEvents ) then
		object:UnregisterAllEvents()
	end
	object.Show = noop
	object:Hide()
end

local function Point( obj, arg1, arg2, arg3, arg4, arg5 )
	if( type( arg1 ) == "number" ) then arg1 = Scale( arg1 ) end
	if( type( arg2 ) == "number" ) then arg2 = Scale( arg2 ) end
	if( type( arg3 ) == "number" ) then arg3 = Scale( arg3 ) end
	if( type( arg4 ) == "number" ) then arg4 = Scale( arg4 ) end
	if( type( arg5 ) == "number" ) then arg5 = Scale( arg5 ) end

	obj:SetPoint( arg1, arg2, arg3, arg4, arg5 )
end

local function SetTemplate( f, t, tex )
	if( tex ) then
		texture = C["media"].normTex 
	else 
		texture = C["media"].blank 
	end

	UpdateColor( t )

	f:SetBackdrop( {
		bgFile = texture,
		edgeFile = C.media.blank,
		tile = false, tileSize = 0, edgeSize = mult,
		insets = { left = -mult + inset, right = -mult + inset, top = -mult + inset, bottom = -mult + inset }
	} )

	f:SetBackdropColor( backdropr, backdropg, backdropb, backdropa )
	f:SetBackdropBorderColor( borderr, borderg, borderb )
end

local function Size( frame, width, height )
	frame:SetSize( Scale( width ), Scale( height or width ) )
end

local function SlideIn( self )
	if not self.anim then
		Animate( self )
	end

	self.anim.out1:Stop()
	self:Show()
	self.anim:Play()
end

local function SlideOut( self )
	if( self.anim ) then
		self.anim:Finish()
	end

	self.anim:Stop()
	self.anim.out1:Play()
end

local function StripTextures( object, kill )
	for i = 1, object:GetNumRegions() do
		local region = select( i, object:GetRegions() )
		if( region:GetObjectType() == "Texture" ) then
			if( kill ) then
				region:Kill()
			else
				region:SetTexture( nil )
			end
		end
	end
end

local function StyleButton( b, c )
    local name = b:GetName()
 
    local button = _G[name]
    local icon = _G[name .. "Icon"]
    local count = _G[name .. "Count"]
    local border = _G[name .. "Border"]
    local hotkey = _G[name .. "HotKey"]
    local cooldown = _G[name .. "Cooldown"]
    local nametext = _G[name .. "Name"]
    local flash = _G[name .. "Flash"]
    local normaltexture = _G[name .. "NormalTexture"]
	local icontexture = _G[name .. "IconTexture"]

	local hover = b:CreateTexture( "frame", nil, self )
	hover:SetTexture( 1, 1, 1, 0.3 )
	hover:SetHeight( button:GetHeight() )
	hover:SetWidth( button:GetWidth() )
	hover:Point( "TOPLEFT", button, 2, -2 )
	hover:Point( "BOTTOMRIGHT", button, -2, 2 )
	button:SetHighlightTexture( hover )

	local pushed = b:CreateTexture( "frame", nil, self )
	pushed:SetTexture( 0.9, 0.8, 0.1, 0.3 )
	pushed:SetHeight( button:GetHeight() )
	pushed:SetWidth( button:GetWidth() )
	pushed:Point( "TOPLEFT", button, 2, -2 )
	pushed:Point( "BOTTOMRIGHT", button, -2, 2 )
	button:SetPushedTexture( pushed )

	if( c ) then
		local checked = b:CreateTexture( "frame", nil, self )
		checked:SetTexture( 0, 1, 0, 0.3 )
		checked:SetHeight( button:GetHeight() )
		checked:SetWidth( button:GetWidth() )
		checked:Point( "TOPLEFT", button, 2, -2 )
		checked:Point( "BOTTOMRIGHT", button, -2, 2 )
		button:SetCheckedTexture( checked )
	end
end

local function Width( frame, width )
	frame:SetWidth( Scale( width ) )
end

S.Flash = function( self, duration )
	if not self.anim then
		S.SetUpAnimGroup( self )
	end

	self.anim.fadein:SetDuration( duration )
	self.anim.fadeout:SetDuration( duration )
	self.anim:Play()
end

S.SetUpAnimGroup = function( self )
	self.anim = self:CreateAnimationGroup( "Flash" )
	self.anim.fadein = self.anim:CreateAnimation( "ALPHA", "FadeIn" )
	self.anim.fadein:SetChange( 1 )
	self.anim.fadein:SetOrder( 2 )

	self.anim.fadeout = self.anim:CreateAnimation( "ALPHA", "FadeOut" )
	self.anim.fadeout:SetChange( -1 )
	self.anim.fadeout:SetOrder( 1 )
end

S.StopFlash = function( self )
	if( self.anim ) then
		self.anim:Finish()
	end
end

local function addapi( object )
	local mt = getmetatable( object ).__index
	if not object.Animate then mt.Animate = Animate end
	if not object.CreateBackdrop then mt.CreateBackdrop = CreateBackdrop end
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.CreatePanel then mt.CreatePanel = CreatePanel end
	if not object.CreateOverlay then mt.CreateOverlay = CreateOverlay end
	if not object.CreateShadow then mt.CreateShadow = CreateShadow end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
	if not object.FontString then mt.FontString = FontString end
	if not object.Height then mt.Height = Height end
	if not object.HighlightUnit then mt.HighlightUnit = HighlightUnit end
	if not object.Kill then mt.Kill = Kill end
	if not object.Point then mt.Point = Point end
	if not object.SetTemplate then mt.SetTemplate = SetTemplate end
	if not object.Size then mt.Size = Size end
	if not object.SlideIn then mt.SlideIn = SlideIn end
	if not object.SlideOut then mt.SlideOut = SlideOut end
	if not object.StripTextures then mt.StripTextures = StripTextures end
	if not object.StyleButton then mt.StyleButton = StyleButton end
	if not object.Width then mt.Width = Width end
	if not object.Flash then mt.Flash = Flash end
	if not object.StopFlash then mt.StopFlash = StopFlash end
end

local handled = { ["Frame"] = true }
local object = CreateFrame( "Frame" )
addapi( object )
addapi( object:CreateTexture() )
addapi( object:CreateFontString() )

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames( object )
end