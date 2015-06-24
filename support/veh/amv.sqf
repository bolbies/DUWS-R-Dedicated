_pos = getPos player;

if (commandpointsblu1<45) exitWith {"Not enough command points (45CP required)"};

commandpointsblu1 = commandpointsblu1 - 45;
publicVariable "commandpointsblu1";

hint "An AMV-7 Marshall has been dropped near your location";

_parachute = "B_Parachute_02_F" CreateVehicle _pos;
_parachute setPos [_pos select 0, _pos select 1, (_pos select 2)+100];

_hunter = "B_APC_Wheeled_01_cannon_F" CreateVehicle [_pos select 0,_pos select 1,(_pos select 2)+100];
_hunter attachTo [_parachute,[0,0,3]];