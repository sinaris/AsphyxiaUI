local S, C, L = unpack( select( 2, ... ) )

if( S.toc < 40300 ) then return end

if( C["actionbar"].enable ~= true ) then return end

local holder = CreateFrame( "Frame", "TukuiExtraActionBarFrameHolder", UIParent )
holder:Size( 160, 80 )
holder:SetPoint( "BOTTOM", 0, 250 )
holder:SetMovable( true )
holder:SetTemplate( "Default" )
holder:SetBackdropBorderColor( 0, 0, 0, 0 )
holder:SetBackdropColor( 0, 0, 0, 0 )	
holder.text = S.SetFontString( holder, C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
holder.text:SetPoint( "CENTER" )
holder.text:SetText( L.move_extrabutton )
holder.text:Hide()

ExtraActionBarFrame:SetParent( holder )
ExtraActionBarFrame:ClearAllPoints()
ExtraActionBarFrame:SetPoint( "CENTER", holder, "CENTER", 0, 0 )

local button = ExtraActionButton1
local icon = button.icon
local texture = button.style
local disableTexture = function( style, texture )
	if( string.sub( texture, 1, 9 ) == "Interface" ) then
		style:SetTexture( "" )
	end
end
button.style:SetTexture( "" )
hooksecurefunc( texture, "SetTexture", disableTexture )

icon:SetTexCoord( .08, .92, .08, .92 )
icon:Point( "TOPLEFT", button, 2, -2 )
icon:Point( "BOTTOMRIGHT", button, -2, 2 )
icon:SetDrawLayer( "ARTWORK" )

button:StyleButton( true )
button:SetTemplate( "Default" )
button:CreateShadow( "Default" )