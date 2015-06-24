//This script is part of bardosy's automedic script. Details are in automedic.sqf file.

(leader group LCK_automedicmedic) removeAction LCK_automedicaction;
LCK_automedicexit = true;
LCK_automedicaction = (leader group LCK_automedicmedic) addAction ["Automedic ON", "scripts\automedic.sqf", [true], 1, false, true, "", "true"];