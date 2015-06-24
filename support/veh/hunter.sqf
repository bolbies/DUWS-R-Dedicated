_pos = getPos player;

if (commandpointsblu1<28) exitWith {"Not enough command points (28CP required)"};

commandpointsblu1 = commandpointsblu1 - 28;
publicVariable "commandpointsblu1";

hint "A Hunter HMG has been dropped near your location";

_parachute = "B_Parachute_02_F" CreateVehicle _pos;
_parachute setPos [_pos select 0, _pos select 1, (_pos select 2)+100];

_hunter = "B_MRAP_01_hmg_F" CreateVehicle [_pos select 0,_pos select 1,(_pos select 2)+100];
_hunter attachTo [_parachute,[0,0,3]];