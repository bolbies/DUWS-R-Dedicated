
_target = _this select 0;

deletemarkerlocal "nukemarker";

_array = _target nearObjects ["Man", 1000];;
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Land", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Ship", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Motorcycle", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Car", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Air", 1000];
{_x setdammage ((getdammage _x) + 0.5)} forEach _array;

_array = _target nearObjects ["Tank", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Thing", 100];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Static", 500];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["Strategic", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

_array = _target nearObjects ["NonStrategic", 1000];
{_x setdammage ((getdammage _x) + 1.0)} forEach _array;


_array = (nearestObjects [_target,[], 300]) - ((getPos _target) nearObjects 300);
if dtree then {{DeleteCollection _x} forEach _array} else {{_x setdammage 1.0} forEach _array};


sleep 7;
_array = (_target nearObjects ["All", 1500]) - ((getPos _target) nearObjects 1000);
{_x setdammage ((getdammage _x) + 0.4)} forEach _array;

nul = [_target] execVM "lk\nuke\radzone.sqf";
