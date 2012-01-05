local S, C, L = unpack( select( 2, ... ) )

local function LoadSkin()
	TaxiFrame:StripTextures()
	TaxiFrame:CreateBackdrop( "Transparent" )
	TaxiRouteMap:CreateBackdrop( "Transparent" )
	TaxiRouteMap.backdrop:SetAllPoints()
	S.SkinCloseButton( TaxiFrameCloseButton )
end

tinsert( S.SkinFuncs["Tukui"], LoadSkin )