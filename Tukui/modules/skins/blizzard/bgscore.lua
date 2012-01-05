local S, C, L = unpack( select( 2, ... ) )

local function LoadSkin()
	WorldStateScoreScrollFrame:StripTextures()
	S.SkinScrollBar( WorldStateScoreScrollFrameScrollBar )
	WorldStateScoreFrame:StripTextures()
	WorldStateScoreFrame:SetTemplate( "Transparent" )
	S.SkinCloseButton( WorldStateScoreFrameCloseButton )
	WorldStateScoreFrameInset:Kill()
	S.SkinButton( WorldStateScoreFrameLeaveButton )

	for i = 1, WorldStateScoreScrollFrameScrollChildFrame:GetNumChildren() do
		local b = _G["WorldStateScoreButton" .. i]
		b:StripTextures()
		b:StyleButton( false )
		b:SetTemplate( "Transparent", true )
	end

	for i = 1, 3 do
		S.SkinTab( _G["WorldStateScoreFrameTab" .. i] )
	end
end

tinsert( S.SkinFuncs["Tukui"], LoadSkin )