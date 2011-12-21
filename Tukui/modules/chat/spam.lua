local S, C, L = unpack( select( 2, ... ) )

if( C["chat"].enable ~= true ) then return end

if( S.client ~= "enUS" and S.client ~= "enGB" ) then return end

function S.SPELL_FILTER( self, event, arg1 )
	if( strfind( arg1, "You have unlearned" ) or strfind( arg1, "You have learned a new spell:" ) or strfind( arg1, "You have learned a new ability:" ) or strfind( arg1, "Your pet has unlearned" ) ) then
		return true
	end
end
ChatFrame_AddMessageEventFilter( "CHAT_MSG_SYSTEM", S.SPELL_FILTER )

local function GOLDSPAM_FILTER()
	if( GetMinimapZoneText() == "Valley of Strength" or GetMinimapZoneText() == "Trade District" ) then
		ChatFrame_AddMessageEventFilter( "CHAT_MSG_TEXT_EMOTE", S.FUCKYOU_GOLDSPAMMERS )
	else
		ChatFrame_RemoveMessageEventFilter( "CHAT_MSG_TEXT_EMOTE", S.FUCKYOU_GOLDSPAMMERS )
	end
end

function S.FUCKYOU_GOLDSPAMMERS( self, event, arg1 )
	if strfind( arg1, "falls asleep. Zzzzzzz." ) then
		return true
	end
end

local GOLDSPAM = CreateFrame( "Frame" )
GOLDSPAM:RegisterEvent( "PLAYER_ENTERING_WORLD" )
GOLDSPAM:RegisterEvent( "ZONE_CHANGED_INDOORS" )
GOLDSPAM:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
GOLDSPAM:SetScript( "OnEvent", GOLDSPAM_FILTER )