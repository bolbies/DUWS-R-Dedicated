_pos = [];
_plane = (_this select 3) select 0;
_planegroup = (_this select 3) select 1;
_pos2 = (_this select 3) select 2;
_markerhere = (_this select 3) select 3;
_pilot = (_this select 3) select 4;
clicked = false;
_radius = 5000;
TakeOff = false;

openMap true;

hint "Click on your map to give coordinates";

OnMapSingleClick format["_null = [_pos] execVM 'support\mapclickhalo2.sqf';clicked=true;waitUntil {scriptDone _null};onMapSingleClick ''", _pos];

//waitUntil {scriptDone _null};

deleteMarker str(_markerhere);

_inVehCheck = true;
while {_inVehCheck} do {
waitUntil {sleep 0.1;TakeOff or (getdammage _plane > 0.7 or !alive _pilot)};
if (getdammage _plane > 0.7 or !alive _pilot) exitWith {};
if (vehicle player != _plane) then {TakeOff = false; hint "You must be in the plane"; _plane addAction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", "support\mapclickhalo.sqf", [_plane, _planegroup, _pos2, _marker], 0, true, true, "", "vehicle _this == _target"];} else {_inVehCheck = false;};
};

_plane setDamage 0;
_plane setFuel 1;

_wp = _planegroup addWaypoint [clickedPos,0];
_wp setWaypointType "MOVE";
[_planegroup, 1] setWaypointCombatMode "BLUE";
_plane flyInHeight 1000;

_test = "Land_HelipadEmpty_F" createVehicle [(clickedPos select 0), (clickedPos select 1), (clickedPos select 2)+1000];

sleep 15;
titleText ["En route to jump zone...", "BLACK OUT", 3];
sleep 3.5;
_plane setpos [(getpos _test select 0)+(random _radius), (getpos _test select 1)+(random _radius), (getpos _test select 2)+2000];
_vel = velocity _plane;
_dir = direction _plane;
_speed = 100; comment "Added speed";
_plane setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];
//_plane setVelocity [500, 100, 30];
sleep 3;
titleText ["En route to jump zone...", "BLACK IN", 4];
waitUntil 
{_x assignasCargo _plane; _x moveinCargo{([getPos _plane select 0, getPos _plane select 1, 0] distance getPos _test) < 300}; _plane} foreach (units group player);
{unassignVehicle _x;_x action ["EJECT", vehicle _plane]; sleep 0.2; nul = [_x, _plane] execVM "support\parachutes.sqf";} foreach assignedCargo _plane;
waitUntil {{_x in _plane} count (assignedCargo _plane) == 0};
sleep 3;
deleteVehicle _test;

_wp = _planegroup addWaypoint [_pos2,0];
_wp setWaypointType "MOVE";
[_planegroup, 1] setWaypointCombatMode "BLUE";
_test = "Land_HelipadEmpty_F" createVehicle [(_pos2 select 0), (_pos2 select 1), (_pos2 select 2)+1000];
waitUntil {([getPos _plane select 0, getPos _plane select 1, 0] distance getPos _test) < 150};
_plane land "LAND";
deleteVehicle _test;

waitUntil {(getposatl _plane select 2) <= 5};
_plane engineOn false;
_plane setFuel 0;