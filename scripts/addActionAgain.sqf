_Unit = _this select 0;

waitUntil {alive _Unit};
//_Unit addAction ["Automedic OFF", "scripts\automedicoff.sqf", [], 1, false, true, "", "true"];
(leader group LCK_automedicmedic) removeAction LCK_automedicaction;
LCK_automedicexit = true;
LCK_automedicaction = (leader group LCK_automedicmedic) addAction ["Automedic ON", "scripts\automedic.sqf", [true], 1, false, true, "", "true"];