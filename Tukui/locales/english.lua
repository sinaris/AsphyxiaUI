local S, C, L = unpack( select( 2, ... ) )

L.chat_BATTLEGROUND_GET = "BG"
L.chat_BATTLEGROUND_LEADER_GET = "BG"
L.chat_BN_WHISPER_GET = "From"
L.chat_GUILD_GET = "G"
L.chat_OFFICER_GET = "O"
L.chat_PARTY_GET = "P"
L.chat_PARTY_GUIDE_GET = "P"
L.chat_PARTY_LEADER_GET = "P"
L.chat_RAID_GET = "R"
L.chat_RAID_LEADER_GET = "R"
L.chat_RAID_WARNING_GET = "W"
L.chat_WHISPER_GET = "From"
L.chat_FLAG_AFK = "[AFK]"
L.chat_FLAG_DND = "[DND]"
L.chat_FLAG_GM = "[GM]"
L.chat_ERR_FRIEND_ONLINE_SS = "is now |cff298F00online|r"
L.chat_ERR_FRIEND_OFFLINE_S = "is now |cffff0000offline|r"

L.chat_general = "General"
L.chat_trade = "Trade"
L.chat_defense = "LocalDefense"
L.chat_recrutment = "GuildRecruitment"
L.chat_lfg = "LookingForGroup"

L.disband = "Disbanding group ?"

L.datatext_notalents ="No Talents"
L.datatext_download = "Download: "
L.datatext_bandwidth = "Bandwidth: "
L.datatext_guild = "Guild"
L.datatext_noguild = "No Guild"
L.datatext_bags = "Bags: "
L.datatext_friends = "Friends"
L.datatext_online = "Online: "
L.datatext_armor = "Armor"
L.datatext_earned = "Earned:"
L.datatext_spent = "Spent:"
L.datatext_deficit = "Deficit:"
L.datatext_profit = "Profit:"
L.datatext_timeto = "Time to"
L.datatext_friendlist = "Friends list:"
L.datatext_playersp = "sp"
L.datatext_playerap = "ap"
L.datatext_playerhaste = "haste"
L.datatext_dps = "dps"
L.datatext_hps = "hps"
L.datatext_playerarp = "arp"
L.datatext_session = "Session: "
L.datatext_character = "Character: "
L.datatext_server = "Server: "
L.datatext_totalgold = "Total: "
L.datatext_savedraid = "Saved Raid(s)"
L.datatext_currency = "Currency:"
L.datatext_fps = " fps & "
L.datatext_ms = " ms"
L.datatext_playercrit = " crit"
L.datatext_playerheal = " heal"
L.datatext_avoidancebreakdown = "Avoidance Breakdown"
L.datatext_lvl = "lvl"
L.datatext_boss = "Boss"
L.datatext_miss = "Miss"
L.datatext_dodge = "Dodge"
L.datatext_block = "Block"
L.datatext_parry = "Parry"
L.datatext_playeravd = "avd: "
L.datatext_servertime = "Server Time: "
L.datatext_localtime = "Local Time: "
L.datatext_mitigation = "Mitigation By Level: "
L.datatext_healing = "Healing: "
L.datatext_damage = "Damage: "
L.datatext_honor = "Honor: "
L.datatext_killingblows = "Killing Blows: "
L.datatext_ttstatsfor = "Stats for "
L.datatext_ttkillingblows = "Killing Blows:"
L.datatext_tthonorkills = "Honorable Kills:"
L.datatext_ttdeaths = "Deaths:"
L.datatext_tthonorgain = "Honor Gained:"
L.datatext_ttdmgdone = "Damage Done:"
L.datatext_tthealdone = "Healing Done:"
L.datatext_basesassaulted = "Bases Assaulted:"
L.datatext_basesdefended = "Bases Defended:"
L.datatext_towersassaulted = "Towers Assaulted:"
L.datatext_towersdefended = "Towers Defended:"
L.datatext_flagscaptured = "Flags Captured:"
L.datatext_flagsreturned = "Flags Returned:"
L.datatext_graveyardsassaulted = "Graveyards Assaulted:"
L.datatext_graveyardsdefended = "Graveyards Defended:"
L.datatext_demolishersdestroyed = "Demolishers Destroyed:"
L.datatext_gatesdestroyed = "Gates Destroyed:"
L.datatext_totalmemusage = "Total Memory Usage:"
L.datatext_control = "Controlled by:"
L.datatext_cta_allunavailable = "Could not get Call To Arms information."
L.datatext_cta_nodungeons = "No dungeons are currently offering a Call To Arms."

