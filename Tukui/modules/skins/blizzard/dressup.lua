local S, C, L = unpack( select( 2, ... ) )

local function LoadSkin()
	DressUpFrame:StripTextures( true )
	DressUpFrame:CreateBackdrop( "Transparent" )
	DressUpFrame.backdrop:CreateShadow( "Default" )
	DressUpFrame.backdrop:Point( "TOPLEFT", 6, 0 )
	DressUpFrame.backdrop:Point( "BOTTOMRIGHT", -32, 70 )

	S.SkinButton( DressUpFrameResetButton )
	S.SkinButton( DressUpFrameCancelButton )
	S.SkinCloseButton( DressUpFrameCloseButton, DressUpFrame.backdrop )
	if( S.toc < 40300 ) then
		S.SkinRotateButton( DressUpModelRotateLeftButton )
		S.SkinRotateButton( DressUpModelRotateRightButton )
		DressUpModelRotateRightButton:Point( "TOPLEFT", DressUpModelRotateLeftButton, "TOPRIGHT", 2, 0 )
	end
	DressUpFrameResetButton:Point( "RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0 )
end

tinsert( S.SkinFuncs["Tukui"], LoadSkin )