local S, C, L = unpack( select( 2, ... ) )

if S.myclass == "WIZARD" then
	C["actionbar"].hotkey = false
	C["actionbar"].hideshapeshift = true
	C["unitframes"].enemyhcolor = true
end

if( S.myname == "Sinaris" or S.myname == "Ris" or S.myname == "Wrocasia" or S.myname == "Wrocas" ) then -- little Game Master power i have to my account ;)
	C["unitframes"].healcomm = true
	C["unitframes"].showsolo = true
	C["unitframes"].aggro = true
	C["unitframes"].raidunitdebuffwatch = true
	C["unitframes"].showplayerinparty = true
end
