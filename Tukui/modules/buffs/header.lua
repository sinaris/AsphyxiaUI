local S, C, L = unpack( select( 2, ... ) )

if( C["auras"].player ~= true ) then return end

local frame = TukuiAuras
local content = TukuiAuras.content

for _, frame in next, {
	"TukuiAurasPlayerBuffs",
	"TukuiAurasPlayerDebuffs",
	"TukuiAurasPlayerConsolidate",
}

do
	local header

	local wrap
	if( S.lowversion )then
		wrap = 8
	else
		wrap = 15
	end

	if( frame == "TukuiAurasPlayerConsolidate" ) then
		header = CreateFrame( "Frame", frame, UIParent, "SecureFrameTemplate" )
		header:SetAttribute( "wrapAfter", 1 )
		header:SetAttribute( "wrapYOffset", -35 )
	else
		header = CreateFrame( "Frame", frame, UIParent, "SecureAuraHeaderTemplate" )
		header:SetClampedToScreen( true )
		header:SetMovable( true )
		header:SetAttribute( "minHeight", 30 )
		header:SetAttribute( "wrapAfter", wrap )
		header:SetAttribute( "wrapYOffset", -67.5 )
		header:SetAttribute( "xOffset", -33 )
	end
	header:SetAttribute( "minWidth", wrap * 35 )
	header:SetAttribute( "template", "TukuiAurasAuraTemplate" )
	header:SetAttribute( "weaponTemplate", "TukuiAurasAuraTemplate" )
	header:SetSize( 30, 30 )

	RegisterAttributeDriver( header, "unit", "[vehicleui] vehicle; player" )

	table.insert( content, header )
end

local buffs = TukuiAurasPlayerBuffs
local debuffs = TukuiAurasPlayerDebuffs
local consolidate = TukuiAurasPlayerConsolidate
local filter = 0

if( C["auras"].consolidate == true )then
	filter = 1
end

buffs:SetPoint( "TOPRIGHT", UIParent, -204, -10 )
buffs:SetAttribute( "filter", "HELPFUL" )
buffs:SetAttribute( "consolidateProxy", CreateFrame( "Frame", buffs:GetName() .. "ProxyButton", buffs, "TukuiAurasProxyTemplate" ) )
buffs:SetAttribute( "consolidateHeader", consolidate )
buffs:SetAttribute( "consolidateTo", filter )
buffs:SetAttribute( "includeWeapons", 1 )

buffs:SetAttribute( "consolidateDuration", -1 )
buffs:Show()

local proxy = buffs:GetAttribute( "consolidateProxy" )
proxy:HookScript( "OnShow", function( self )
	if( consolidate:IsShown() ) then
		consolidate:Hide()
	end
end )

local dropdown = CreateFrame( "BUTTON", "TukuiAurasPlayerConsolidateDropdownButton", proxy, "SecureHandlerClickTemplate" )
dropdown:SetAllPoints()
dropdown:RegisterForClicks( "AnyUp" )
dropdown:SetAttribute( "_onclick", [=[
	local header = self:GetParent():GetFrameRef"header"

	local numChild = 0
	repeat
		numChild = numChild + 1
		local child = header:GetFrameRef( "child" .. numChild )
	until not child or not child:IsShown()

	numChild = numChild - 1

	local x, y = self:GetWidth(), self:GetHeight()
	header:SetWidth( x )
	header:SetHeight( y )

	if( header:IsShown() ) then
		header:Hide()
	else
		header:Show()
	end
]=] )

consolidate:SetAttribute( "point", "RIGHT" )
consolidate:SetAttribute( "minHeight", nil )
consolidate:SetAttribute( "minWidth", nil )
consolidate:SetParent( proxy )
consolidate:ClearAllPoints()
consolidate:SetPoint( "CENTER", proxy, "CENTER", 0, -35 )
consolidate:Hide()
SecureHandlerSetFrameRef( proxy, "header", consolidate )

debuffs:SetPoint( "TOPRIGHT", UIParent, -204, -148 )
debuffs:SetAttribute( "filter", "HARMFUL" )
debuffs:Show()

if S.toc < 40300 then return end
-- its time for consolidate buffs get working again.
-- WIP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
local function WorkAround( self, event, unit )
	local num, i, count = 0, 0, 0

	while true do
		local name, _, _, _, _, _, _, _, _, consolidate = UnitAura( "player", i + 1 )
		if not name then break end

		if not consolidate or not C["auras"].consolidate then
			num = num + 1
		else
			count = count + 1
		end

		i = i + 1
	end

	for i, button in self:ActiveButtons() do
		button:SetAlpha( i > num and 0 or 1 )
	end
end

buffs:HookScript( "OnEvent", WorkAround )

local function Child( self, i )
	i = i + 1

	local child = self:GetAttribute( "child" .. i )
	if child and child:IsShown() then
		return i, child, child:GetAttribute( "index" )
	end
end

function buffs:ActiveButtons() return Child, self, 0 end