local S, C, L = unpack( select( 2, ... ) )

local pWidth, pHeight = C["databars"]["settings"].width, C["databars"]["settings"].height
for i = 1, #S.databars do
	if not S.databars[i]:IsShown() then
		S.databars[i]:SetHeight( C["databars"]["settings"].padding )
	end
end