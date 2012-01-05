local S, C, L = unpack( select( 2, ... ) )

local function LoadSkin()
	ColorPickerFrame:CreateBackdrop( "Transparent" )
	S.SkinButton( ColorPickerOkayButton )
	S.SkinButton( ColorPickerCancelButton )
	ColorPickerOkayButton:ClearAllPoints()
	ColorPickerOkayButton:Point( "RIGHT", ColorPickerCancelButton,"LEFT", -2, 0 )

	for i = 1, ColorPickerFrame:GetNumRegions() do
		local region = select( i, ColorPickerFrame:GetRegions() )
		if( region:GetObjectType() == "Texture" and ( region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Border" or region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Background" or region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Header" ) ) then
			region:SetTexture( nil )
		end
	end
end

tinsert( S.SkinFuncs["Tukui"], LoadSkin )