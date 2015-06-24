
_arrayOfYellowUnits = [];

{
_team = assignedTeam _x;
	if (_team == "YELLOW") then {
	_arrayOfYellowUnits = _arrayOfYellowUnits + [_x];
	}
} forEach units group player;

if (count _arrayOfYellowUnits<1) exitWith {hint "No units assigned to Yellow team"};

_newGroup = createGroup WEST;
_arrayOfYellowUnits join _newGroup;
{deleteVehicle _x} forEach units (_newGroup); 


hint "Group members disbanded!";