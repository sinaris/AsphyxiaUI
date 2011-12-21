local S, C, L = unpack( select( 2, ... ) )

local function SpellName( id )
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo( id ) 	
	return name
end

S.ChannelTicks = {
	[SpellName( 689 )] = 3,
	[SpellName( 5740 )] = 4,
	[SpellName( 755 )] = 3,

	[SpellName( 44203 )] = 4,
	[SpellName( 16914 )] = 10,

	[SpellName( 15407 )] = 3,
	[SpellName( 48045 )] = 5,
	[SpellName( 47540 )] = 2,

	[SpellName( 5143 )] = 5,
	[SpellName( 10 )] = 5,
	[SpellName( 12051 )] = 4,
}

S.ArenaBuffWhiteList = {
	[SpellName( 1022 )] = true,
	[SpellName( 12051 )] = true,
	[SpellName( 2825 )] = true,
	[SpellName( 32182 )] = true,
	[SpellName( 33206 )] = true,
	[SpellName( 29166 )] = true,
	[SpellName( 18708 )] = true,
	[SpellName( 54428 )] = true,
	[SpellName( 31821 )] = true,

	[SpellName( 871 )] = true,
	[SpellName( 48707 )] = true,
	[SpellName( 31224 )] = true,
	[SpellName( 19263 )] = true,
	[SpellName( 47585 )] = true,

	[SpellName( 45438 )] = true,
	[SpellName( 642 )] = true,

	[SpellName( 31884 )] = true,
	[SpellName( 34471 )] = true,
	[SpellName( 85696 )] = true,
	[SpellName( 467 )] = true,
}

S.DebuffWhiteList = {
	[SpellName( 47476 )] = true,
	[SpellName( 49203 )] = true,

	[SpellName( 33786 )] = true,
	[SpellName( 2637 )] = true,
	[SpellName( 339 )] = true,
	[SpellName( 80964 )] = true,
	[SpellName( 78675 )] = true,

	[SpellName( 3355 )] = true,
	[SpellName( 1513 )] = true,
	[SpellName( 19503 )] = true,
	[SpellName( 34490 )] = true,

	[SpellName( 31661 )] = true,
	[SpellName( 61305 )] = true,
	[SpellName( 18469 )] = true,
	[SpellName( 122 )] = true,
	[SpellName( 55080 )] = true,
	[SpellName( 82691 )] = true,

	[SpellName( 20066 )] = true,
	[SpellName( 10326 )] = true,
	[SpellName( 853 )] = true,

	[SpellName( 605 )] = true,
	[SpellName( 64044 )] = true,
	[SpellName( 8122 )] = true,
	[SpellName( 9484 )] = true,
	[SpellName( 15487 )] = true,

	[SpellName( 2094 )] = true,
	[SpellName( 1776 )] = true,
	[SpellName( 6770 )] = true,
	[SpellName( 18425 )] = true,

	[SpellName( 51514 )] = true,
	[SpellName( 3600 )] = true,
	[SpellName( 8056 )] = true,
	[SpellName( 63685 )] = true,
	[SpellName( 39796 )] = true,

	[SpellName( 710 )] = true,
	[SpellName( 6789 )] = true,
	[SpellName( 5782 )] = true,
	[SpellName( 5484 )] = true,
	[SpellName( 6358 )] = true,
	[SpellName( 30283 )] = true,
	[SpellName( 89605 )] = true,

	[SpellName( 20511 )] = true,

	[SpellName( 25046 )] = true,
	[SpellName( 20549 )] = true,
}

S.TargetPVPOnly = {
	[SpellName( 34438 )] = true,
	[SpellName( 34914 )] = true,
	[SpellName( 31935 )] = true,
	[SpellName( 63529 )] = true,
	[SpellName( 19386 )] = true,
	[SpellName( 116 )] = true,
	[SpellName( 58179 )] = true,
	[SpellName( 18223 )] = true,
	[SpellName( 18118 )] = true,
	[SpellName( 31589 )] = true,
	[SpellName( 44572 )] = true,
}

