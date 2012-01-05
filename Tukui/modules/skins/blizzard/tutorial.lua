local S, C, L = unpack( select( 2, ... ) )

local function LoadSkin()
	TutorialFrame:StripTextures()
	TutorialFrame:CreateBackdrop( "Transparent" )
	TutorialFrame.backdrop:CreateShadow( "Default" )
	TutorialFrame.backdrop:Point( "TOPLEFT", 6, 0 )
	TutorialFrame.backdrop:Point( "BOTTOMRIGHT", 6, -6 )
	S.SkinCloseButton( TutorialFrameCloseButton, TutorialFrameCloseButton.backdrop )
	S.SkinNextPrevButton( TutorialFramePrevButton )
	S.SkinNextPrevButton( TutorialFrameNextButton )
	S.SkinButton( TutorialFrameOkayButton )
	TutorialFrameOkayButton:ClearAllPoints()
	TutorialFrameOkayButton:Point( "LEFT", TutorialFrameNextButton,"RIGHT", 10, 0 )
end

tinsert( S.SkinFuncs["Tukui"], LoadSkin )