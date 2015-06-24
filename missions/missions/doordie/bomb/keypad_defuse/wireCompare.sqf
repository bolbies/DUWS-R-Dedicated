private ["_cutWire", "_compare"];
_cutWire = _this select 0;

_compare = [WIRE, _cutWire] call BIS_fnc_areEqual;


if (_compare) then {
	hint parseText format["<t align='center'><t size='1.7' color='#33FF00'>Bomb Defused</t>"];
	DEFUSED = true;
	publicVariable "DEFUSED";
	
} else {
	hint parseText format["<t align='center'><t size='1.7' color='#FF3300'>Bomb ARMED</t><br/>GET THE HELL OUT OF THERE!!!!"];
	ARMED = true;
	publicVariable "ARMED";
	WIRE="X"; publicVariable "WIRE";
	CODE=["X"]; publicVariable "CODE";
	
};