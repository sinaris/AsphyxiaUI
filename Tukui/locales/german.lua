local S, C, L = unpack( select( 2, ... ) )

if( S.client == "deDE" ) then
	L.chat_BATTLEGROUND_GET = "B"
	L.chat_BATTLEGROUND_LEADER_GET = "B"
	L.chat_BN_WHISPER_GET = "Von"
	L.chat_GUILD_GET = "G"
	L.chat_OFFICER_GET = "O"
	L.chat_PARTY_GET = "P"
	L.chat_PARTY_GUIDE_GET = "P"
	L.chat_PARTY_LEADER_GET = "P"
	L.chat_RAID_GET = "R"
	L.chat_RAID_LEADER_GET = "R"
	L.chat_RAID_WARNING_GET = "W"
	L.chat_WHISPER_GET = "Von"
	L.chat_FLAG_AFK = "[AFK]"
	L.chat_FLAG_DND = "[DND]"
	L.chat_FLAG_GM = "[GM]"
	L.chat_ERR_FRIEND_ONLINE_SS = "ist jetzt |cff298F00online|r"
	L.chat_ERR_FRIEND_OFFLINE_S = "ist jetzt |cffff0000offline|r"

	L.chat_general = "Allgemein"
	L.chat_trade = "Handel"
	L.chat_defense = "LokaleVerteidigung"
	L.chat_recrutment = "Gildenrekrutierung"
	L.chat_lfg = "SucheNachGruppe"

	L.disband = "Gruppe wird aufgelöst ?"  

	L.datatext_notalents ="Keine Spezalisierung"
	L.datatext_download = "Download: "
	L.datatext_bandwidth = "Bandbreite: "
	L.datatext_guild = "Gilde"
	L.datatext_noguild = "Keine Gilde"
	L.datatext_bags = "Tasche: "
	L.datatext_friends = "Freunde"
	L.datatext_online = "Online: "
	L.datatext_armor = "Rüstung"
	L.datatext_earned = "Erhalten:"
	L.datatext_spent = "Ausgegeben:"
	L.datatext_deficit = "Differenz:"
	L.datatext_profit = "Gewinn:"
	L.datatext_timeto = "Zeit bis"
	L.datatext_friendlist = "Freundesliste:"
	L.datatext_playersp = "sp"
	L.datatext_playerap = "ap"
	L.datatext_playerhaste = "haste"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "arp"
	L.datatext_session = "Sitzung: "  
	L.datatext_character = "Charakter: "
	L.datatext_server = "Server: "
	L.datatext_totalgold = "Gesamt: "
	L.datatext_savedraid = "Instanz ID(s)"
	L.datatext_currency = "Währung:"
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " heal"
	L.datatext_avoidancebreakdown = "Vermeidungsübersicht" 
	L.datatext_lvl = "lvl"
	L.datatext_boss = "Boss"
	L.datatext_miss = "Verfehlen" 
	L.datatext_dodge = "Ausweichen"  
	L.datatext_block = "Blocken" 
	L.datatext_parry = "Parieren" 
	L.datatext_playeravd = "avd: "
	L.datatext_servertime = "Serverzeit: "
	L.datatext_localtime = "Ortszeit: "
	L.datatext_mitigation = "Schadensverringerung nach Level: " 
	L.datatext_healing = "Heilung : "
	L.datatext_damage = "Schaden : "
	L.datatext_honor = "Ehre : "
	L.datatext_killingblows = "Todesstöße : "
	L.datatext_ttstatsfor = "Stats für "
	L.datatext_ttkillingblows = "Todesstöße:"
	L.datatext_tthonorkills = "Ehrenhafte Siege:"
	L.datatext_ttdeaths = "Tode:"
	L.datatext_tthonorgain = "Ehre erhalten:"
	L.datatext_ttdmgdone = "Schaden verursacht:"
	L.datatext_tthealdone = "Heilung verursacht:"
	L.datatext_basesassaulted = "Basen angegriffen:"
	L.datatext_basesdefended = "Basen verteidigt:"
	L.datatext_towersassaulted = "Türme angegriffen:"
	L.datatext_towersdefended = "Türme verteidigt:"
	L.datatext_flagscaptured = "Flaggen eingenommen:"
	L.datatext_flagsreturned = "Flaggen zurückgebracht:"
	L.datatext_graveyardsassaulted = "Friedhöfe angegriffen:"
	L.datatext_graveyardsdefended = "Friedhöfe verteidigt:"
	L.datatext_demolishersdestroyed = "Verwüster zerstört:"
	L.datatext_gatesdestroyed = "Tore zerstört:"
	L.datatext_totalmemusage = "Gesamte Speichernutzung:"
	L.datatext_control = "Kontrolliert von:"
	L.datatext_cta_allunavailable = "Could not get Call To Arms information."
	L.datatext_cta_nodungeons = "No dungeons are currently offering a Call To Arms."

	L.Slots = {
		[1] = { 1, "Kopf", 1000 },
		[2] = { 3, "Schultern", 1000 },
		[3] = { 5, "Brust", 1000 },
		[4] = { 6, "Gürtel", 1000 },
		[5] = { 9, "Handgelenke", 1000 },
		[6] = { 10, "Hände", 1000 },
		[7] = { 7, "Beine", 1000 },
		[8] = { 8, "Füße", 1000 },
		[9] = { 16, "Waffenhand", 1000 },
		[10] = { 17, "Schildhand", 1000 },
		[11] = { 18, "Distanzwaffe", 1000 }
	}

	L.popup_disableui = "Tukui funktioniert nicht mit deiner Auflösung, möchtest du Tukui ausschalten? (Drücke Abbrechen, falls du eine andere Auflösung testen willst.)"
	L.popup_install = "Dies ist das erste Mal mit Tukui V13 mit diesem Charakter. Du musst dein UI neu laden, um Aktionsleisten, Variabeln und den Chat einzustellen."
	L.popup_reset = "Warnung! Alles wird auf Tukui Standardwerte zurückgesetzt. Trotzdem fortfahren?"
	L.popup_2raidactive = "2 Raid layouts sind aktiv, bitte eins wählen."
	L.popup_install_yes = "Yeah! (empfohlen!)"
	L.popup_install_no = "Nein, das is echt großer Mist"
	L.popup_reset_yes = "Yeah baby!"
	L.popup_reset_no = "Nein!"
	L.popup_fix_ab = "Etwas stimmt nicht mit der Aktionsleiste. Willst du UI neu laden um es zu beheben?"

	L.merchant_repairnomoney = "Du hast nicht genügend Gold zum Reparieren!" 
	L.merchant_repaircost = "Deine Rüstung wurde repariert für"
	L.merchant_repair_guild = "Your items have been repaired using guild bank funds for:" -- TRANS NEEDED
	L.merchant_repair_personal = "Your items have been repaired for:" -- TRANS NEEDED
	L.merchant_trashsell = "Dein Abfall wurde verkauft und du erhältst"

	L.goldabbrev = "|cffffd700g|r"
	L.silverabbrev = "|cffc7c7cfs|r"
	L.copperabbrev = "|cffeda55fk|r"

	L.error_noerror = "Kein Fehler bis jetzt."

	L.unitframes_ouf_offline = "Offline"
	L.unitframes_ouf_dead = "Tot"
	L.unitframes_ouf_ghost = "Geist"
	L.unitframes_ouf_lowmana = "WENIG MANA"
	L.unitframes_ouf_threattext = "Bedrohung am aktuellen Ziel:"
	L.unitframes_ouf_offlinedps = "Offline"
	L.unitframes_ouf_deaddps = "|cffff0000[TOT]|r"
	L.unitframes_ouf_ghostheal = "GEIST"
	L.unitframes_ouf_deadheal = "TOT"
	L.unitframes_ouf_gohawk = "GO FALKE"
	L.unitframes_ouf_goviper = "GO VIPER"
	L.unitframes_disconnected = "D/C"
	L.unitframes_ouf_wrathspell = "Zorn"
	L.unitframes_ouf_starfirespell = "Sternenfeuer"

	L.tooltip_count = "Anzahl"
	L.tooltip_loading = "Loading Talents..." -- NEED TRANS
	L.tooltip_no_talent = "No Talents" -- NEED TRANS

	L.bags_noslots = "Kann keine weiteren Taschenplätze kaufen!"
	L.bags_costs = "Kosten: %.2f Gold"
	L.bags_buyslots = "Kaufe neuen Platz mit /bags purchase yes"
	L.bags_openbank = "Du musst erst das Bankfach öffnen."
	L.bags_sort = "Sortiert deine Taschen oder die Bank, falls geöffnet."
	L.bags_stack = "Stapelt Items neu in deinen Taschen und der Bank, falls geöffnet."
	L.bags_buybankslot = "Kaufe Bankplatz. (Bank muss geöffnet sein)"
	L.bags_search = "Suchen"
	L.bags_sortmenu = "Sortieren"
	L.bags_sortspecial = "Sortieren Spezialtasche"
	L.bags_stackmenu = "Stapeln"
	L.bags_stackspecial = "Stapeln Spezialtasche"
	L.bags_showbags = "Zeige Taschen"
	L.bags_sortingbags = "Sortieren abgeschlossen."
	L.bags_nothingsort= "Nichts zu sortieren."
	L.bags_bids = "Benutze Taschen: "
	L.bags_stackend = "Neu stapeln abgeschlossen."
	L.bags_rightclick_search = "Rechtsklick, um zu suchen."

	L.loot_fish = "Faule Beute" --changed
	L.loot_empty = "Leerer slot" --changed

	L.chat_invalidtarget = "Falsches Ziel"

	L.mount_wintergrasp = "Tausendwinter"

	L.mail_need = "Need a mailbox."
	L.mail_messages = "Messages"

	L.core_autoinv_enable = "Autoinvite AN: invite"
	L.core_autoinv_enable_c = "Autoinvite AN: "
	L.core_autoinv_disable = "Autoinvite AUS"
	L.core_wf_unlock = "Quest Tracker entriegelt"
	L.core_wf_lock = "Quest Tracker verriegelt"
	L.core_welcome1 = "Willkommen bei |cffC495DDTukui|r Version "
	L.core_welcome2 = "Tippe |cff00FFFF/uihelp|r für mehr Informationen"

	L.core_uihelp1 = "|cff00ff00General Slash Befehle|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - UI Elemente entsperren zum Bewegen."
	L.core_uihelp3 = "|cffFF0000/rl|r - UI neu laden."
	L.core_uihelp4 = "|cffFF0000/gm|r - GM Tickets schreiben oder WoW Hilfe anzeigen."
	L.core_uihelp5 = "|cffFF0000/frame|r - Name des Frames unter dem Mauszeiger ausgeben. (für lua coder nützlich)"
	L.core_uihelp6 = "|cffFF0000/heal|r - Heil-Layout aktivieren."
	L.core_uihelp7 = "|cffFF0000/dps|r - Dps/Tank-Layout aktivieren."
	L.core_uihelp8 = "|cffFF0000/bags|r - Taschen sortieren, Bankplätze kaufen oder gegenstände stapeln."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Auf Tukui Standard zurücksetzen."
	L.core_uihelp10 = "|cffFF0000/rd|r - Raid auflösen."
	L.core_uihelp11 = "|cffFF0000/ainv|r - Automatische Gruppeneinladung beim Anflüstern mit Schlüsselwort aktivieren. Du kannst dein eigenes Schlüsselwort mit `/ainv myword` einstellen"
	L.core_uihelp100 = "(Hochscrollen wenn du mehr Befehle sehen willst ...)"

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

	L.symbol_CLEAR = "Entfernen"
	L.symbol_SKULL = "Totenschädel"
	L.symbol_CROSS = "Kreuz"
	L.symbol_SQUARE = "Quadrat"
	L.symbol_MOON = "Mond"
	L.symbol_TRIANGLE = "Dreieck"
	L.symbol_DIAMOND = "Diamant"
	L.symbol_CIRCLE = "Kreis"
	L.symbol_STAR = "Stern"

	L.bind_combat = "Du kannst keine Tasten im Kampf belegen."
	L.bind_saved = "Alle Tastenbelegungen wurden gespeichert."
	L.bind_discard = "Alle gerade neu belegten Tastenbelegungen wurden verworfen."
	L.bind_instruct = "Bewege deine Maus über einen Aktionsbutton, um ihn mit einem Hotkey zu belegen. Drücke Escape oder die rechte Maustaste, um die aktuelle Tastenbelegung des Buttons zu löschen."  
	L.bind_save = "Tastenbelegung speichern"
	L.bind_discardbind = "Tastenbelegung verwerfen"

	L.hunter_unhappy = "Dein Begleiter ist unzufrieden!"
	L.hunter_content = "Dein Begleiter ist zufrieden!"
	L.hunter_happy = "Dein Begleiter ist glücklich!"

	L.move_tooltip = "Tooltip bewegen"
	L.move_minimap = "Minimap bewegen"
	L.move_watchframe = "Quests bewegen"
	L.move_gmframe = "Ticket bewegen"
	L.move_buffs = "Spieler Stärkungszauber bewegen"
	L.move_debuffs = "Spieler Schwächungszauber bewegen"
	L.move_shapeshift = "Haltungs-/Totemleiste bewegen"
	L.move_achievements = "Erfolgsfenster bewegen"
	L.move_roll = "Würfelfenster bewegen"
	L.move_vehicle = "Fahrzeugausstieg bewegen"
	L.move_extrabutton = "Extra Button"

	L.install_header_1 = "Willkommen"
	L.install_header_2 = "1. Grundlegendes"
	L.install_header_3 = "2. Einheitenfenster"
	L.install_header_4 = "3. Funktionen"
	L.install_header_5 = "4. Das solltest Du wissen!"
	L.install_header_6 = "5. Kommandos"
	L.install_header_7 = "6. Abgeschlossen"
	L.install_header_8 = "1. Grundeinstellungen"
	L.install_header_9 = "2. Chat"
	L.install_header_10= "3. Frames"
	L.install_header_11= "4. Abschluss!"

	L.install_init_line_1 = "Danke, dass Du Dich für Tukui entschieden hast!"
	L.install_init_line_2 = "Du wirst mit einigen einfachen Schritten durch die Installation geführt. Bei jedem Schritt kannst Du entscheiden, ob Du die Standardeinstellungen übernehmen oder überspringen möchtest."
	L.install_init_line_3 = "Du hast auch die Möglichkeit, eine Einführung in einige der Funktionen von Tukui zu erhalten."
	L.install_init_line_4 = "Klicke auf 'Tutorial' um eine kleine Einleitung zu erhalten, oder klicke auf 'Installation' um diesen Schritt zu überspringen."

	L.tutorial_step_1_line_1 = "Dieses kurze Tutorial wird Dir einige Funktionen von Tukui zeigen."
	L.tutorial_step_1_line_2 = "Zuerst das Wichtigste, das Du wissen solltest, bevor Du mit diesem UI spielst."
	L.tutorial_step_1_line_3 = "Diese Installation ist teilweise charakterbezogen. Während einige Einstellungen, die später angewandt werden, accountweit sind, musst Du die Installation für jeden neuen Charakter starten der Tukui nutzt. Dieses Script wird automatisch beim ersten Einloggen eines Charakters mit Tukui gezeigt. Die Optionen können benutzerfreundlich mit dem Befehl /tukui angepasst werden. Erfahrene Benutzer können die Optionen auch unter /Tukui/config/config.lua anpassen."
	L.tutorial_step_1_line_4 = "Das Bearbeiten der Config.lua benötigt unter anderem Erfahrung in der Programmierung von Lua. Es wird empfohlen, die Konfiguration im Spiel per /tukui zu ändern, sollten diese Kenntnisse nicht vorhanden sein."

	L.tutorial_step_2_line_1 = "Tukui verwendet eine eingebettete Version von oUF, programmiert von Trond (Haste) A Ekseth. Es kümmert sich um alle Einheitenfenster, Buffs und Debuffs und alle klassenspezifischen Elemente."
	L.tutorial_step_2_line_2 = "Du kannst auf wowinterface.com nach oUF suchen, um mehr über dieses Werkzeug zu erfahren."
	L.tutorial_step_2_line_3 = "Falls Du einen Heiler oder Schlachtzugsleiter spielst, möchtest Du vielleicht die Heiler-Einheitenfenster aktivieren. Diese zeigen Dir mehr Informationen über Deinen Schlachtzug an. (/heal) Als DPS-Klasse oder als Tank solltest Du die schlanke Raidansicht auswählen. (/dps) Falls Du keine der beiden Ansichten oder etwas anderes benutzen möchtest, kannst Du im Addon-Manager in der Charakterübersicht diese deaktivieren."
	L.tutorial_step_2_line_4 = "Um die Positionen der Einheitenfenster zu verschieben, tippe einfach /moveui ein."

	L.tutorial_step_3_line_1 = "Tukui ist ein neudesigntes Blizzard Interface. Nicht mehr, nicht weniger. Nahezu alle Funktionen des normalen Interfaces sind auch in Tukui verfügbar. Die einzigen Funktionen, die nicht im Standard-Interface verfügbar sind, sind automatisierte Prozesse, die nicht auf dem Bildschirm sichtbar sind. Zum Beispiel automatisches Verkaufen von grauen Gegenständen beim Händlerbesuch. Oder, ein weiteres Beispiel, automatisches Sortieren der Gegenstände in den Taschen."
	L.tutorial_step_3_line_2 = "Weil nicht jeder Sachen wie DPS-Meter, Boss Mods, Aggro-Meter und ähnliches mag, haben wir uns entschieden, dass dies die beste Möglichkeit ist. Tukui wurde mit der Idee entwickelt, auf alle Klassen, Rollen, Talente, Spielstile, Vorlieben der Benutzer etc. zu passen. Deswegen ist Tukui momentan eines der populärsten Interfaces. Es passt zum Spielstil jedes Einzelnen und ist extrem anpassbar. Es ist auch so entwickelt worden, jedem einen sehr guten Start für sein eigenes Interface zu bieten, ohne dabei auf weitere Addons angewiesen zu sein. Unzählige Spieler nutzen Tukui seit 2009 als Basis für ihre eigenen Interfaces. Wirf doch mal einen Blick auf die angepassten Pakete auf unserer Webseite!"
	L.tutorial_step_3_line_3 = "Für weitere Modifikationen und Funktionen kann die entsprechende Mods-Sektion auf unserer Webseite oder http://www.wowinterface.com besucht werden."
	L.tutorial_step_3_line_4 = ""

	L.tutorial_step_4_line_1 = "Um festzulegen, wie viele Aktionsleisten Du möchtest, bewege Deine Maus an den linken oder rechten Rand der untersten Aktionsleiste. Mache das Gleiche auf der rechten Seite über dem unteren und oberen Rand. Um Text aus dem Chat zu kopieren, klicke den Knopf, der beim Überfahren des Chatfensters mit der Maus in der rechten Ecke auftaucht."
	L.tutorial_step_4_line_2 = "Die Miniaturkarte ändert die Randfarbe. Sie ist Grün, wenn Du neue Post hast. Rot, wenn Du eine neue Kalendereinladung hast, und Orange bei beidem."
	L.tutorial_step_4_line_3 = "Du kannst 80% der Datenfelder linksklicken, um verschiedene Fenster von Blizzard zu öffnen. Die Datenfelder `Freunde` und `Gilde` haben auch eine Funktion bei Rechtsklick."
	L.tutorial_step_4_line_4 = "Hier sind einige Aufklappmenüs verfügbar. Bei Rechtsklick auf [X] (Schliessen) der Tasche wird ein Aufklappmenü erscheinen, um die Taschen anzuzeigen, Gegenstände zu sortieren, den Schlüsselbund anzuzeigen, etc. Ein Klicken mit dem Mausrad auf die Miniaturkarte öffnet das Mikromenü."

	L.tutorial_step_5_line_1 = "Zu guter Letzt beinhaltet Tukui eine Reihe nützlicher Kommandos."
	L.tutorial_step_5_line_2 = "/moveui erlaubt Dir das Bewegen vieler Fenster überall auf dem Bildschirm. /enable und /disable sind nützlich um schnell Addons ein- oder auszuschalten. /rl lädt das Interface neu. /heal aktiviert das Heiler-Raidinterface und /dps aktiviert das Tank/DPS-Raidinterface."
	L.tutorial_step_5_line_3 = "/tt erlaubt es dir, dein Ziel anzuflüstern. /rc startet einen Bereitschaftscheck. /rd löst Deine Gruppe oder Raid auf. /bags zeigt einige Funktionen, die über die Kommandozeile verfügbar sind. /ainv aktiviert automatisches Einladen per anflüstern. (/ainv off) deaktiviert dies wieder."
	L.tutorial_step_5_line_4 = "/gm öffnet das Hilfe-Fenster. /install, /resetui oder /tutorial lädt dieses Installationsprogramm. /frame zeigt den Namen des Fensters unter deinem Mauszeiger und dem des übergeordneten Fensters mit einigen anderen Informationen an."

	L.tutorial_step_6_line_1 = "Die Einführung ist abgeschlossen. Du kannst sie jeder Zeit wieder starten, indem Du /tutorial eingibst."
	L.tutorial_step_6_line_2 = "Ich schlage vor, Du wirfst mal einen Blick auf die Datei Tukui/config/config.lua oder gibst /tukui ein, um das Interface deinen Bedürfnissen anzupassen."
	L.tutorial_step_6_line_3 = "Du kannst nun mit der Installation des Interface fortfahren, wenn diese noch nicht abgeschlossen ist oder Du das Interface auf die Standardeinstellungen zurücksetzen willst."
	L.tutorial_step_6_line_4 = ""

	L.install_step_1_line_1 = "Diese Schritte setzen die richtigen CVar Einstellungen für Tukui."
	L.install_step_1_line_2 = "Der erste Schritt setzt grundlegende Einstellungen."
	L.install_step_1_line_3 = "Dieser Schritt wird jedem Benutzer empfohlen, es sei denn, Du willst nur spezielle Teile der Einstellungen aktivieren."
	L.install_step_1_line_4 = "Klicke 'Weiter', um die Einstellungen anzuwenden, oder klicke 'Überspringen', wenn Du diesen Schritt überspringen möchtest."

	L.install_step_2_line_0 = "Ein weiteres Chataddon wurde gefunden. Wir überspringen diesen Schritt. Bitte drücke 'Überspringen', um mit der Installation fortzufahren."
	L.install_step_2_line_1 = "Der zweite Schritt aktiviert die richtigen Chateinstellungen."
	L.install_step_2_line_2 = "Wenn Du ein neuer Nutzer bist, ist dieser Schritt empfohlen. Wenn Du Tukui bereits benutzt, möchtest Du diesen Schritt vielleicht überspringen."
	L.install_step_2_line_3 = "Es ist normal, dass Deine Schriftgröße während der Aktivierung der Einstellungen etwas zu groß wirkt, dies wird am Ende der Installation wieder zurückgesetzt."
	L.install_step_2_line_4 = "Klicke 'Weiter', um die Einstellungen anzuwenden, oder klicke 'Überspringen', wenn Du diesen Schritt überspringen möchtest."

	L.install_step_3_line_1 = "Der dritte und letzte Schritt übernimmt die standardmässige Position der Frames."
	L.install_step_3_line_2 = "Dieser Schritt ist für jeden neuen Charakter empfohlen ."
	L.install_step_3_line_3 = ""
	L.install_step_3_line_4 = "Klicke 'Weiter', um die Einstellungen anzuwenden, oder klicke 'Überspringen', wenn Du diesen Schritt überspringen möchtest."

	L.install_step_4_line_1 = "Installation abgeschlossen."
	L.install_step_4_line_2 = "Bitte klicke auf 'Abschließen', um das Interface neu zu laden."
	L.install_step_4_line_3 = ""
	L.install_step_4_line_4 = "Viel Spass mit Tukui! Besuche uns auf http://www.tukui.org!"

	L.install_button_tutorial = "Tutorial"
	L.install_button_install = "Installation"
	L.install_button_next = "Weiter"
	L.install_button_skip = "Überspringen"
	L.install_button_continue = "Weiter"
	L.install_button_finish = "Abschließen"
	L.install_button_close = "Schließen"
end