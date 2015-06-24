
//Re-inits all 0-8 menu support unlocks after a "RESUME"


_supplydrop = [player,"ammo"] call BIS_fnc_addCommMenuItem;
[player, _supplydrop] call BIS_fnc_removeCommMenuItem;
hint "supports reinitialized!";
//sleep 2;