L.Slots = {
	[1] = { 1, "Head", 1000 },
	[2] = { 3, "Shoulder", 1000 },
	[3] = { 5, "Chest", 1000 },
	[4] = { 6, "Waist", 1000 },
	[5] = { 9, "Wrist", 1000 },
	[6] = { 10, "Hands", 1000 },
	[7] = { 7, "Legs", 1000 },
	[8] = { 8, "Feet", 1000 },
	[9] = { 16, "Main Hand", 1000 },
	[10] = { 17, "Off Hand", 1000 },
	[11] = { 18, "Ranged", 1000 }
}

L.popup_disableui = "Tukui doesn't work for this resolution, do you want to disable Tukui? (Cancel if you want to try another resolution)"
L.popup_install = "First time running Tukui V13 with this Character. You must reload your UI to set Action Bars, Variables and Chat Frames."
L.popup_reset = "Warning! This will reset everything to Tukui default. Do you want to proceed?"
L.popup_2raidactive = "2 raid layouts are active, please select a layout."
L.popup_install_yes = "Yeah! (recommended!)"
L.popup_install_no = "No, it sux so hard"
L.popup_reset_yes = "Yeah baby!"
L.popup_reset_no = "No, or else I'll QQ in the forums!"
L.popup_fix_ab = "There is something wrong with your action bar. Do you want to reloadui to fix it?"

L.merchant_repairnomoney = "You don't have enough money to repair!"
L.merchant_repaircost = "Your items have been repaired for"
L.merchant_repair_guild = "Your items have been repaired using guild bank funds for:"
L.merchant_repair_personal = "Your items have been repaired for:"
L.merchant_trashsell = "Your vendor trash has been sold and you earned"

L.goldabbrev = "|cffffd700g|r"
L.silverabbrev = "|cffc7c7cfs|r"
L.copperabbrev = "|cffeda55fc|r"

L.error_noerror = "No error yet."

L.unitframes_ouf_offline = "Offline"
L.unitframes_ouf_dead = "Dead"
L.unitframes_ouf_ghost = "Ghost"
L.unitframes_ouf_lowmana = "LOW MANA"
L.unitframes_ouf_threattext = "Threat on current target:"
L.unitframes_ouf_offlinedps = "Offline"
L.unitframes_ouf_deaddps = "|cffff0000[DEAD]|r"
L.unitframes_ouf_ghostheal = "GHOST"
L.unitframes_ouf_deadheal = "DEAD"
L.unitframes_ouf_gohawk = "GO HAWK"
L.unitframes_ouf_goviper = "GO VIPER"
L.unitframes_disconnected = "D/C"
L.unitframes_ouf_wrathspell = "Wrath"
L.unitframes_ouf_starfirespell = "Starfire"

L.tooltip_count = "Count"
L.tooltip_loading = "Loading Talents..." -- NEED TRANS
L.tooltip_no_talent = "No Talents" -- NEED TRANS

L.bags_noslots = "can't buy anymore slots!"
L.bags_costs = "Cost: %.2f gold"
L.bags_buyslots = "Buy new slot with /bags purchase yes"
L.bags_openbank = "You need to open your bank first."
L.bags_sort = "sort your bags or your bank, if open."
L.bags_stack = "fill up partial stacks in your bags or bank, if open."
L.bags_buybankslot = "buy bank slot. (need to have bank open)"
L.bags_search = "Search"
L.bags_sortmenu = "Sort"
L.bags_sortspecial = "Sort Special"
L.bags_stackmenu = "Stack"
L.bags_stackspecial = "Stack Special"
L.bags_showbags = "Show Bags"
L.bags_sortingbags = "Sorting finished."
L.bags_nothingsort= "Nothing to sort."
L.bags_bids = "Using bags: "
L.bags_stackend = "Restacking finished."
L.bags_rightclick_search = "Right-click to search."

L.loot_fish = "Fishy loot"
L.loot_empty = "Empty slot"

L.chat_invalidtarget = "Invalid Target"

L.mount_wintergrasp = "Wintergrasp"

L.mail_need = "Need a mailbox."
L.mail_messages = "Messages"

L.core_autoinv_enable = "Autoinvite ON: invite"
L.core_autoinv_enable_c = "Autoinvite ON: "
L.core_autoinv_disable = "Autoinvite OFF"
L.core_wf_unlock = "WatchFrame unlock"
L.core_wf_lock = "WatchFrame lock"
L.core_welcome1 = "Welcome to |cffC495DDTukui|r, version "
L.core_welcome2 = "Type |cff00FFFF/uihelp|r for more info or visit www.tukui.org"

