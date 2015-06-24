_pos = getPos player;

if (commandpointsblu1<50) exitWith {"Not enough command points (50CP required)"};

commandpointsblu1 = commandpointsblu1 - 50;
publicVariable "commandpointsblu1";

hint "An M2a4 Slammer UP has been dropped near your location";

_parachute = "B_Parachute_02_F" CreateVehicle _pos;
_parachute setPos [_pos select 0, _pos select 1, (_pos select 2)+100];

_hunter = "B_MBT_01_TUSK_F" CreateVehicle [_pos select 0,_pos select 1,(_pos select 2)+100];
_hunter attachTo [_parachute,[0,0,3]];