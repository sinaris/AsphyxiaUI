local S, C, L = unpack( Tukui )

local function CreateBorder( self, t, s )
	--if( self:GetFrameStrata() == "BACKGROUND" ) then self:SetFrameStrata( "LOW" ) end

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

local function addapi( object )
	local mt = getmetatable( object ).__index
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
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