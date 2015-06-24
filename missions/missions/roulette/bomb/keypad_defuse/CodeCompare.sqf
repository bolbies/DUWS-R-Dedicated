private ["_code", "_inputCode", "_compare"];
_code = _this select 0;
_inputCode = _this select 1;
_code=CODE;
_compare = [_code, _inputCode] call BIS_fnc_areEqual;

if (_compare) then {
	hint parseText format["<t align='center'><t size='1.7' color='#33FF00'>Bomb Defused</t>"];
	DEFUSED = true;
	publicVariable "DEFUSED";
	
} else {
	hint parseText format["<t align='center'><t size='1.7' color='#FF3300'>Bomb ARMED</t><br/>GET THE HELL OUT OF THERE!!!! (%1 and %2 not equal)",CODE,_inputcode];
	ARMED = true;
	publicVariable "ARMED";
	
	WIRE="X"; publicVariable "WIRE";
	CODE=["X"]; publicVariable "CODE";
};
CODEINPUT = [];