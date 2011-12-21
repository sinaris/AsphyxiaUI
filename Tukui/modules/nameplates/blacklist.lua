local S, C, L = unpack( select( 2, ... ) )

local function SpellName( id )
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo( id ) 	
	return name
end

S.PlateBlacklist = {
	["Earth Elemental Totem"] = true,
	["Fire Elemental Totem"] = true,
	["Fire Resistance Totem"] = true,
	["Flametongue Totem"] = true,
	["Frost Resistance Totem"] = true,
	["Healing Stream Totem"] = true,
	["Magma Totem"] = true,
	["Mana Spring Totem"] = true,
	["Nature Resistance Totem"] = true,
	["Searing Totem"] = true,
	["Stoneclaw Totem"] = true,
	["Stoneskin Totem"] = true,
	["Strength of Earth Totem"] = true,
	["Windfury Totem"] = true,
	["Totem of Wrath"] = true,
	["Wrath of Air Totem"] = true,

	["Army of the Dead Ghoul"] = true,

	["Venomous Snake"] = true,
	["Viper"] = true,
}