S.DebuffBlacklist = {
	[SpellName( 8733 )] = true,
	[SpellName( 57724 )] = true,
	[SpellName( 25771 )] = true,
	[SpellName( 57723 )] = true,
	[SpellName( 36032 )] = true,
	[SpellName( 58539 )] = true,
	[SpellName( 26013 )] = true,
	[SpellName( 6788 )] = true,
	[SpellName( 71041 )] = true,
	[SpellName( 41425 )] = true,
	[SpellName( 55711 )] = true,
	[SpellName( 8326 )] = true,
	[SpellName( 23445 )] = true,
	[SpellName( 24755 )] = true,
	[SpellName( 25163 )] = true,
	[SpellName( 80354 )] = true,
	[SpellName( 95223 )] = true,
}

--RAID DEBUFFS
S.RaidDebuffs = {
	[SpellName( 67479 )] = true, -- Impale

	--Blackwing Descent
	[SpellName( 91911 )] = true, -- Constricting Chains
	[SpellName( 94679 )] = true, -- Parasitic Infection
	[SpellName( 94617 )] = true, -- Mangle
	[SpellName( 78199 )] = true, -- Sweltering Armor
	[SpellName( 91433 )] = true, --Lightning Conductor
	[SpellName( 91521 )] = true, --Incineration Security Measure
	[SpellName( 80094 )] = true, --Fixate 
	[SpellName( 77699 )] = true, -- Flash Freeze
	[SpellName( 77760 )] = true, -- Biting Chill
	[SpellName( 92423 )] = true, -- Searing Flame
	[SpellName( 92485 )] = true, -- Roaring Flame
	[SpellName( 92407 )] = true, -- Sonic Breath
	[SpellName( 82881 )] = true, -- Break
	[SpellName( 89084 )] = true, -- Low Health
	[SpellName( 92956 )] = true, --Wrack

	--The Bastion of Twilight
	[SpellName( 92878 )] = true, -- Blackout
	[SpellName( 86840 )] = true, -- Devouring Flames
	[SpellName( 95639 )] = true, -- Engulfing Magic
	[SpellName( 93051 )] = true, -- Twilight Shift
	[SpellName( 92886 )] = true, -- Twilight Zone
	[SpellName( 88518 )] = true, -- Twilight Meteorite
	[SpellName( 39171 )] = true, -- Malevolent Strikes
	[SpellName( 92511 )] = true, -- Hydro Lance
	[SpellName( 82762 )] = true, -- Waterlogged
	[SpellName( 92505 )] = true, -- Frozen
	[SpellName( 92518 )] = true, -- Flame Torrent
	[SpellName( 83099 )] = true, -- Lightning Rod
	[SpellName( 92075 )] = true, -- Gravity Core
	[SpellName( 92488 )] = true, -- Gravity Crush
	[SpellName( 86028 )] = true, -- Cho's Blast
	[SpellName( 86029 )] = true, -- Gall's Blast

	--Throne of the Four Winds
	[SpellName( 93131 )] = true, --Ice Patch
	[SpellName( 86206 )] = true, --Soothing Breeze
	[SpellName( 93122 )] = true, --Toxic Spores
	[SpellName( 93058 )] = true, --Slicing Gale
	[SpellName( 93260 )] = true, -- Ice Storm
	[SpellName( 93295 )] = true, -- Lightning Rod
	
	--Firelands
	[SpellName( 99506 )] = true, -- Widows Kiss
	[SpellName( 101296 )] = true, -- Fiero Blast
	[SpellName( 100723 )] = true, -- Gushing Wound
	[SpellName( 99837 )] = true, -- Crystal Prison
	[SpellName( 99937 )] = true, -- Jagged Tear
	[SpellName( 99403 )] = true, -- Tormented
	[SpellName( 98450 )] = true, -- Searing Seeds
	[SpellName( 99399 )] = true, -- Burning Wound
	[SpellName( 99532 )] = true, -- Melt Armor
}


S.ReverseTimer = {
	[92956] = true,
	[89435] = true,
	[92955] = true,
	[89421] = true,
}