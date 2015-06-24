_helitoremove = _this select 0;
_configEngineName = getText (configfile >> "CfgVehicles" >> typeOf helo >> "HitPoints" >> "HitEngine" >> "name");

sleep 3;

calltaxifrombase = false;

if (_helitoremove == 1) then {
    if ((helo gethit _configEngineName > 0.5) || (getdammage helo > 0.7)) then {
        hint "Heli is too damaged to leave. Self destruct will begin in two minutes";
        //sleep 200;
        helo setdamage 1;
    } else {
        hint "Returning home";
        _wp = helogroup addWaypoint [[0,0,0],0];
        _wp setWaypointType "MOVE";
        [helogroup, 1] setWaypointCombatMode "BLUE";
        helo setfuel 1;
        sleep 200;
        {(deletevehicle _x)} foreach units group helogroup;
        deletevehicle helo;
    };
};