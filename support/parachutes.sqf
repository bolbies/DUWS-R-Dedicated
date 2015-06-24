_unit = _this select 0;
_plane = _this select 1;

waitUntil {(getpos _unit select 2) <= 150};
_pack = unitBackpack _unit;
_pack attachTo [_unit,[0,-0.13,0],"Pelvis"]; 
_pack setVectorDirAndUp [[0,0,1],[0,1,0]]; //flip pack upside down

_unit addBackpack "B_Parachute";
_unit action ["OpenParachute", _unit];
_unit allowdamage false;

if !((vehicle _unit) isKindOf "ParachuteBase") exitWith {};
if (isTouchingGround _unit) exitWith {};
if ((getPosATL _unit select 2) < 0.75) then
{
	private ["_parachute"];
	_parachute = nearestObjects [_unit, ["ParachuteBase"], 5];
	{
		deletevehicle _x;
	} count _parachute;
	_unit switchMove "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon";
};

waitUntil {isTouchingGround _unit};

detach _pack;

_pack setVectorDirAndUp [[0,0,-1],[0,-1,0]];
_pack setPos (getpos _unit);
_unit action ["TakeBag",_pack];
sleep 10;
_unit allowdamage true;