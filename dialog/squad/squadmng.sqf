  _handle = createDialog "squad_mng_dialog";  
  waitUntil {dialog};

////////////////////////////////////////////////////////////////////////////////////  
// CURRENT NUMBERS OF ALIVE UNITS ON MAP
//
//_aliveOpVehicles = {alive _x && side _x == opfor} count vehicles;
//_aliveOpUnits = {alive _x && side _x == opfor} count allunits;
//_aliveBluUnits = {alive _x && side _x == blufor} count allunits;
//_aliveallunits = {alive _x} count allunits;
//if (Warcom_Limiter_Param == 1) then {
//aliveAllUnits = {alive _x} count allunits;
//hint format ["There Are Currently:\n\n%1 TOTAL UNITS\n\nAlive In The Mission", aliveAllUnits];
//sleep 3;
//};
aliveAllUnits = {alive _x} count allunits;
hint format ["There Are Currently:\n\n%1 TOTAL UNITS\nAlive In The Mission\n\nYou Have %2 Command Points\n\nFriendly Army Power: %3\nEnemy Army Power: %4", aliveAllUnits,commandpointsblu1,WARCOM_blufor_ap,WARCOM_opfor_ap];
sleep 2;
_operHandler = []execVM "dialog\operative\operative_mission_complete.sqf";
//////////////////////////////////////////////////////////////////////////////////