L.core_uihelp1 = "|cff00ff00General Slash Commands|r"
L.core_uihelp2 = "|cffFF0000/moveui|r - Unlock and move elements around the screen."
L.core_uihelp3 = "|cffFF0000/rl|r - Reloads your User Interface."
L.core_uihelp4 = "|cffFF0000/gm|r - Send GM tickets or shows WoW in-game help."
L.core_uihelp5 = "|cffFF0000/frame|r - Detect the frame name your mouse is currently on. (very useful for lua editors)"
L.core_uihelp6 = "|cffFF0000/heal|r - Enable healing raid layout."
L.core_uihelp7 = "|cffFF0000/dps|r - Enable Dps/Tank raid layout."
L.core_uihelp8 = "|cffFF0000/bags|r - For sorting, buying bank slot, or stacking items in your bags."
L.core_uihelp9 = "|cffFF0000/resetui|r - Reset Tukui to default."
L.core_uihelp10 = "|cffFF0000/rd|r - Disband raid."
L.core_uihelp11 = "|cffFF0000/ainv|r - Enable autoinvite via keyword on whisper. You can set your own keyword by typing `/ainv myword`"
L.core_uihelp100 = "(Scroll up for more commands ...)"

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

L.symbol_CLEAR = "Clear"
L.symbol_SKULL = "Skull"
L.symbol_CROSS = "Cross"
L.symbol_SQUARE = "Square"
L.symbol_MOON = "Moon"
L.symbol_TRIANGLE = "Triangle"
L.symbol_DIAMOND = "Diamond"
L.symbol_CIRCLE = "Circle"
L.symbol_STAR = "Star"

L.bind_combat = "You can't bind keys in combat."
L.bind_saved = "All keybindings have been saved."
L.bind_discard = "All newly set keybindings have been discarded."
L.bind_instruct = "Hover your mouse over any actionbutton to bind it. Press the escape key or right click to clear the current actionbuttons keybinding."
L.bind_save = "Save bindings"
L.bind_discardbind = "Discard bindings"

L.hunter_unhappy = "Your pet is unhappy!"
L.hunter_content = "Your pet is content!"
L.hunter_happy = "Your pet is happy!"

L.move_tooltip = "Move Tooltip"
L.move_minimap = "Move Minimap"
L.move_watchframe = "Move Quests"
L.move_gmframe = "Move Ticket"
L.move_buffs = "Move Player Buffs"
L.move_debuffs = "Move Player Debuffs"
L.move_shapeshift = "Move Shapeshift/Totem"
L.move_achievements = "Move Achievements"
L.move_roll = "Move Loot Roll Frame"
L.move_vehicle = "Move Vehicle Seat"
L.move_extrabutton = "Extra Button"

L.install_header_1 = "Welcome"
L.install_header_2 = "1. Essentials"
L.install_header_3 = "2. Unitframes"
L.install_header_4 = "3. Features"
L.install_header_5 = "4. Things you should know!"
L.install_header_6 = "5. Commands"
L.install_header_7 = "6. Finished"
L.install_header_8 = "1. Essential Settings"
L.install_header_9 = "2. Social"
L.install_header_10= "3. Frames"
L.install_header_11= "4. Success!"

L.install_init_line_1 = "Thank you for choosing Tukui!"
L.install_init_line_2 = "You will be guided through the installation process in a few simple steps. At each step, you can decide whether or not you want to apply or skip the presented settings."
L.install_init_line_3 = "You are also given the possibility to be shown a brief tutorial on some of the features of Tukui."
L.install_init_line_4 = "Press the 'Tutorial' button to be guided through this small introduction, or press 'Install' to skip this step."

L.tutorial_step_1_line_1 = "This quick tutorial will show you some of the features in Tukui."
L.tutorial_step_1_line_2 = "First, the essentials that you should know before you can play with this UI."
L.tutorial_step_1_line_3 = "This installer is partially character-specific. While some of the settings that will be applied later on are account-wide, you need to run install script for each new character running Tukui. Script is auto show on every new character logging into Tukui for the first time. Also, the options can be found in /Tukui/config/config.lua for `Power` users or by typing /tukui in game for `Friendly` users."
L.tutorial_step_1_line_4 = "A power user is a user of a personal computer who has the ability to use advanced features (ex: Lua editing) which are beyond the abilities of normal users. A friendly user is a normal user and is not necessarily capable of programming. It's recommended for them to use our in game configuration tool (/tukui) for settings what they want displayed on Tukui."

L.tutorial_step_2_line_1 = "Tukui includes an embedded version of oUF (oUFTukui) created by Haste. This handles all of the unitframes on the screen, the buffs and debuffs, and the class-specific elements."
L.tutorial_step_2_line_2 = "You can visit wowinterface.com and search for oUF for more information about this tool."
L.tutorial_step_2_line_3 = "If you play as a healer or a raid leader, you may want to enable healer unit frames. They display more information about your raid. (/heal) A dps or tank should use our simple raid display. (/dps) If you don't want to show any of them or use something else, you can disable it in addon manager from character login list."
L.tutorial_step_2_line_4 = "To easily change the unitframe position, just type /moveui."

