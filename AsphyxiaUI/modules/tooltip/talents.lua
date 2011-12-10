local S, C, L = unpack( Tukui )

if( C["tooltip"].enable ~= true ) then return end

local gtt = GameTooltip
local GetTalentTabInfo = GetTalentTabInfo

local TALENTS_PREFIX = TALENTS .. ":|cffffffff "
local CACHE_SIZE = 25
local INSPECT_DELAY = 0.2
local INSPECT_FREQ = 2

local ttt = CreateFrame( "Frame", "TipTacTalents" )
local cache = {}
local current = {}

lastInspectRequest = 0

ttt.cache = cache
ttt.current = current
ttt:Hide()

local function GatherTalents( isInspect )
	local group = GetActiveTalentGroup( isInspect )
	local primaryTree = 1
	for i = 1, 3 do
		local _, _, _, _, pointsSpent = GetTalentTabInfo( i, isInspect, nil, group )
		current[i] = pointsSpent
		if( ( current[i] > current[primaryTree] ) ) then
			primaryTree = i
		end
	end
	local _, tabName = GetTalentTabInfo( primaryTree, isInspect, nil, group )
	current.tree = tabName

	local talentFormat = ( 1 )
	if( current[primaryTree] == 0 ) then
		current.format = L.tooltip_no_talent
	elseif( talentFormat == 1 ) then
		current.format = current.tree .. " (" .. current[1] .. "/" .. current[2] .. "/" .. current[3] .. ")"
	elseif( talentFormat == 2 ) then
		current.format = current.tree
	elseif( talentFormat == 3 ) then
		current.format = current[1] .. "/" .. current[2] .. "/" .. current[3]
	end

	if( not isInspect ) then
		gtt:AddLine( TALENTS_PREFIX .. current.format )
	elseif( gtt:GetUnit() ) then
		for i = 2, gtt:NumLines() do
			if( ( _G["GameTooltipTextLeft" .. i]:GetText() or "" ):match( "^" .. TALENTS_PREFIX ) ) then
				_G["GameTooltipTextLeft" .. i]:SetFormattedText( "%s%s", TALENTS_PREFIX, current.format )

				if( not gtt.fadeOut ) then
					gtt:Show()
				end
				break;
			end
		end
	end

	local cacheSize = ( CACHE_SIZE )
	for i = #cache, 1, -1 do
		if( current.name == cache[i].name ) then
			tremove( cache, i )
			break;
		end
	end
	if( #cache > cacheSize ) then
		tremove( cache, 1 )
	end

	if( cacheSize > 0 ) then
		cache[#cache + 1] = CopyTable( current )
	end
end

ttt:SetScript( "OnEvent", function( self, event, guid )
	self:UnregisterEvent( event )
	if( guid == current.guid ) then
		GatherTalents( 1 )
	end
end )

ttt:SetScript( "OnUpdate", function( self, elapsed )
	self.nextUpdate = ( self.nextUpdate - elapsed )
	if( self.nextUpdate <= 0 ) then
		self:Hide()

		if( UnitGUID( "mouseover" ) == current.guid ) then
			lastInspectRequest = GetTime()
			self:RegisterEvent( "INSPECT_READY" )

			if( InspectFrame ) then
				InspectFrame.unit = "player"
			end
			NotifyInspect( current.unit )
		end
	end
end )

gtt:HookScript( "OnTooltipSetUnit", function( self, ... )
	ttt:Hide()

	local _, unit = self:GetUnit()
	if( not unit ) then
		local mFocus = GetMouseFocus()
		if( mFocus ) and ( mFocus.unit ) then
			unit = mFocus.unit
		end
	end

	if( not unit ) or ( not UnitIsPlayer( unit ) ) then
		return
	end

	local level = UnitLevel( unit )
	if( level > 9 or level == -1 ) then
		wipe( current )
		current.unit = unit
		current.name = UnitName( unit )
		current.guid = UnitGUID( unit )

		if( UnitIsUnit( unit, "player" ) ) then
			GatherTalents()
			return
		end

		local cacheLoaded = false
		for _, entry in ipairs( cache ) do
			if( current.name == entry.name ) then
				self:AddLine( TALENTS_PREFIX .. entry.format )
				current.tree = entry.tree
				current.format = entry.format
				current[1], current[2], current[3] = entry[1], entry[2], entry[3]
				cacheLoaded = true
				break
			end
		end

		local isInspectOpen = ( InspectFrame and InspectFrame:IsShown() ) or ( Examiner and Examiner:IsShown() )
		if( CanInspect( unit ) ) and ( not isInspectOpen ) then
			local lastInspectTime = ( GetTime() - lastInspectRequest )
			ttt.nextUpdate = ( lastInspectTime > INSPECT_FREQ ) and INSPECT_DELAY or ( INSPECT_FREQ - lastInspectTime + INSPECT_DELAY )
			ttt:Show()
			if( not cacheLoaded ) then
				self:AddLine( TALENTS_PREFIX .. L.tooltip_loading )
			end
		end
	end
end )