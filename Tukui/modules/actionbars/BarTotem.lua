local S, C, L = unpack( select( 2, ... ) )

if( C["actionbar"].enable ~= true ) then return end

if( S.myclass == "SHAMAN" ) then
	if( MultiCastActionBarFrame ) then
		MultiCastActionBarFrame:SetScript( "OnUpdate", nil )
		MultiCastActionBarFrame:SetScript( "OnShow", nil )
		MultiCastActionBarFrame:SetScript( "OnHide", nil )
		MultiCastActionBarFrame:SetParent( TukuiShiftBar )
		MultiCastActionBarFrame:ClearAllPoints()
		MultiCastActionBarFrame:Point( "BOTTOMLEFT", TukuiShiftBar, -3, 23 )

		hooksecurefunc( "MultiCastActionButton_Update", function( actionbutton )
			if not InCombatLockdown() then
				actionbutton:SetAllPoints( actionbutton.slotButton )
			end
		end )
		
		MultiCastActionBarFrame.SetParent = S.dummy
		MultiCastActionBarFrame.SetPoint = S.dummy
		MultiCastRecallSpellButton.SetPoint = S.dummy
	end
end