local S, C, L = unpack( Tukui )

if( C["chat"].enable ~= true ) then return end

local function Skin( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]

	tab:SetAlpha( 1 )
	tab.SetAlpha = S.dummy
	--tab:HookScript( "OnClick", function() editbox:Hide() end )
	
	if( C["chat"].background ~= true ) then
		tabtext:Hide()
		tab:HookScript("OnEnter", function() _G[chat .. "TabText"]:Show() end )
		tab:HookScript("OnLeave", function() _G[chat .. "TabText"]:Hide() end )
	end

	_G[chat .. "TabText"]:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	if id < 11 then
		_G[chat .. "TabText"]:SetTextColor( unpack( C["media"].datatextcolor2 ) )
		_G[chat .. "TabText"].SetTextColor = S.dummy
	end

	frame.isSkinned = true
end

TukuiChat:HookScript( "OnEvent", function( self, event, addon )
	if( addon == "Blizzard_CombatLog" ) then
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format( "ChatFrame%s", i )]
			frame:SetShadowOffset( 0, 0 )
			Skin( frame )
		end

	end
end )

local function SkinTempChat()
	local frame = FCF_GetCurrentChatFrame()

	if frame.isSkinned then return end

	Skin( frame )
end
hooksecurefunc( "FCF_OpenTemporaryWindow", SkinTempChat )

S.SetDefaultChatPosition = function( frame )
	if( frame ) then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo( id )

		if( id == 1 ) then
			frame:ClearAllPoints()
			frame:Point( "TOPLEFT", TukuiTabsLeftBackground, "BOTTOMLEFT", 0, -1 )
			frame:Point( "BOTTOMRIGHT", TukuiInfoLeft, "TOPRIGHT", 0, 4 )

		elseif( id == 4 and name == LOOT ) then
			if not frame.isDocked then
				frame:Point( "TOPLEFT", TukuiTabsRightBackground, "BOTTOMLEFT", 0, -1 )
				frame:Point( "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 4 )
			end
		end

		FCF_SavePositionAndDimensions( frame )

		if not frame.isLocked then FCF_SetLocked( frame, 1 ) end
	end
end
hooksecurefunc( "FCF_RestorePositionAndDimensions", S.SetDefaultChatPosition )