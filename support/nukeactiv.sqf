_position = _this select 0;
_radius = _this select 1;

hint "Coordinates recieved";

_markernuke = format["%1%2vc",round(_position select 0),round(_position select 1)]; // Define marker name
_markerstr = createMarker [str(_markernuke), _position];
_markerstr setMarkerShape "ELLIPSE";
str(_markernuke) setMarkerBrush "SolidBorder";
str(_markernuke) setMarkerColor "ColorGrey";
str(_markernuke) setMarkerSize [_radius, _radius];
str(_markernuke) setMarkerAlpha 0.5;

// create unit for comms
_group = createGroup west;
_unit = _group createUnit ["B_Soldier_SL_F", [0,0,0], [], 0, "FORM"];
_unit allowDamage false;

_unit sidechat format["This is Widow-maker, we are approaching the designated target area, ETA 1 minute"];
sleep 30;
_unit sidechat format["This is Widow-maker, ETA 30 seconds"];
sleep 30;
_unit sidechat format["This is Widow-maker, we have the target in visual, release in 15 seconds."];
sleep 15;
_unit sidechat format["Detonation in 10 seconds."];
sleep 10;

_test = "Land_HelipadEmpty_F" createVehicle [(_position select 0), (_position select 1), (_position select 2)];

_test setVehicleVarName "nukepos"; nukepos = _test;

//nuke_activated = true;

_nuke = execVM "support\nuke\nuke.sqf";

sleep 10;

deletemarker str(_markernuke);
deleteVehicle _unit;
deleteVehicle _test;