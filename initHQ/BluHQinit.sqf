_hqblu = _this select 0;
blu_hq_created = true;

PosOfBLUHQ = _hqblu;
publicVariable "PosOfBLUHQ";



// create the building
_hq = "Land_Cargo_HQ_V1_F" createVehicle _hqblu;

// create marker on HQ
_markername = format["%1%2",round (_hqblu select 0),round (_hqblu select 1)]; // Define marker name

//hint _markername;
_markerstr = createMarker [str(_markername), _hqblu];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_flag";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText "Main base";
blu_hq_markername = _markername; publicVariable "blu_hq_markername";

// make HQ zone notification trigger
_trg5=createTrigger["EmptyDetector",_hqblu];
_trg5 triggerAttachVehicle [player];
_trg5 setTriggerArea[100,100,0,false];
_trg5 setTriggerActivation["VEHICLE","PRESENT",true];
_trg5 setTriggerStatements["this", format["[""%1"",thislist] execvm 'enterlocation.sqf'",'Main Base'], ""];

// warning trigger when an enemy approaches the camp
_trgWarning=createTrigger["EmptyDetector",_hqblu];
_trgWarning setTriggerArea[500,500,0,false];
_trgWarning setTriggerActivation["EAST","PRESENT",true];
_trgWarning setTriggerStatements["this","[]execVM 'warninghq.sqf'", ""];



// CREATE THE OFFICER
_group = createGroup west;
_hq = _group createUnit ["b_officer_f",(getmarkerpos str(blu_hq_markername)), [], 0, "FORM"];
sleep 0.2;
_hq setformdir 240;
sleep 1;
_hq disableAI "MOVE";
hq_blu1 = _hq;
publicVariable "hq_blu1";
_hq setpos [_hqblu select 0, _hqblu select 1, .59];
_hq setformdir 270;
_hq disableAI "AUTOTARGET";
_hq disableAI "MOVE";
_hq disableAI "ANIM";
_handle = [hq_blu1] execVM "initHQ\HQaddactions.sqf";
removeallweapons _hq;
_handle = [_hq] execVM "sounds\radiochatter.sqf";


//GUARDS
_handle = [(getpos hq_blu1), _hq] execVM "initHQ\guards.sqf";

//STATIC DEFENSES
_handle = [(getpos hq_blu1), _hq] execVM "initHQ\fortify.sqf";


// IF THE OFFICER IS DEAD -- BEGIN OF "SPAWN"
[_hq] spawn {
  _hq = _this select 0;
  waitUntil {sleep 3;!alive _hq};
  _hq switchMove "AidlPercMstpSnonWnonDnon01";

	[["TaskFailed",["","Your commanding officer has been killed"]],"bis_fnc_showNotification"] call BIS_fnc_MP;
	sleep 6;
	if (MisEndCond==0) then {[["officerkilled",false,true],"BIS_fnc_endMission"] call BIS_fnc_MP;}
	else {	
		[[{hint "Your HQ Officer has been killed!\n\nRESPAWN: OFF\n\nYou must now take the island without the help of your commander. The mission will end in failure if all players are killed!"}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;
		officedead = true; publicvariable "officedead";
		// MODIFY ARMY POWER
		WARCOM_opfor_ap = WARCOM_opfor_ap + 50;
		WARCOM_blufor_ap = WARCOM_blufor_ap - 50;
		publicVariable "WARCOM_blufor_ap";
		publicVariable "WARCOM_opfor_ap";
		[[[],"spectate.sqf"],"BIS_fnc_execVM",true,true ] call BIS_fnc_MP;
//		deleteVehicle _hq;
		};	
	
	
  };
// IF THE OFFICER IS DEAD -- End OF "SPAWN"




// TELEPORT PLAYER
player setpos [(_hqblu select 0)-1.5, (_hqblu select 1) +1];
player setdir 110;


//////// HQ GENERATED /////
"respawn_west" setMarkerPos _hqblu;
sleep 0.1;


// BROADCAST, TELL THE HQ POS IS FOUND
HQ_pos_found_generated = true;
publicVariable "HQ_pos_found_generated";

//if (!zones_manually_placed) then {


// SHOW THE STARTUP MENU
if (!zones_created) then {
sleep 0.1;
_nill = [] execVM "dialog\startup\startup.sqf";
waitUntil {chosen_settings};  // WAIT UNTIL THE PLAYER HAS CHOSEN THE SETTINGS
};


// WEATHER INIT
if (dynamic_weather_enable) then {
_weather_script = [] execVM "dialog\startup\weather.sqf";
};

// CALL ZONES GENERATION
//waitUntil {!isNil {getsize_script}};  // WAIT UNTIL THE MAPSIZE SCRIPT IS DONE
if (!zones_created && !manually_chosen) then {      // CHECK IF ZONES ARE PLACED, IF NOT EXECUTE locatorZonesV1.sqf
        _zones_create = [50, 0.2] execVM "initZones\locatorZonesV1.sqf";   // CHECK IF ZONES HAVE ALREADY BEEN PLACED
    } else {
        sleep 3;
        _zones_create = [50, 0.2] execVM "initZones\locatorZonesV2.sqf";
    };
};

player allowDamage true;
if (debugmode) exitWith {};

if (isServer) then {
_sitrep = [player,"sitrep"] call BIS_fnc_addCommMenuItem;
};