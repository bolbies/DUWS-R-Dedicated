_target = _this select 0;

_lz = getpos _target;

if (commandpointsblu1<24) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (25CP required)"]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - 24;
publicVariable "commandpointsblu1";

hint "Reinforcements ETA: 1 minute";
sleep 60;
hint "Paratroopers deployed";

_group = creategroup WEST;
_radius = 130;

_parachute1 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute1 setPos [_lz select 0, _lz select 1, (_lz select 2)+150];
_soldier1 = _group createUnit ["B_medic_F",[0,0,0],[],0,"form"];
_soldier1 moveindriver _parachute1;
if (revive_activated == 2) then {[_soldier1] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier1 enablefatigue false;};

_parachute2 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute2 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier2 = _group createUnit ["B_Soldier_LAT_F",[0,0,0],[],0,"form"];
_soldier2 moveindriver _parachute2;
if (revive_activated == 2) then {[_soldier2] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier2 enablefatigue false;};

_parachute3 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute3 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier3 = _group createUnit ["B_Soldier_GL_F",[0,0,0],[],0,"form"];
_soldier3 moveindriver _parachute3;
if (revive_activated == 2) then {[_soldier3] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier3 enablefatigue false;};

_parachute4 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute4 setPos [_lz select 0, _lz select 1, (_lz select 2)+150];
_soldier4 = _group createUnit ["B_soldier_gl_F",[0,0,0],[],0,"form"];
_soldier4 moveindriver _parachute4;
if (revive_activated == 2) then {[_soldier4] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier4 enablefatigue false;};

_parachute5 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute5 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier5 = _group createUnit ["B_Soldier_ar_F",[0,0,0],[],0,"form"];
_soldier5 moveindriver _parachute5;
if (revive_activated == 2) then {[_soldier5] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier5 enablefatigue false;};

_parachute6 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute6 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier6 = _group createUnit ["B_Soldier_F",[0,0,0],[],0,"form"];
_soldier6 moveindriver _parachute6;
if (revive_activated == 2) then {[_soldier6] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier6 enablefatigue false;};

_parachute7 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute7 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier7 = _group createUnit ["B_Soldier_lat_F",[0,0,0],[],0,"form"];
_soldier7 moveindriver _parachute7;
if (revive_activated == 2) then {[_soldier7] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier7 enablefatigue false;};

_parachute8 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute8 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier8 = _group createUnit ["B_Soldier_ar_F",[0,0,0],[],0,"form"];
_soldier8 moveindriver _parachute8;
if (revive_activated == 2) then {[_soldier8] execvm 'ais_injury\init_ais.sqf';};
if (player_fatigue == 0) then {_soldier8 enablefatigue false;};


sleep 60;

{[_x] joinSilent player} forEach units _group;
hint "The paratroopers have been added under your command";