L.tutorial_step_3_line_1 = "Tukui is a redesigned Blizzard UI. Nothing less, nothing more. Approx all features you can see on Default UI is available thought Tukui. The only features not available thought default UI are some automated features not really visible on screen, like example auto selling gray when visiting a vendor or, another example, auto sort items in bags."
L.tutorial_step_3_line_2 = "Because not everyone is enjoying things like DPS meters, Boss mods, Threat meter, etc, we judge that it's the best thing to do. Tukui is made around this idea to fit at maximum all class, roles, specs, type of gameplay, taste of users, etc. That's why Tukui is one of the most popular UI at the moment. It fit everyone gameplay and is extremly editable. It's also designed to be a very good start for everyone that want to make their own custom UI without depending on addons. Tons of users since 2009 are now using Tukui as a base for their own UI. Take a look into our Edited Packages from our website!"
L.tutorial_step_3_line_3 = "Users may want to visit our extra mods section into our website or by visiting www.wowinterface.com to install additionnal features or mods."
L.tutorial_step_3_line_4 = ""

L.tutorial_step_4_line_1 = "To set how many bars you want, mouseover on left or right of bottom action bar background. Do the same on the right, via top and bottom. To copy text from the chat frame, click the button show on mouseover on the right corner of chat frames."
L.tutorial_step_4_line_2 = "The minimap border changes colour. It is green when you have new mail, red when you have a new calendar invite, and orange when you have both."
L.tutorial_step_4_line_3 = "You can left-click thought 80% of datatext to show various panels from Blizzard. Friend and Guild Datatext have right-click features aswell."
L.tutorial_step_4_line_4 = "There is some dropdown menu available. Right-clicking on [X] (Close) bag button will show a dropdown menu to show bags, sort items, show keyring, etc. Middle-clicking thought Minimap will show the micro menu."

L.tutorial_step_5_line_1 = "Lastly, Tukui includes useful slash commands. Below is a list."
L.tutorial_step_5_line_2 = "/moveui allow you to move lots of frames anywhere on the screen. /enable and /disable are used to quickly enable and disable addons. /rl reloads the UI. /heal enable the healer raid unit frames and /dps enable the dps/tank raid unit frames."
L.tutorial_step_5_line_3 = "/tt lets you whisper your target. /rc initiates a ready check. /rd disbands a party or raid. /bags display some features available thought command line. /ainv enable auto invite by whisper on you. (/ainv off) to turn it off"
L.tutorial_step_5_line_4 = "/gm toggles the Help frame. /install, /resetui or /tutorial loads this installer. /frame print the name and parent of the frame below the cursor respectively with additionnal information."

L.tutorial_step_6_line_1 = "The tutorial is complete. You can choose to reconsult it at any time by typing /tutorial."
L.tutorial_step_6_line_2 = "I suggest you have a look through config/config.lua or by typing /Tukui to customize the UI to your needs."
L.tutorial_step_6_line_3 = "You can now continue install the UI if it's not done yet or if you want to reset to default!"
L.tutorial_step_6_line_4 = ""

L.install_step_1_line_1 = "These steps will apply the correct CVar settings for Tukui."
L.install_step_1_line_2 = "The first step applies the essential settings."
L.install_step_1_line_3 = "This is |cffff0000recommended|r for any user, unless you want to apply only a specific part of the settings."
L.install_step_1_line_4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."

L.install_step_2_line_0 = "Another chat addon is found. We will ignore this step. Please press skip to continue installation."
L.install_step_2_line_1 = "The second step applies the correct chat setup."
L.install_step_2_line_2 = "If you are a new user, this step is recommended. If you are an existing user, you may want to skip this step."
L.install_step_2_line_3 = "It is normal that your chat font will appear too big upon applying these settings. It will revert back to normal when finishing the installation."
L.install_step_2_line_4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."

L.install_step_3_line_1 = "The third and final step applies default frames position."
L.install_step_3_line_2 = "This step is |cffff0000recommended|r for any new user."
L.install_step_3_line_3 = ""
L.install_step_3_line_4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."

L.install_step_4_line_1 = "Installation is complete."
L.install_step_4_line_2 = "Please click the 'Finish' button to reload the UI."
L.install_step_4_line_3 = ""
L.install_step_4_line_4 = "Enjoy Tukui! Visit us at www.tukui.org!"

L.install_button_tutorial = "Tutorial"
L.install_button_install = "Install"
L.install_button_next = "Next"
L.install_button_skip = "Skip"
L.install_button_continue = "Continue"
L.install_button_finish = "Finish"
L.install_button_close = "Close"