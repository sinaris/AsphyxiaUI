local addon, engine = ...
engine[1] = {}
engine[2] = {}
engine[3] = {}

Tukui = engine

local S, C, L = unpack( select( 2, ... ) )

S.dummy = function() return end
S.myname = select( 1, UnitName( "player" ) )
S.myclass = select( 2, UnitClass( "player" ) )
S.myrace = select( 2, UnitRace( "player" ) )
S.myfaction = UnitFactionGroup( "player" )
S.client = GetLocale() 
S.resolution = GetCVar( "gxResolution" )
S.screenheight = tonumber( string.match( S.resolution, "%d+x(%d+)" ) )
S.screenwidth = tonumber( string.match( S.resolution, "(%d+)x+%d" ) )
S.version = GetAddOnMetadata( "Tukui", "Version" )
S.xversion = GetAddOnMetadata( "Tukui", "X-Version" )
S.versionnumber = tonumber( S.version )
S.incombat = UnitAffectingCombat( "player" )
S.patch, S.buildtext, S.releasedate, S.toc = GetBuildInfo()
S.build = tonumber( S.buildtext )
S.level = UnitLevel( "player" )
S.myrealm = GetRealmName()
S.InfoLeftRightWidth = 370

if not TukuiSaved then
	TukuiSaved = {	
		["bottomrows"] = 1,
		["rightbars"] = 1,
		["splitbars"] = false,
		["actionbarsLocked"] = false,
	}
end