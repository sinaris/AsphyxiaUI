local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].currency or C["datatext"].currency == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatCurrency" )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 3 )
Stat.Option = C["datatext"].currency
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatCurrencyText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].currency, Text )

local function update()
	local _text = Stat.Color2 .. "---" .. "|r"
	for i = 1, MAX_WATCHED_TOKENS do
		local name, count, _, _, _ = GetBackpackCurrencyInfo( i )
		if( name and count ) then
			if( i ~= 1 ) then
				_text = _text .. " "
			else
				_text = ""
			end

			local words = { strsplit( " ", name ) }
			for _, word in ipairs( words ) do
				_text = _text .. Stat.Color1 .. string.sub( word, 1, 1 ) .. "|r"
			end
			_text = _text .. Stat.Color1..": |r" .. Stat.Color2 .. count .. "|r"
		end
	end

	Text:SetText( _text )
end

local function OnEvent( self, event, ... )
	update()
	self:SetAllPoints( Text )
	Stat:UnregisterEvent( "PLAYER_LOGIN" )
end

Stat:RegisterEvent( "PLAYER_LOGIN" )
hooksecurefunc( "BackpackTokenFrame_Update", update )
Stat:SetScript( "OnEvent", OnEvent )
Stat:SetScript( "OnMouseDown", function() ToggleCharacter( "TokenFrame" ) end )