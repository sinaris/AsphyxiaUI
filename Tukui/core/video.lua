local S, C, L = unpack( select( 2, ... ) )

if( S.screenwidth < 1600 ) then
	if( C["general"].overridelowtohigh == true ) then
		C["general"].autoscale = false
		S.lowversion = false
	else
		S.lowversion = true
	end
elseif( S.screenwidth >= 3840 ) or ( UIParent:GetWidth() + 1 > S.screenwidth ) then
	local width = S.screenwidth
	local height = S.screenheight

	if( width >= 9840 ) then width = 3280 end
	if( width >= 7680 and width < 9840 ) then width = 2560 end
	if( width >= 5760 and width < 7680 ) then width = 1920 end
	if( width >= 5040 and width < 5760 ) then width = 1680 end

	if( width >= 4800 and width < 5760 and height == 900 ) then width = 1600 end

	if( width >= 4320 and width < 4800 ) then width = 1440 end
	if( width >= 4080 and width < 4320 ) then width = 1360 end
	if( width >= 3840 and width < 4080 ) then width = 1224 end

	if( width < 1600 and C["general"].overridelowtohigh ~= true ) then
		S.lowversion = true
	end

	S.eyefinity = width
end

if( S.lowversion ) then
	S.raidscale = 0.8
else
	S.raidscale = 1
end

if( C["general"].autoscale == true ) then
	C["general"].uiscale = min( 2, max( .64, 768 / string.match( S.resolution, "%d+x(%d+)" ) ) )
end

local function NeedReloadUI()
	local resolution = Graphics_ResolutionDropDown
	local x, y = resolution:getValues()
	local oldratio = S.screenwidth / S.screenheight
	local newratio = x / y
	local oldreso = S.resolution
	local newreso = x .. "x" .. y

	if( oldratio == newratio ) and ( oldreso ~= newreso ) then
		ReloadUI()
	end
end

local Graphic = CreateFrame( "Frame" )
Graphic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
Graphic:SetScript( "OnEvent", function( self, event )
	local useUiScale = GetCVar( "useUiScale" )
	if( useUiScale ~= "1" ) then
		SetCVar( "useUiScale", 1 )
	end

	local gxMultisample = GetCVar( "gxMultisample" )
	if( C["general"].multisampleprotect == true and gxMultisample ~= "1" ) then
		SetMultisampleFormat( 1 )
	end

	if( C["general"].uiscale > 1 ) then C["general"].uiscale = 1 end
	if( C["general"].uiscale < 0.64 ) then C["general"].uiscale = 0.64 end

	if( format( "%.2f", GetCVar( "uiScale" ) ) ~= format( "%.2f", C["general"].uiscale ) ) then
		S.FullMapQuestTaintFix = true

		SetCVar( "uiScale", C["general"].uiscale )
	end

	if( S.eyefinity ) then
		local width = S.eyefinity
		local height = S.screenheight

		if not C.general.autoscale or height > 1200 then
			local h = UIParent:GetHeight()
			local ratio = S.screenheight / h
			local w = S.eyefinity / ratio

			width = w
			height = h
		end

		UIParent:SetSize( width, height )
		UIParent:ClearAllPoints()
		UIParent:SetPoint( "CENTER" )
	end

	VideoOptionsFrameOkay:HookScript( "OnClick", NeedReloadUI )
	VideoOptionsFrameApply:HookScript( "OnClick", NeedReloadUI )

	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )
end )