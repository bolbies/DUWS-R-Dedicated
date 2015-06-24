_pos = getpos player;

_plane = createVehicle ["ldl_c130j", _pos,[], 0, "FLY"];
_plane setpos [_pos select 0, _pos select 1, (_pos select 2) + 1000];
_planegroup = createGroup west; 

_pilot = _planegroup createUnit ["B_Pilot_F", [5,5,5], [], 0, "NONE"];
_copilot = _planegroup createUnit ["B_Pilot_F", [5,5,5], [], 0, "NONE"];
_pilot setcaptive true;
_pilot allowfleeing 0;
_pilot disableAI "Target";  
_pilot moveindriver _plane;
_copilot moveInTurret [_plane, [0]];
_plane land "LAND";

//waitUntil {(speed _plane) < 70};
//waituntil {(getposatl _plane select 2) <= 5};
waituntil {(istouchingground _plane)};
_plane engineOn false;
_plane setFuel 0;

waitUntil {(speed _plane) <= 0};
_plane setDamage 0;
deletevehicle _pilot;
deletevehicle _copilot;
_plane setfuel 1;

waitUntil {(speed _plane) <= 0};
if (!alive _plane) then {hint "Your AC-130 has crashed"} else {
	_pos2 = getPos _plane;
	_marker = format["plane",_pos2]; // Define marker name
	_markerstr = createMarker [str(_marker), _pos2];
	_markerstr setMarkerShape "ICON";
	str(_marker) setMarkerType "hd_end";
	str(_marker) setMarkerColor "ColorGreen";
	str(_marker) setMarkerText "AC-130 Lands Here";

	//_plane addAction ["<t color='#00b7ff'>Pick where you want to drop</t>", "support\mapclickhalo.sqf", [_plane, _planegroup, _pos2, _marker, _pilot], 0, true, true, "", "vehicle _this == _target"];
};