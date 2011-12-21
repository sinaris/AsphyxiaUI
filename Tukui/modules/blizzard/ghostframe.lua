local S, C, L = unpack( select( 2, ... ) )

GhostFrame:SetTemplate( "Default" )
GhostFrame:SetBackdropColor( 0, 0, 0, 0 )
GhostFrame:SetBackdropBorderColor( 0, 0, 0, 0 )
GhostFrame.SetBackdropColor = S.dummy
GhostFrame.SetBackdropBorderColor = S.dummy

GhostFrameContentsFrame:SetTemplate( "Default" )
GhostFrameContentsFrame:CreateShadow()
GhostFrameContentsFrameIcon:SetTexture( nil )
GhostFrameContentsFrame:Width( 148 )
GhostFrameContentsFrame:ClearAllPoints()
GhostFrameContentsFrame:SetPoint( "CENTER" )
GhostFrameContentsFrame.SetPoint = S.dummy

GhostFrame:SetFrameStrata( "HIGH" )
GhostFrame:SetFrameLevel( 10 )
GhostFrame:ClearAllPoints()
GhostFrame:Point( "TOP", UIParent, 0, -75 )

GhostFrameContentsFrameText:ClearAllPoints()
GhostFrameContentsFrameText:Point( "BOTTOM", 0, 5 )