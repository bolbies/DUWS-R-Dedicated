private ["_array","_pos","_rad","_force","_xPos","_yPos","_push","_time","_xVel","_yVel","_zVel","_coef"];

_pos = _this select 0;
_kT = _this select 1;

sleep (100/300);

{_x setdamage 1} forEach (nearestObjects [_pos, [], 1000]);

sleep (7/3);

//{_x setdamage (0.5 + random 0.45)} forEach (nearestObjects [_pos, [], 1500]);
_array = _pos nearObjects ["Strategic", 1500];
{if ((_x distance _pos > 1000) && (_x distance _pos < 1500)) then {_x setDamage (0.5 + random 0.45);};} forEach _array;
_array = _pos nearObjects ["NonStrategic", 1500];
{if ((_x distance _pos > 1000) && (_x distance _pos < 1500)) then {_x setDamage (0.5 + random 0.45);};} forEach _array;

sleep 2;

//{_x setdamage (0.1 + random 0.5)} forEach (nearestObjects [_pos, [], 2000]);
_array = _pos nearObjects ["Strategic", 2000];
{if ((_x distance _pos > 1500) && (_x distance _pos < 2000)) then {_x setDamage (0.1 + random 0.5);};} forEach _array;
_array = _pos nearObjects ["NonStrategic", 2000];
{if ((_x distance _pos > 1500) && (_x distance _pos < 2000)) then {_x setDamage (0.1 + random 0.5);};} forEach _array;

/*{_x setDamage 1} forEach nearestObjects [_pos,[],((ln(_kT)+1)*150)];

sleep (700/300);

_array = _pos nearObjects ["Strategic", ((ln(_kT)+1)*600)];
{if (_x distance _pos > ((ln(_kT)+1)*150)) then {_x setDamage (0.95);};} forEach _array;
_array = _pos nearObjects ["NonStrategic", ((ln(_kT)+1)*900)];
{if (_x distance _pos > ((ln(_kT)+1)*150)) then {_x setDamage (0.95);};} forEach _array;

sleep (600/300);

_array = _pos nearObjects ["Strategic", ((ln(_kT)+1)*1000)];
{if (_x distance _pos > ((ln(_kT)+1)*900)) then {_x setDamage (0.5 + random 0.3);};} forEach _array;
_array = _pos nearObjects ["NonStrategic", ((ln(_kT)+1)*1500)];
{if (_x distance _pos > ((ln(_kT)+1)*900)) then {_x setDamage (0.5 + random 0.3);};} forEach _array;