local S, C, L = unpack( select( 2, ... ) )

if( S.client == "esES" or S.client == "esMX" ) then
	L.chat_BATTLEGROUND_GET = "B"
	L.chat_BATTLEGROUND_LEADER_GET = "B"
	L.chat_BN_WHISPER_GET = "De"
	L.chat_GUILD_GET = "G"
	L.chat_OFFICER_GET = "O"
	L.chat_PARTY_GET = "P"
	L.chat_PARTY_GUIDE_GET = "P"
	L.chat_PARTY_LEADER_GET = "P"
	L.chat_RAID_GET = "R"
	L.chat_RAID_LEADER_GET = "R"
	L.chat_RAID_WARNING_GET = "RW"
	L.chat_WHISPER_GET = "De"
	L.chat_FLAG_AFK = "[AUS]"
	L.chat_FLAG_DND = "[DND]"
	L.chat_FLAG_GM = "[GM]"
	L.chat_ERR_FRIEND_ONLINE_SS = "is now |cff298F00online|r"
	L.chat_ERR_FRIEND_OFFLINE_S = "is now |cffff0000offline|r"

	L.chat_general = "General"
	L.chat_trade = "Comercio"
	L.chat_defense = "DefensaLocal"
	L.chat_recrutment = "ReclutamientoHermandad"
	L.chat_lfg = "BuscandoGrupo"

	L.disband = "¿Deshacer grupo?"

	L.datatext_notalents ="Sin Talentos"
	L.datatext_download = "Descarga: "
	L.datatext_bandwidth = "Ancho de banda: "
	L.datatext_guild = "Hermandad"
	L.datatext_noguild = "Sin Hermandad"
	L.datatext_bags = "Mochila: "
	L.datatext_friends = "Amigos"
	L.datatext_online = "Conectados: "
	L.datatext_armor = "Armadura"
	L.datatext_earned = "Ganado:"
	L.datatext_spent = "Gastado:"
	L.datatext_deficit = "Balance:"
	L.datatext_profit = "Beneficios:"
	L.datatext_timeto = "Tiempo para:"
	L.datatext_friendlist = "Lista de Amigos:"
	L.datatext_playersp = "PH"
	L.datatext_playerap = "PA"
	L.datatext_playerhaste = "Celeridad"
	L.datatext_dps = "Dps"
	L.datatext_hps = "Sps"
	L.datatext_playerarp = "ArP"
	L.datatext_session = "Sesión: "
	L.datatext_character = "Personaje: "
	L.datatext_server = "Reino: "
	L.datatext_totalgold = "Total: "
	L.datatext_savedraid = "Mazmorras Registradas"
	L.datatext_currency = "Monedas:"
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " Sanación"
	L.datatext_avoidancebreakdown = "Desglose de Evasión"
	L.datatext_lvl = "nivel"
	L.datatext_boss = "Jefe"
	L.datatext_miss = "Fallo"
	L.datatext_dodge = "Esquiva"
	L.datatext_block = "Bloqueo"
	L.datatext_parry = "Parada"
	L.datatext_playeravd = "avd: "
	L.datatext_servertime = "Hora del servidor: "
	L.datatext_localtime = "Hora Local: "
	L.datatext_mitigation = "Mitigación por Nivel: "
	L.datatext_healing = "Sanación : "
	L.datatext_damage = "Daño : "
	L.datatext_honor = "Honor : "
	L.datatext_killingblows = "Golpes de Gracia: "
	L.datatext_ttstatsfor = "Estadísticas para "
	L.datatext_ttkillingblows = "Golpes de Gracia:"
	L.datatext_tthonorkills = "Golpes de Gracia con Honor:"
	L.datatext_ttdeaths = "Muertes :"
	L.datatext_tthonorgain = "Honor Ganado:"
	L.datatext_ttdmgdone = "Daño Realizado:"
	L.datatext_tthealdone = "Sanación Realizada :"
	L.datatext_basesassaulted = "Bases Asaltadas:"
	L.datatext_basesdefended = "Bases Defendidas:"
	L.datatext_towersassaulted = "Torres Asaltadas:"
	L.datatext_towersdefended = "Torres Defendidas:"
	L.datatext_flagscaptured = "Banderas Capturadas:"
	L.datatext_flagsreturned = "Banderas Devueltas:"
	L.datatext_graveyardsassaulted = "Cementerios Asaltados:"
	L.datatext_graveyardsdefended = "Cementerios Defendidos:"
	L.datatext_demolishersdestroyed = "Catapultas Destruidas:"
	L.datatext_gatesdestroyed = "Puertas Destruidas:"
	L.datatext_totalmemusage = "Total de Memoria Usada:"
	L.datatext_control = "Controlado por:"
	L.datatext_cta_allunavailable = "Could not get Call To Arms information."
	L.datatext_cta_nodungeons = "No dungeons are currently offering a Call To Arms."

	L.Slots = {
		[1] = { 1, "Cabeza", 1000 },
		[2] = { 3, "Hombro", 1000 },
		[3] = { 5, "Pecho", 1000 },
		[4] = { 6, "Cintura", 1000 },
		[5] = { 9, "Muñeca", 1000 },
		[6] = { 10, "Manos", 1000 },
		[7] = { 7, "Piernas", 1000 },
		[8] = { 8, "Pies", 1000 },
		[9] = { 16, "Mano Derecha", 1000 },
		[10] = { 17, "Mano Izquierda", 1000 },
		[11] = { 18, "A Distancia", 1000 }
	}

	L.popup_disableui = "Tukui no funciona con esta resolución, ¿Quieres desactivar Tukui? (Pulsa cancelar si quieres probar otra resolución)"
	L.popup_install = "Es la primera vez que usas Tukui V14 con este personaje. Debes recargar la Interfaz para ajustar las barras de acción, las variables y los marcos de chat."
	L.popup_2raidactive = "Hay dos entornos disponibles para bandas, por favor selecciona uno."
	L.popup_reset = "¡Cuidado! Esto reiniciará Tukui por completo. ¿Quieres continuar?"
	L.popup_install_yes = "¡Sí! (¡recomendado!)"
	L.popup_install_no = "No, ¡realmente apesta!"
	L.popup_reset_yes = "¡Oh, si nena!"
	L.popup_reset_no = "No, ¡preguntare en los foros!"
	L.popup_fix_ab = "Algo anda mal con tu barra de acción. ¿Quieres recargar la IU para arreglarlo?"

	L.merchant_repairnomoney = "¡No tienes suficiente dinero para reparar!"
	L.merchant_repaircost = "Tus objetos han sido reparados por: "
	L.merchant_repair_guild = "Your items have been repaired using guild bank funds for:"
	L.merchant_repair_personal = "Your items have been repaired for:"
	L.merchant_trashsell = "Has vendido toda la basura a cambio de: "

	L.goldabbrev = "|cffffd700g|r"
	L.silverabbrev = "|cffc7c7cfs|r"
	L.copperabbrev = "|cffeda55fc|r"

	L.error_noerror = "Aún sin errores."

	L.unitframes_ouf_offline = "Desconectado"
	L.unitframes_ouf_dead = "Muerto"
	L.unitframes_ouf_ghost = "Fantasma"
	L.unitframes_ouf_lowmana = "Mana Bajo"
	L.unitframes_ouf_threattext = "Amenaza en el objetivo:"
	L.unitframes_ouf_offlinedps = "Desconectado"
	L.unitframes_ouf_deaddps = "|cffff0000[Muerto]|r"
	L.unitframes_ouf_ghostheal = "FANTASMA"
	L.unitframes_ouf_deadheal = "MUERTO"
	L.unitframes_ouf_gohawk = "HALCÓN YA!"
	L.unitframes_ouf_goviper = "VÍBORA YA!"
	L.unitframes_disconnected = "D/C"
	L.unitframes_ouf_wrathspell = "Cólera"
	L.unitframes_ouf_starfirespell = "Fuego Estelar"

	L.tooltip_count = "Count"
	L.tooltip_loading = "Loading Talents..." -- NEED TRANS
	L.tooltip_no_talent = "No Talents" -- NEED TRANS

	L.bags_noslots = "¡no puedes comprar más espacios!"
	L.bags_costs = "Costo: %.2f oro"
	L.bags_buyslots = "Compra un nuevo espacio mediante '/bags purchase yes'"
	L.bags_openbank = "Necesitas abrir el banco primero."
	L.bags_sort = "Ordena tu bolsa, o tu banco si está abierto."
	L.bags_stack = "Llena los montones incompletos en tu bolsa, o en tu banco si está abierto"
	L.bags_buybankslot = "Compra un espacio en el banco. (Necesitas tener el banco abierto)"
	L.bags_search = "Buscar"
	L.bags_sortmenu = "Ordenar"
	L.bags_sortspecial = "Ordenar Especial"
	L.bags_stackmenu = "Amontonar"
	L.bags_stackspecial = "Amontonar Especial"
	L.bags_showbags = "Mostrar Bolsas"
	L.bags_sortingbags = "Se ha acabado de ordenar."
	L.bags_nothingsort= "No hay nada que ordenar."
	L.bags_bids = "Usando las bolsas: "
	L.bags_stackend = "Se ha acabado de amontonar."
	L.bags_rightclick_search = "Click derecho para buscar."

	L.loot_fish = "Botín de Pesca"
	L.loot_empty = "Espacio Vacío"

	L.chat_invalidtarget = "Objetivo Invalido"

	L.mount_wintergrasp = "Conquista De Invierno"

	L.mail_need = "Need a mailbox."
	L.mail_messages = "Messages"

	L.core_autoinv_enable = "Auto Invitar ON: invite"
	L.core_autoinv_enable_c = "Auto Invitar ON: "
	L.core_autoinv_disable = "Auto Invitar OFF"
	L.core_wf_unlock = "Registro de Misiones Desbloqueado"
	L.core_wf_lock = "Registro de Misiones Bloqueado"
	L.core_welcome1 = "Bienvenido a |cffC495DDTukui|r versión "
	L.core_welcome2 = "Escribe |cff00FFFF/uihelp|r para más información o visita |cff00FFFFwww.tukui.org|r"

	L.core_uihelp1 = "|cff00ff00Comandos Generales|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - Desbloquea y mueve elementos por la pantalla."
	L.core_uihelp3 = "|cffFF0000/rl|r - Recarga la interfaz del usuario."
	L.core_uihelp4 = "|cffFF0000/gm|r - Envia un ticket a un MJ o muestra la ayuda en juego del WoW."
	L.core_uihelp5 = "|cffFF0000/frame|r - Detecta el nombre del marco sobre el que tienes el cursor. (muy util para editores de lua)"
	L.core_uihelp6 = "|cffFF0000/heal|r - Activa el perfil de banda de sanación."
	L.core_uihelp7 = "|cffFF0000/dps|r - Activa el perfil de banda de Dps/Tanque."
	L.core_uihelp8 = "|cffFF0000/bags|r - Para buscar, comprar un hueco del banco o amontonar objetos en tus bolsas."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Resetea Tukui por completo."
	L.core_uihelp10 = "|cffFF0000/rd|r - Deshacer banda."
	L.core_uihelp11 = "|cffFF0000/ainv|r - Activa el autoinvitar via palabra clave en susurro. Puedes escoger la palabra clave escribiendo `/ainv palabraclave`"
	L.core_uihelp100 = "(Sube el chat para ver mas comandos ...)"

	L.core_asphyxiauihelp_header = "|cff00AAFFAsphyxiaUI " .. S.xversion .. "|r - Help" -- TRANS NEEDED
	L.core_asphyxiauihelp_button1 = "Information" -- TRANS NEEDED
	L.core_asphyxiauihelp_button2 = "Unitframes" -- TRANS NEEDED
	L.core_asphyxiauihelp_button3 = "Actionbars" -- TRANS NEEDED
	L.core_asphyxiauihelp_button4 = "Panels, Nameplates" -- TRANS NEEDED
	L.core_asphyxiauihelp_button5 = "Minimap, Chat" -- TRANS NEEDED
	L.core_asphyxiauihelp_button6 = "Extra AddOns, Skins" -- TRANS NEEDED
	L.core_asphyxiauihelp_button7 = "Reported Issues" -- TRANS NEEDED
	L.core_asphyxiauihelp_button8 = "Credits" -- TRANS NEEDED
	L.core_asphyxiauihelp_button9 = "Donation" -- TRANS NEEDED

	L.core_asphyxiauihelp_entry0_title = ""
	L.core_asphyxiauihelp_entry0_line1 = "Please select a category" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry0_line2 = ""
	L.core_asphyxiauihelp_entry0_line3 = ""
	L.core_asphyxiauihelp_entry0_line4 = ""
	L.core_asphyxiauihelp_entry0_line5 = ""
	L.core_asphyxiauihelp_entry0_line6 = ""

	L.core_asphyxiauihelp_entry1_title = "Information" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry1_line1 = "AsphyxiaUI is a heavily modified version of Tukui. AsphyxiaUI is a complete UI replacement." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry1_line2 = "For detailed information visit:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry1_line3 = "|cff00FFFFhttp://www.tukui.org/forums/forum.php?id=165|r\nor\n|cff00FFFFhttps://github.com/Sinaris/AsphyxiaUI|r" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry1_line4 = ""
	L.core_asphyxiauihelp_entry1_line5 = "You can use the following slash-commands:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry1_line6 = "|cffEAC117/scp|r - Unlock sCombo bar to move.\n|cffEAC117/testui uf|r or |cffEAC117/testui unitframes|r -  Test mode for unitframes.\n|cffEAC117/testui a|r or |cffEAC117/testui arena|r - Test mode for arenaframes.\n|cffEAC117/testui b|r or |cffEAC117/testui boss|r - Test mode for bossframes.\n|cffEAC117/ali|r - Alignment grid." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry2_title = "Unitframes" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line1 = "There are five different unitframe layouts. You can change them without editing the original LUA files." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line2 = "Follow this steps to change the unitframe layout:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line3 = "Open the Tukui ConfigUI (type /tc into your chat)." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line4 = "Goto: Asphyxia. Now you can see a inputbox named 'AsphyxiaUI Layout'." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line5 = "You can choose between asphyxia, asphyxia2, asphyxia3, asphyxia4 and smelly." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry2_line6 = "After changing the layout click onto 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the unitframes are changed." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry3_title = "Actionbars" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry3_line1 = "There is a seperate config ui for the actionbars. Click onto 'Control Panel' at the bottom of the actionbars. Now click onto 'Actionbar Config'" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry3_line2 = "Now you can change the actionbars to whatever you want." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry3_line3 = ""
	L.core_asphyxiauihelp_entry3_line4 = ""
	L.core_asphyxiauihelp_entry3_line5 = ""
	L.core_asphyxiauihelp_entry3_line6 = ""

	L.core_asphyxiauihelp_entry4_title = "Panels, Nameplates" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line1 = "There is a seperate 'Control Panel' on the bottom of the screen." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line2 = "Left button: after clicking this button the UI will be reloaded and the default AsphyxiaUI settings will be loaded." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line3 = "Middle button: open the AsphyxiaUI Control Panel." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line4 = "Right button: reload the UI." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line5 = "The AsphyxiaUI nameplates have several tweaks. You can enable or disable the debuff and cc tracking into the Tukui ConfigUI.\nFollow this steps to change the settings:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry4_line6 = "Open the Tukui ConfigUI (type /tc into your chat)\nGoto: Nameplates\nNow you can enable or disable the debuff and/or cc tracking onto the nameplates." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry5_title = "Minimap, Chat"
	L.core_asphyxiauihelp_entry5_line1 = "You can show or hide the minimap by clicking the left button at the minimap. There are also the buttons for the help frame and the Tukui version frame." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry5_line2 = "The minimap buttons are skinned too. So if you are using DBM, Skada or other addons with a seperate minimap button, this button will be skinned as well." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry5_line3 = "You can change the height and/or width of the chatframes." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry5_line4 = "Follow this steps to change the chat frames:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry5_line5 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: Chat" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry5_line6 = "There are two inputfields names chatheight and chatwidth. You can change the default values to whatever you want.\n\nAfter you are done click 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the chatframes are changed." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry6_title = "Extra AddOns, Skins" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line1 = "There are some extra addons included into AsphyxiaUI. You will find some credits and other informations about this under the 'Credits' section." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line2 = "AsphyxiaUI has some nice and cool looking skins for the following AddOns:\nBalancePowerTracker, BigWigs, DeadlyBossMods, DeuxVox, Omen, Recount, Skada and TinyDPS." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line3 = "You can change these settings by follow these steps:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line4 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: Addon Skins.\n\nNow you can enable or disable the needed skins. You can also activate the embed right for Skada or Recount." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line5 = "The default Blizzard-Frames are also skinned to match the rest of the AsphyxiaUI. If you don't like them you can disable it by follow these steps:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry6_line6 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: General\n\nNow you can enable or disable the skinning for the Blizzard-Frames." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry7_title = "Reported Issues" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry7_line1 = "I worked hard, very hard. So, i know that there are some issues into the AsphyxiaUI." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry7_line2 = "If you founds something the looks ugly or if you think that can be a bug, errors or whatever, let me know about them." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry7_line3 = ""
	L.core_asphyxiauihelp_entry7_line4 = "You can post your erros here (please read the guidline to report bugs and erros):" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry7_line5 = "|cff00FFFFhttp://www.tukui.org/forums/topic.php?id=18608|r" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry7_line6 = ""

	L.core_asphyxiauihelp_entry8_title = "Credits" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry8_line1 = "First: Asphyxia, the creator of this UI. thank you for this awesome job. I hope the 'new' AsphyxiaUI is that what you want." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry8_line2 = "Some other credits goto: Caith, Caellian, Shestak, Haste, Tekkub, Alza, Roth, P3lim, Tulla, Hungtar, hankthetank, Ishtara, Haleth and others..." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry8_line3 = ""
	L.core_asphyxiauihelp_entry8_line4 = "Special thanks to: Asi, my forum bitch! xD" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry8_line5 = ""
	L.core_asphyxiauihelp_entry8_line6 = "If i missed someone, let me know it and i will add them onto the list." -- TRANS NEEDED

	L.core_asphyxiauihelp_entry9_title = "Donation" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry9_line1 = "It's not easy to create a new UI, giving support for all other users and pushing updates as much as i can." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry9_line2 = "Feel free to give some donations for this UI." -- TRANS NEEDED
	L.core_asphyxiauihelp_entry9_line3 = "You can do this here:\n|cff00FFFFhttp://www.tukui.org/forums/topic.php?id=18539|r" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry9_line4 = ""
	L.core_asphyxiauihelp_entry9_line5 = "I have to say thank you to the following donators:" -- TRANS NEEDED
	L.core_asphyxiauihelp_entry9_line6 = "|cff00AAFFMastamage, Calaglin|r" -- TRANS NEEDED

	L.core_asphyxiauihelp_revision = "rev.: 1.0" -- TRANS NEEDED

	L.core_controlpanel_controlpanel_header = "Control Panel Menu" -- TRANS NEEDED
	L.core_controlpanel_controlpanel_abconfig = "Actionbar Config" -- TRANS NEEDED
	L.core_controlpanel_controlpanel_configui = "Config UI" -- TRANS NEEDED
	L.core_controlpanel_controlpanel_moveui = "Move UI" -- TRANS NEEDED

	L.core_controlpanel_abconfigmenu_header = "Actionbar Config Menu" -- TRANS NEEDED
	L.core_controlpanel_abconfigmenu_locked = "Actionbars |cffe45050Locked|r" -- TRANS NEEDED
	L.core_controlpanel_abconfigmenu_unlocked = "Actionbars |cff50e468Unlocked|r" -- TRANS NEEDED
	L.core_controlpanel_abconfigmenu_lock = "|cffe45050Lock|r" -- TRANS NEEDED
	L.core_controlpanel_abconfigmenu_unlock = "|cff50e468Unlock|r" -- TRANS NEEDED

	L.addons_toggle = "Toggle" -- TRANS NEEDED

	L.symbol_CLEAR = "Nada"
	L.symbol_SKULL = "Calavera"
	L.symbol_CROSS = "Cruz"
	L.symbol_SQUARE = "Cuadrado"
	L.symbol_MOON = "Luna"
	L.symbol_TRIANGLE = "Triangulo"
	L.symbol_DIAMOND = "Diamante"
	L.symbol_CIRCLE = "Circulo"
	L.symbol_STAR = "Estrella"

	L.bind_combat = "No puedes asignar teclas en combate."
	L.bind_saved = "La configuración de las teclas ha sido guardada."
	L.bind_discard = "Se han descartado los cambios en la configuración de las teclas."
	L.bind_instruct = "Coloca el cursor encima de cualquier botón para asignar una tecla. Presiona la tecla ESC o el botón derecho del ratón para quitar la asignación actual."
	L.bind_save = "Guardar los cambios"
	L.bind_discardbind = "Descartar los cambios"

	L.hunter_unhappy = "Tu mascota está descontenta!"
	L.hunter_content = "Tu mascota está contenta!"
	L.hunter_happy = "Tu mascota está feliz!"

	L.move_tooltip = "Mover Descripción"
	L.move_minimap = "Mover Minimapa"
	L.move_watchframe = "Mover Misiones"
	L.move_gmframe = "Mover Ticket"
	L.move_buffs = "Mover Beneficios del Jugador"
	L.move_debuffs = "Mover Perjuicios del Jugador"
	L.move_shapeshift = "Mover Barra de cambio de forma/Totems"
	L.move_achievements = "Mover Logros"
	L.move_roll = "Mover Marco de Lanzamiento de Dados por Botín"
	L.move_vehicle = "Mover Asiento del vehiculo"
	L.move_extrabutton = "Botón Extra"

	L.install_header_1 = "Bienvenido/a"
	L.install_header_2 = "1. Esencial"
	L.install_header_3 = "2. Marcos de Unidad"
	L.install_header_4 = "3. Características"
	L.install_header_5 = "4. ¡Cosas que deberías saber!"
	L.install_header_6 = "5. Comandos"
	L.install_header_7 = "6. Finalizado"
	L.install_header_8 = "1. Configuración esencial"
	L.install_header_9 = "2. Social"
	L.install_header_10= "3. Marcos"
	L.install_header_11= "4. ¡Listo!"

	L.install_init_line_1 = "¡Gracias por escoger Tukui!"
	L.install_init_line_2 = "Se te guiará a través de un proceso de instalación en simples pasos. En cada uno de ellos podrás decidir qué quieres y que no quieres aplicar o saltar ese paso."
	L.install_init_line_3 = "También se te da la posibilidad de mostrarte un breve tutorial con algunas de las características de Tukui."
	L.install_init_line_4 = "Pulsa el botón 'Tutorial' para ser guiado/a a través de esta pequeña introducción, o pulsa 'Instalar' para saltar este paso."

	L.tutorial_step_1_line_1 = "Este rápido tutorial te mostrara algunas de las características de Tukui."
	L.tutorial_step_1_line_2 = "Primero, lo más básico que debes conocer antes de poder jugar usando esta UI."
	L.tutorial_step_1_line_3 = "Este instalador es parcialmente específico para cada clase. Algunas de las opciones son aplicadas a todos tus personajes pero necesitaras usar el script de instalación en cada nuevo personaje que utilice Tukui. El script se muestra automáticamente en cada personaje nuevo que se conecta por primera vez con Tukui. Además, las opciones se pueden encontrar en /Tukui/config/config.lua para usuarios avanzados escribiendo /tukui  en el chat del juego para usuarios casuales."
	L.tutorial_step_1_line_4 = "Un usuario avanzado es un usuario de un ordenador que tiene la habilidad de usar características avanzadas (ej: edición de Lua) las cuales están por encima de las habilidades de los usuarios comunes. Un usuario casual es un usuario normal y no necesariamente capaz de programar. Se recomienda para ellos que usen nuestra herramienta de configuración en el juego (/tukui) para configurar Tukui a su gusto."

	L.tutorial_step_2_line_1 = "Tukui incluye una versión incrustada de oUF creada por Trond (Haste) A Ejseth. Esto se encarga de manejar todos los marcos de unidad, los beneficios y perjuicios y los elementos específicos de clase."
	L.tutorial_step_2_line_2 = "Puedes visitar wowinterface.com y buscar oUF para obtener más información a cerca de esta herramienta."
	L.tutorial_step_2_line_3 = "Si juegas como sanador o sanador de banda, puedes activar los marcos de unidad de sanador. Estos muestran más información acerca de tu banda. (/heal) Un dps o tanque debería usar nuestra interfaz simple de banda. (/dps) Si no quieres usar ninguna de las dos o usar otra diferente, puedes desactivarlo en el administrador de addons en la pantalla de selección de personajes."
	L.tutorial_step_2_line_4 = "Para cambiar fácilmente la posición de los marcos de unidad, escribe simplemente /moveui."

	L.tutorial_step_3_line_1 = "Tukui es un rediseño de la interfaz de Blizzard. Nada menos, ni nada más. Aproximadamente todas las características que puedes ver en la interfaz por defecto las puedes encontrar en Tukui. Las únicas características no disponibles en la interfaz por defecto son aquellas automatizadas que no son realmente visibles en pantalla, como por ejemplo vender automáticamente los objetos grises al visitar a un vendedor o, otro ejemplo, ordenar automáticamente tus objetos en las bolsas."
	L.tutorial_step_3_line_2 = "Porque no a todo el mundo le gustan cosas como los medidores de DPS, mods de Jefes, medidores de Amenaza, etc, nosotros juzgamos que es la mejor cosa que hacer. Tukui esta hecha con la idea de encajar al máximo con todas las clases, roles, funciones, tipos de juego, gustos de usuarios, etc. Es por eso que Tukui es una de las UIs más populares en este momento. Se ajusta al juego de todos y es extremadamente configurable. Esta también diseñada para ser un buen comienzo para todos los que quieran hacerse su propia UI sin depender de addons. Montones de usuarios desde 2009 esta usando Tukui como base para su propia UI. ¡Hecha un vistazo dentro de nuestra sección `Editet Packages` en nuestro sitio web!"
	L.tutorial_step_3_line_3 = "Los usuarios quizá quieran visitar nuestra sección de modificaciones extra (AddOns) en nuestra web o visitando http://www.wowinterface.com para instalar características adicionales o mods."
	L.tutorial_step_3_line_4 = ""

	L.tutorial_step_4_line_1 = "Para determinar cuantas barras quieres, pasa el ratón sobre la derecha o izquierda del fondo de la barra de acción de abajo. Haz lo mismo en la derecha a través de los botones de arriba y abajo. Para copiar texto del chat, haz click en el botón mostrar pasando el ratón por la esquina derecha del chat."
	L.tutorial_step_4_line_2 = "El borde del Mini mapa cambia de color. Se pone verde cuando tienes un nuevo correo, rojo cuando tienes una invitación nueva en el calendario, y naranja cuando tienes ambas."
	L.tutorial_step_4_line_3 = "Puedes hacer click izquierdo en un 80% de los textos de datos para mostrar varios paneles de Blizzard. Los de Amigos y Hermandad tienen funciones con click derecho también."
	L.tutorial_step_4_line_4 = "Hay un menú desplegable disponible. Haciendo click derecho en el botón [X] (Cerrar) de la bolsa abrirá un menú desplegable para mostrar las bolsas, organizar objetos, mostrar llavero, etc. Haciendo click con la rueda del ratón en el Mini mapa mostrará el micro menú."

	L.tutorial_step_5_line_1 = "Finalmente, Tukui incluye diversos comandos utiles. Debajo hay una lista."
	L.tutorial_step_5_line_2 = "/moveui te permite mover un montón de marcos por toda la pantalla. /enable y /disable se usan para activar o desactivar rápidamente los addons. /rl recarga la interfaz. /heal activa los marcos de banda de sanador y /dps activa los de dps/tanque."
	L.tutorial_step_5_line_3 = "/tt te permite susurrar a tu objetivo. /rc inicia una comprobación de disponibilidad (Listos). /rd deshace el grupo o banda. /bags muestra algunas de las caracteristicas disponibles a través de línea de comandos. /ainv activa la invitación automática cuando te susurren. (/ainv off) lo desactiva."
	L.tutorial_step_5_line_4 = "/gm muestra el marco de Ayuda. /install, /resetui o /tutorial cargan el instalador. /frame escribe el nombre y anclaje del marco bajo el cursor con información adicional."

	L.tutorial_step_6_line_1 = "Se ha completado el tutorial. Puedes escoger consultarlo de nuevo en cualquier momento escribiendo /tutorial."
	L.tutorial_step_6_line_2 = "Sugiero que eches un vistazo en config/config.lua o escribas /Tukui para adaptar la interfaz a tus necesidades."
	L.tutorial_step_6_line_3 = "¡Puedes continuar instalando la IU si aún no está hecho o si quieres déjala como viene por defecto!"
	L.tutorial_step_6_line_4 = ""

	L.install_step_1_line_1 = "Estos pasos aplicaran la correcta configuración de CVar para Tukui."
	L.install_step_1_line_2 = "El primer paso aplica la configuración primordial."
	L.install_step_1_line_3 = "Esto se recomienda para cualquier usuario, a menos que desees aplicar únicamente una parte de la configuración."
	L.install_step_1_line_4 = "Haz click en 'Continuar' para aplicar la configuración, o haz click en 'Saltar' si quieres saltar este paso."

	L.install_step_2_line_0 = "Se ha encontrado otro addon para el chat. Ignoraremos este paso. Por favor pulsa saltar para continuar la instalación."
	L.install_step_2_line_1 = "El segundo paso aplica la correcta configuración del chat."
	L.install_step_2_line_2 = "Si eres un usuario nuevo, se recomienda este paso. Si ya eres un usuario de Tukui, quizá quieras saltar este paso."
	L.install_step_2_line_3 = "Es normal que la fuente del chat aparezca demasiado grande al aplicar esta configuración. Volverá a ser normal al final de la instalación."
	L.install_step_2_line_4 = "Haz click en 'Continuar' para aplicar la configuración, o haz click en 'Saltar' si quieres saltar este paso."

	L.install_step_3_line_1 = "El tercero y final paso aplica la posición por defecto de los marcos."
	L.install_step_3_line_2 = "Este paso se recomienda para cualquier usuario nuevo."
	L.install_step_3_line_3 = ""
	L.install_step_3_line_4 = "Haz click en 'Continuar' para aplicar la configuración, o haz click en 'Saltar' si quieres saltar este paso."

	L.install_step_4_line_1 = "Se ha completado la instalación"
	L.install_step_4_line_2 = "Por favor, haz click en 'Finalizar' para recargar la IU."
	L.install_step_4_line_3 = ""
	L.install_step_4_line_4 = "¡Disfruta de Tukui! ¡Visítanos en http://www.tukui.org!"

	L.install_button_tutorial = "Tutorial"
	L.install_button_install = "Instalar"
	L.install_button_next = "Siguiente"
	L.install_button_skip = "Saltar"
	L.install_button_continue = "Continuar"
	L.install_button_finish = "Finalizar"
	L.install_button_close = "Cerrar"
end