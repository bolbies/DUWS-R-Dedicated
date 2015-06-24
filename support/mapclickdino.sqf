_timer = 60;
clicked = false;
_pos = [];

// IF NOT ENOUGH PTS
if (commandpointsblu1<50) exitWith {
  ["info",["Not enough command points","Not enough Command Points (50CP required)"]] call bis_fnc_showNotification;
  sleep 30;
_art = [player,"dino"] call BIS_fnc_addCommMenuItem;
};

hint "Click on your map to give coordinates";
OnMapSingleClick format["_null = [_pos] execVM 'support\dinodrop.sqf';clicked=true;onMapSingleClick ''",_pos];

// TIMER
while {_timer>0 AND !clicked} do {

_timer = _timer-1; // remove 1 to timer
sleep 1;
};
// TIMER ELLAPSED OR CLICKED
sleep 900;
_art = [player,"dino"] call BIS_fnc_addCommMenuItem;
OnMapSingleClick "";