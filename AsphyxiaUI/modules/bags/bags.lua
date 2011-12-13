local S, C, L = unpack( Tukui )

if( C["bags"].enable ~= true ) then return end

TukuiBags:ClearAllPoints()
TukuiBags:CreateShadow( "Default" )
if not C["actionbar"].enable then
	if not C["chat"].background then
		TukuiBags:SetPoint("BOTTOMLEFT", TukuiInfoRight, "TOPLEFT", 0, 3)
	else
		TukuiBags:SetPoint("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3)
	end
else
	if not C["chat"].background then
		TukuiBags:SetPoint("BOTTOMLEFT", TukuiInfoRight, "TOPLEFT", 0, 3)
	elseif HasPetUI() then
		if C["actionbar"].vertical_rightbars then
			TukuiBags:SetPoint("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3)
		else
			TukuiBags:SetPoint("BOTTOM", TukuiPetBar, "TOP", 0, 3)
		end
	elseif UnitHasVehicleUI("player") then
		TukuiBags:SetPoint("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3)
	else
		if C["actionbar"].vertical_rightbars then
			TukuiBags:SetPoint("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3)
		else
			TukuiBags:SetPoint("BOTTOMRIGHT", BlindBagFrame, "TOPRIGHT", 0, 3)
		end
	end
end

local function BagsPosition( self, value )
	local bag = _G["Tukui" .. value]
	if( value == "Bank" ) then
		if( C["chat"].background ~= true ) then
			bag:SetPoint( "BOTTOMLEFT", TukuiInfoLeft, "TOPLEFT", 0, 3 )
		else
			bag:SetPoint( "BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 0, 3 )
		end
	end

	bag:CreateShadow( "Default" )
end

hooksecurefunc( Stuffing, "CreateBagFrame", BagsPosition )