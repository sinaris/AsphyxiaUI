local S, C, L = unpack( Tukui )

local mult = 768 / string.match( GetCVar( "gxResolution" ), "%d+x(%d+)" ) / C["general"].uiscale
local Scale = function( x )
    return mult * math.floor( x / mult + .5 )
end

S.Scale = function( x ) return Scale( x ) end
S.mult = mult

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
	self.anim.in1:SetOffset( S.Scale( x ), S.Scale( y ) )
	self.anim.in2:SetOffset( S.Scale( -x ), S.Scale( -y ) )
	self.anim.out2:SetOffset( S.Scale( x ), S.Scale( y ) )
	self.anim.out1:SetScript( "OnFinished", function() self:Hide() end )
end

local function CreateBorder(f, i, o)
	if i then
		if f.iborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "InnerBorder" or nil, f)
		border:Point("TOPLEFT", mult, -mult)
		border:Point("BOTTOMRIGHT", -mult, mult)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = mult, 
			insets = { left = mult, right = mult, top = mult, bottom = mult }
		})
		border:SetBackdropBorderColor( 0, 0, 0 )
		f.iborder = border
	end

	if o then
		if f.oborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "OuterBorder" or nil, f)
		border:Point("TOPLEFT", -mult, mult)
		border:Point("BOTTOMRIGHT", mult, -mult)
		border:SetFrameLevel(f:GetFrameLevel() + 1)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = mult, 
			insets = { left = mult, right = mult, top = mult, bottom = mult }
		})
		border:SetBackdropBorderColor( 0, 0, 0 )
		f.oborder = border
	end
end

local function CreateLargeBorder( self, t, s )
	local border = CreateFrame( "Frame", "Border", self )
	border:SetPoint( "TOPLEFT", self, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
	if( t == "Transparent" or t == "t" ) then
		border:SetTemplate( "Transparent" )
	else
		border:SetTemplate( "Default" )
	end

	if( s == true ) then
		border:CreateShadow( "Default" )
	end
	border:SetFrameLevel( self:GetFrameLevel() )
end

local function CreateOverlay(f)
	if( f.overlay ) then return end

	local overlay = f:CreateTexture( f:GetName() and f:GetName() .. "Overlay" or nil, "BORDER", f )
	overlay:ClearAllPoints()
	overlay:Point( "TOPLEFT", 2, -2 )
	overlay:Point( "BOTTOMRIGHT", -2, 2 )
	overlay:SetTexture( C["media"].normTex )
	overlay:SetVertexColor( .05, .05, .05 )
	f.overlay = overlay
end

local function FadeIn( f )
	UIFrameFadeIn( f, .4, f:GetAlpha(), 1 )
end
	
local function FadeOut( f )
	UIFrameFadeOut( f, .8, f:GetAlpha(), 0 )
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

local function addapi( object )
	local mt = getmetatable( object ).__index
	if not object.Animate then mt.Animate = Animate end
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.CreateLargeBorder then mt.CreateLargeBorder = CreateLargeBorder end
	if not object.CreateOverlay then mt.CreateOverlay = CreateOverlay end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
	if not object.SlideIn then mt.SlideIn = SlideIn end
	if not object.SlideOut then mt.SlideOut = SlideOut end
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