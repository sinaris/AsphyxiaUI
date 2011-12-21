local S, C, L = unpack( select( 2, ... ) )

if not C["datatext"].expertise or C["datatext"].expertise == 0 then return end

local Stat = CreateFrame( "Frame", "TukuiStatExpertise" )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:EnableMouse( true )
Stat:SetFrameLevel( 3 )
Stat.Color1 = S.RGBToHex( unpack( C["media"].datatextcolor1 ) )
Stat.Color2 = S.RGBToHex( unpack( C["media"].datatextcolor2 ) )

local Text = Stat:CreateFontString( "TukuiStatExpertiseText", "OVERLAY" )
Text:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "MONOCHROMEOUTLINE" )
S.PP( C["datatext"].expertise, Text )

local _G = getfenv( 0 )
local format = string.format
local displayModifierString = string.join( "", "%s", Stat.Color2, "%d|r" )

local int = 5
local function Update( self, t )
	int = int - t
	if( int > 0 ) then return end

	local expertise, offhandExpertise = GetExpertise()
	local speed, offhandSpeed = UnitAttackSpeed( "player" )
	local text
	if( offhandSpeed ) then
		text = expertise .. " / " .. offhandExpertise
	else
		text = expertise
	end
	Text:SetFormattedText( displayModifierString, Stat.Color1 .. STAT_EXPERTISE .. ": ", text )
	self:SetAllPoints( Text )
	int = 2
end

Stat:SetScript( "OnEnter", function( self )
	local anchor, panel, xoff, yoff = S.DataTextTooltipAnchor( Text )
	GameTooltip:SetOwner( panel, anchor, xoff, yoff )
	GameTooltip:ClearLines()

	local expertise, offhandExpertise = GetExpertise()
	local expertisePercent, offhandExpertisePercent = GetExpertisePercent()
	expertisePercent = format( "%.2f", expertisePercent )
	offhandExpertisePercent = format( "%.2f", offhandExpertisePercent)

	local expertiseDisplay, expertisePercentDisplay
	if( IsDualWielding() ) then
		expertiseDisplay = expertise .. " / " .. offhandExpertise
		expertisePercentDisplay = expertisePercent .. "% / " .. offhandExpertisePercent .. "%"
	else
		expertiseDisplay = expertise
		expertisePercentDisplay = expertisePercent .. "%"
	end

	GameTooltip:SetText( HIGHLIGHT_FONT_COLOR_CODE .. format( PAPERDOLLFRAME_TOOLTIP_FORMAT, _G["COMBAT_RATING_NAME" .. CR_EXPERTISE]) .. " " .. expertiseDisplay .. FONT_COLOR_CODE_CLOSE )
	GameTooltip:AddLine( format( CR_EXPERTISE_TOOLTIP, expertisePercentDisplay, GetCombatRating( CR_EXPERTISE ), GetCombatRatingBonus( CR_EXPERTISE ) ), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true )
	GameTooltip:AddLine( " " )

	GameTooltip:AddDoubleLine( STAT_TARGET_LEVEL, DODGE_CHANCE, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b )
	local playerLevel = UnitLevel( "player" )
	for i = 0, 3 do
		local mainhandDodge, offhandDodge = GetEnemyDodgeChance( i )
		mainhandDodge = format( "%.2f%%", mainhandDodge )
		offhandDodge = format( "%.2f%%", offhandDodge )
		local level = playerLevel + i
		if( i == 3 ) then
			level = level .. " / |TInterface\\TargetingFrame\\UI-TargetingFrame-Skull:0|t"
		end
		local dodgeDisplay
		if( IsDualWielding() and mainhandDodge ~= offhandDodge ) then
			dodgeDisplay = mainhandDodge .. " / " .. offhandDodge
		else
			dodgeDisplay = mainhandDodge .. "  "
		end
		GameTooltip:AddDoubleLine( "      " .. level, dodgeDisplay .. "  ", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b )
	end

	GameTooltip:AddLine( " " )
	GameTooltip:AddDoubleLine( STAT_TARGET_LEVEL, PARRY_CHANCE, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b )
	local playerLevel = UnitLevel( "player" )
	for i = 0, 3 do
		local mainhandParry, offhandParry = GetEnemyParryChance( i )
		mainhandParry = format( "%.2f%%", mainhandParry )
		offhandParry = format( "%.2f%%", offhandParry )
		local level = playerLevel + i
		if( i == 3 ) then
			level = level .. " / |TInterface\\TargetingFrame\\UI-TargetingFrame-Skull:0|t"
		end
		local parryDisplay
		if( IsDualWielding() and mainhandParry ~= offhandParry ) then
			parryDisplay = mainhandParry .. " / " .. offhandParry
		else
			parryDisplay = mainhandParry .. "  "
		end
		GameTooltip:AddDoubleLine( "      " .. level, parryDisplay .. "  ", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b )
	end
	
	GameTooltip:Show()
end )
Stat:SetScript( "OnLeave", function() GameTooltip:Hide() end )
Stat:SetScript( "OnUpdate", Update )
Update( Stat, 6 )