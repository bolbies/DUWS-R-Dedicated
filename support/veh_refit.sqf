_mounted_veh = vehicle player;
_fobFound = false;



{
fobpos = getpos _x; // get the pos of the checked FOB
if (fobpos distance player < 50) exitWith {_fobFound=true}; // leave the foreach loop with
} forEach Array_of_FOBS;







 


if (commandpointsblu1<2) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (2CP required)"]] call bis_fnc_showNotification;
};

if (_mounted_veh==player) exitWith {
Hint "You must be inside a vehicle to refit it."};


if ((!_fobFound) && ((hq_blu1 distance player)>50)) exitWith {["veh_refit_hint",["Too far away","Your vehicle must be near the base or an FOB"]] call bis_fnc_showNotification};



commandpointsblu1 = commandpointsblu1 - 2;
publicVariable "commandpointsblu1";
_mounted_veh setDamage 0;
_mounted_veh setFuel 1;
_mounted_veh setVehicleAmmoDef 1;
["veh_refit_hint",["Vehicle ready !","Your vehicle has been rearmed, refueled and repaired"]] call bis_fnc_showNotification;



// Array_of_FOBS  Land_Cargo_HQ_V1_F