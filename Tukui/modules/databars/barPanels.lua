local S, C, L = unpack( select ( 2, ... ) )

local pWidth, pHeight = C["databars"]["settings"].width, C["databars"]["settings"].height
S["databars"] = {}

S.maxDatabars = 0
for i, v in pairs( C["databars"] ) do
	if( type( v ) == "number" ) then S.maxDatabars = max( S.maxDatabars, v ) end
end
if( S.maxDatabars == 0 ) then return end

for i = 1, S.maxDatabars do
	S.databars[i] = CreateFrame( "Frame", "TukuiDataBar" .. i .. "_Panel", UIParent )
	S.databars[i]:CreateShadow()
	if( i == 1 ) then
		S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPLEFT", UIParent, "TOPLEFT", 2, -8 )
	else
		if( C["databars"]["settings"].vertical ) then
			S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPRIGHT", S.databars[i - 1], "BOTTOMRIGHT", 0, -C["databars"]["settings"].spacing )
		else
			S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPLEFT", S.databars[i - 1], "TOPRIGHT", C["databars"]["settings"].spacing, 0 )
		end
	end
	
	S.databars[i].statusbar = CreateFrame( "StatusBar",  "TukuiDataBar" .. i .. "_StatusBar", S.databars[i], "TextStatusBar" )
	S.databars[i].statusbar:SetFrameStrata( "BACKGROUND" )
	S.databars[i].statusbar:SetStatusBarTexture( C["media"].normTex )
	S.databars[i].statusbar:SetStatusBarColor( 1, 1, 1 )
	S.databars[i].statusbar:SetFrameLevel( 2 )
	S.databars[i].statusbar:SetPoint( "TOPRIGHT", S.databars[i], "TOPRIGHT", -2, -2 )
	S.databars[i].statusbar:SetPoint( "BOTTOMLEFT", S.databars[i], "BOTTOMLEFT", 2, 2 )
	S.databars[i].statusbar:SetMinMaxValues( 0, 1 )
	S.databars[i].statusbar:SetValue( 0 )

	S.databars[i].text = S.databars[i].statusbar:CreateFontString( "DataBar" .. i .. "_Text", "OVERLAY" )
	S.databars[i].text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	S.databars[i].text:SetPoint( "CENTER", S.databars[i].statusbar, "CENTER", 0, 1 )
end


local function hideDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Hide()
	end
	self.text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "open" )
	self:ClearAllPoints()
	self:SetPoint( S.databars[1]:GetPoint() )
end

local function showDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Show()
	end
	self.text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "close" )
	self:ClearAllPoints()
	if not C["databars"]["settings"].vertical then
		self:SetPoint( "LEFT", S.databars[S.maxDatabars], "RIGHT", C["databars"]["settings"].spacing, 0 )
	else
		self:SetPoint( "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -C["databars"]["settings"].spacing )
	end
end

S.databars["toggle"] = CreateFrame( "Frame", "TukuiDataBarToggle", UIParent )
S.databars["toggle"]:SetAlpha( 0 )
S.databars["toggle"].text = S.databars["toggle"]:CreateFontString( nil, "OVERLAY" )
S.databars["toggle"].text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.databars["toggle"].text:SetJustifyH( "LEFT" )
S.databars["toggle"].text:SetPoint( "CENTER", 2 )
S.databars["toggle"].text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. CLOSE )

if( C["databars"]["settings"].vertical ) then
	S.databars["toggle"]:CreatePanel( "Transparent", pWidth, C["databars"]["settings"].height, "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -C["databars"]["settings"].spacing )
else
	S.databars["toggle"]:CreatePanel( "Transparent", pWidth, C["databars"]["settings"].height, "LEFT", S.databars[S.maxDatabars], "RIGHT", C["databars"]["settings"].spacing, 0 )
end
S.databars["toggle"]:CreateShadow()

S.databars["toggle"]:EnableMouse( true )
S.databars["toggle"]:HookScript( "OnMouseDown", function( self ) 
	if( S.databars[1]:IsShown() ) then
		hideDatabars( self )
	else
		showDatabars( self )
	end
end )
S.databars["toggle"]:HookScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
S.databars["toggle"]:HookScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )