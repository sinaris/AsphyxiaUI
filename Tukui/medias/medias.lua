local S, C, L = unpack( select( 2, ... ) )

C["media"] = {
	["font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=],
	["uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]],
	["dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]],

	["de_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=],
	["de_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]],
	["de_dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]],

	["fr_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=],
	["fr_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]],
	["fr_dmgfont"] = [=[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]=],

	["ru_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=],
	["ru_uffont"] = [[Fonts\ARIALN.TTF]],
	["ru_dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font_rus.ttf]],

	["tw_font"] = [=[Fonts\bLEI00D.ttf]=],
	["tw_uffont"] = [[Fonts\bLEI00D.ttf]],
	["tw_dmgfont"] = [[Fonts\bLEI00D.ttf]],

	["kr_font"] = [=[Fonts\2002.TTF]=],
	["kr_uffont"] = [[Fonts\2002.TTF]],
	["kr_dmgfont"] = [[Fonts\2002.TTF]],

	["cn_font"] = [=[Fonts\ZYKai_T.TTF]=],
	["cn_uffont"] = [[Fonts\ZYHei.TTF]],
	["cn_dmgfont"] = [[Fonts\ZYKai_C.TTF]],

	["asphyxiafont"] = [=[Interface\Addons\Tukui\medias\fonts\asphyxia_font.ttf]=],
	["pixelfont"] = [=[Interface\Addons\Tukui\medias\fonts\pixel_font.ttf]=],
	["pixelfont_ru"] = [[Interface\AddOns\SinarisUI\media\fonts\pixelfont_ru.ttf]],
	["chatfont"] = [[Interface\AddOns\Tukui\medias\fonts\chat_font.ttf]],

	["normTex"] = [[Interface\AddOns\Tukui\medias\textures\normTex]],
	["glowTex"] = [[Interface\AddOns\Tukui\medias\textures\glowTex]],
	["bubbleTex"] = [[Interface\AddOns\Tukui\medias\textures\bubbleTex]],
	["copyicon"] = [[Interface\AddOns\Tukui\medias\textures\copy]],
	["blank"] = [[Interface\AddOns\Tukui\medias\textures\blank]],
	["switchlayoutheal"] = [[Interface\AddOns\Tukui\medias\textures\switch_layout_heal]],
	["switchlayoutdd"] = [[Interface\AddOns\Tukui\medias\textures\switch_layout_dd]],
	["asphyxia"] = [[Interface\AddOns\Tukui\medias\textures\asphyxia]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },

	["whisper"] = [[Interface\AddOns\Tukui\medias\sounds\whisper.mp3]],
	["warning"] = [[Interface\AddOns\Tukui\medias\sounds\warning.mp3]],
}

PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_defensive]]
PET_PASSIVE_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_passive]]
PET_ATTACK_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_attack]]
PET_FOLLOW_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_follow]]
PET_WAIT_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_wait]]
PET_MOVE_TO_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_moveto]]
PET_ASSIST_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_assist]]

-------------------------------------------------------------------
-- Used to overwrite default medias outside Tukui
-------------------------------------------------------------------

local settings = TukuiEditedDefaultConfig
if settings then
	local media = settings.media
	if media then
		for option, value in pairs(media) do
			C.media[option] = value
		end
	end
end