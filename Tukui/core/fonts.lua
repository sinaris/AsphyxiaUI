local S, C, L = unpack( select( 2, ... ) )

if( S.client == "ruRU" ) then
	C["media"].uffont = C["media"].ru_uffont
	C["media"].font = C["media"].ru_font
	C["media"].dmgfont = C["media"].ru_dmgfont
elseif( S.client == "zhTW" ) then
	C["media"].uffont = C["media"].tw_uffont
	C["media"].font = C["media"].tw_font
	C["media"].dmgfont = C["media"].tw_dmgfont
elseif( S.client == "koKR" ) then
	C["media"].uffont = C["media"].kr_uffont
	C["media"].font = C["media"].kr_font
	C["media"].dmgfont = C["media"].kr_dmgfont
elseif( S.client == "frFR" ) then
	C["media"].uffont = C["media"].fr_uffont
	C["media"].font = C["media"].fr_font
	C["media"].dmgfont = C["media"].fr_dmgfont
elseif( S.client == "deDE" ) then
	C["media"].uffont = C["media"].de_uffont
	C["media"].font = C["media"].de_font
	C["media"].dmgfont = C["media"].de_dmgfont
elseif( S.client == "zhCN" ) then
	C["media"].uffont = C["media"].cn_uffont
	C["media"].font = C["media"].cn_font
	C["media"].dmgfont = C["media"].cn_dmgfont
end