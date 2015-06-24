private ["_target","_marker","_marker2"];

sleep 5;
[player,-1,0.8,false] call bis_fnc_sandstorm;

_target = _this select 0;

nukeNumber = 0;
nukeNumber = nukeNumber + 1; 		// what is number of nuke blasted?

_marker = createMarkerLocal [(format ["radiationmarker1_%1",nukeNumber]), position _target];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [1000, 1000];
_marker setMarkerColorLocal "ColorRed";

_marker2 = createMarkerLocal [(format ["radiationmarker2_%1",nukeNumber]), position _target];
_marker2 setMarkerShapeLocal "Icon";
_marker2 setMarkerTypeLocal "Dot";
_marker2 setMarkerColorLocal "ColorRed";

[_target] Spawn {
	Private ["_dammageable","_target"];
	_target = _this select 0;

	for [{_x = 0},{_x < (radTime / 3)},{_x = _x + 1}] do {
		if (player distance _target < 1000) then {
		//hintsilent parseText "<t color='#ff3300' size='2.0' shadow='1' shadowColor='#000000' align='center'>CATACLYSMAL AREA</t>";
		//playsound "radzoneb";};
		_range = _range + 300;
		sleep (2.5 + random 1);
	};
	deleteVehicle _target;
	deletemarkerlocal "radiationmarker";
	deletemarkerlocal "radiationmarker2";
	"dynamicBlur" ppEffectEnable false;
	"colorCorrections" ppEffectEnable false;
	nukev=true;
};