_target = _this select 0;

_location = getpos _target;

if (commandpointsblu1<5) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (2CP required)"]] call bis_fnc_showNotification;
};

_pos = getpos player;

_foundAmmoPos = [_pos, 0,50,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

// try to find a pos, if no pos is found exit the script
if (0 == _foundAmmoPos select 0 && 0 == _foundAmmoPos select 1) exitWith {hint "No valid LZ nearby";};

commandpointsblu1 = commandpointsblu1 - 5;
publicVariable "commandpointsblu1";

hint "A supply crate is on your way";
_helo = createVehicle ["O_Heli_Transport_04_F", [_pos select 0, (_pos select 1)+2000, 200],[], 0, "FLY"];
_helogroup = createGroup west; 
_pilot = _helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
_pilot moveindriver _helo;

_wp = _helogroup addWaypoint [[_foundAmmoPos select 0, _foundAmmoPos select 1], 0];
[_helogroup, 1] setWaypointCombatMode "BLUE";

_ammo = "B_supplyCrate_F" CreateVehicle [_pos select 0, (_pos select 1)+2000, 0];

_helo setslingload _ammo;
_wp setWaypointType "DROP CARGO";

clearMagazineCargo _ammo;
clearWeaponCargo _ammo;
clearItemCargoGlobal _ammo;

_ammo addWeaponCargo ["launch_B_Titan_short_F", 12];
_ammo addWeaponCargo ["launch_B_Titan_F", 12];
_ammo addMagazineCargo ["Titan_AT", 70];
_ammo addMagazineCargo ["Titan_AA", 70];
_ammo addMagazineCargo ["NLAW_F", 70];
_ammo addMagazineCargo ["20Rnd_762x51_Mag", 70];
_ammo addMagazineCargo ["30Rnd_65x39_caseless_mag", 70];
_ammo addMagazineCargo ["30Rnd_65x39_caseless_mag_Tracer", 70];
_ammo addMagazineCargo ["100Rnd_65x39_caseless_mag", 70];
_ammo addMagazineCargo ["100Rnd_65x39_caseless_mag_tracer", 70];
_ammo addMagazineCargo ["30Rnd_556x45_Stanag", 70];
_ammo addMagazineCargo ["7Rnd_408_Mag", 70];
_ammo addMagazineCargo ["5Rnd_127x108_Mag", 70];
_ammo addMagazineCargo ["200Rnd_65x39_cased_Box_Tracer", 70];
_ammo addMagazineCargo ["16Rnd_9x21_Mag", 70];
_ammo addMagazineCargo ["9Rnd_45ACP_Mag", 70];
_ammo addMagazineCargo ["HandGrenade", 70];
_ammo addMagazineCargo ["1Rnd_HE_Grenade_shell", 90];
_ammo addMagazineCargo ["UGL_FlareRed_F", 70];
_ammo addMagazineCargo ["UGL_FlareGreen_F", 70];
_ammo addMagazineCargo ["1Rnd_Smoke_Grenade_shell", 70];
_ammo addMagazineCargo ["1Rnd_SmokeRed_Grenade_shell", 70];
_ammo addMagazineCargo ["Chemlight_green", 70];


if (support_armory_available) then {_ammo addaction ["<t color='#ff1111'>Armory 1 (VAS)</t>","VAS\open.sqf", "", 0, true, true, "", "_this == player"]};
if (support_armory_available) then {_ammo addaction ["<t color='#ff1111'>Armory 2 (VA)</t>","va.sqf", "", 0, true, true, "", "_this == player"]};
 
// magazines[] = {"1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareCIR_F","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell"};

                                                                          
waitUntil {sleep 1; getpos _ammo select 2<0.3};
_smoke = "SmokeShellGreen" CreateVehicle (getpos _ammo);
["info",["Supply delivered","The supply crate has been marked with green smokes"]] call bis_fnc_showNotification;

sleep 5;


_wp = _helogroup addWaypoint [[0,0,0],0];   // tell the helo to leave
_wp setWaypointType "MOVE";

sleep 200;

deleteVehicle _pilot;
deleteVehicle _helo;