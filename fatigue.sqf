
player enableFatigue false;
{ _x enableFatigue false;} forEach allUnits; 
player addEventhandler ["Respawn", {player enableFatigue false}];
