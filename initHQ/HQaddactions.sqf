_hq = _this select 0;


_hq addaction ["<t color='#ffb700'>Player stats</t>","dialog\info\info.sqf", "", 0, true, true, "", "_this == player"];
_hq addAction ["<t color='#ff0066'>HEAL (2CP)</t>", "heal.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#15ff00'>FOB/Teleport</t>","dialog\fob\FOBmanageropen.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#99ff00'>Request units</t>","dialog\request.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#99ff00'>Squad manager</t>","dialog\squad\squadmng.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#15ff00'>Sell resource</t>","support\sell.sqf", "", 0, true, true, "", "_this == player"];


if (support_armory_available) then {_hq addaction ["<t color='#ff0066'>Armory 2 (VA)</t>","va.sqf", "", 0, true, true, "", "_this == player"];};
	
if (support_halo_available) then {_hq addAction ["<t color='#15ff00'>HALO Group (5CP)</t>", "COB_HALO\grphalo.sqf", "", 0, true, true, "", "_this == player"];};

if (isServer) then {
_hq addaction ["<t color='#ffb700'>Rest (wait/save)</t>","savegame.sqf", "", 0, true, true, "", "_this == player"];

};
if (!isServer) then {
_hq addaction ["<t color='#ffb700'>Rest</t>","savegameClient.sqf", "", 0, true, true, "", "_this == player"];
};