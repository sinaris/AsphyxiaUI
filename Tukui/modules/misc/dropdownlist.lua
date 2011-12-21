local S, C, L = unpack( select( 2, ... ) )

local function SkinDropDownList( level, index )
	for i = 1, UIDROPDOWNMENU_MAXLEVELS do
		local menubackdrop = _G["DropDownList" .. i .. "MenuBackdrop"]
		local backdrop = _G["DropDownList" .. i .. "Backdrop"]
		if not backdrop.isSkinned then
			menubackdrop:SetTemplate( "Transparent" )
			backdrop:SetTemplate( "Transparent" )
			backdrop.isSkinned = true
		end
	end
end
hooksecurefunc( "UIDropDownMenu_CreateFrames", SkinDropDownList )