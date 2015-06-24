////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Shockwave script 0.99
//
// Made by Khalashnikovf
// Thanks to lk and his awesome Nuke script
//
// Script is working to best of simulates effect caused by huge esplosion which is affecting close by units.
// Whole effect is based on speed of spreading wave in air and its power according to distance from center of explosion.
// Function works in hyperbolic and logharithm curves to make most believeble progress of blast
// It also "waporize" closest units especially men.
//
// Example: nul = [center,kT] execvm "lk\nuke\shockawe.sqf"; (center is a center of explosion,kT is power of nuke in kT)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (!isServer) exitWith {};

_pos = _this select 0;
_kT = _this select 1;

AllArray = [];
timeAfter = 0;
plus = (1.5 + random 1);

// Shockwave affect
AllArray = nearestObjects [_pos,["Man","LandVehicle","Air","Ship","Fence","Thing"], 1000];
_null = [_pos] execVM "lk\nuke\shockpush3.sqf";

// Instant waporazing of any vehicle or unit in closest area to Blast
[_pos,_kT] execvm "lk\nuke\shockaweStatic.sqf";
_array = _pos nearObjects ["Motorcycle",(100)]; //(ln(_kT)+1) * 
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Car",(100)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["StaticWeapon",(150)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Tank",(50)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Ship",(150)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Air",(100)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Man",(200)];
{deleteVehicle _x;} forEach _array;
_array = _pos nearObjects ["Thing",(250)];
{_x setDamage 1;} forEach _array;

while {shockWaveSpreadDistance < (shockDistance - 1)} do {
heatPlus = ln(heatDistance - heatWaveSpreadDistance)*((ln(_kT)+1)*88)/20;
if (heatPlus > 0) then {heatWaveSpreadDistance = heatWaveSpreadDistance + heatPlus; };
if (heatWaveSpreadDistance >= (heatDistance - 1)) then {heatWaveSpreadDistance = (heatDistance);};
shockWaveSpreadDistance = shockWaveSpreadDistance + ln(shockDistance - shockWaveSpreadDistance)*((ln(_kT)+1)*41)/20;
//hintSilent format ["Heatwave: %1 \n Shockwave: %2",heatWaveSpreadDistance,shockWaveSpreadDistance];
sleep 0.05;
};
	while {timeAfter < radTime} do
	{
		plus = (1.5 + random 1);
		sleep plus;
		timeAfter = timeAfter + plus;
	};