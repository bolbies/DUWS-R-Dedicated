_cpreward = 200;
_apreward = 30;
_exiting = false;
if (!isNil "GORGON1") then
{
    if (alive GORGON1) exitWith {_exiting = true;hint "**YOUR GORGON VEHICLE IS STILL INTACT**\n\nOnly 1 GORGON is permitted on the map at a time, please choose another mission for now."};
    
};
 
if (_exiting) exitWith {true};


[[{[]execVM "missions\missions\roulette\timer.sqf"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
	


_MissionPos = _this select 0;

// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 500;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];


// CREATE NAME
_mission_name = MissionNameCase1;


// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "loc_Transmitter";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Defuse";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3;


// TASK AND NOTIFICATION
_taskhandle = player createSimpleTask ["taskDefuse"];
_taskhandle setSimpleTaskDescription ["DEFUSE THE GORGON<br/>Get a Gorgon and 200 spendable CP or risk losing it all!<br/><br/>You must locate the defuse code on one of the enemy patrol units in the AO, then locate and safely defuse the armored Gorgon vehicle which is set to explode in 30 minutes. If you succeed your reward will earn you an extra 200 spendable Command Points and you get to keep the Gorgon, but if you fail all of your current Command Points will be taken away!<br/><br/>...well, you'll get to keep 2cp for a ride home and a Sitrep",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));
[["TaskAssigned",["",_mission_name]],"bis_fnc_showNotification"] call BIS_fnc_MP;
[[{hint"**New Side Mission Loaded**\n\ncheck your map!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;


// CREATE vehicle and attach bomb give it a name with public variable
_gorgon1 = "I_APC_Wheeled_03_cannon_F" createVehicle (_missionpos);
_gorgon1 lock true;
_Varname = "GORGON1";
_gorgon1 SetVehicleVarName _VarName;
_gorgon1 Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName];
expl1 = "DemoCharge_Remote_Ammo_scripted" createVehicle position GORGON1;
expl1 attachTo [GORGON1, [1.4,-3.0,-1.1],"otochlaven"];
expl1 setVectorDirAndUp [[-0.1,0.0,1],[0,0,1]];
expl2 = "DemoCharge_Remote_Ammo_scripted" createVehicle position GORGON1;
expl2 attachTo [GORGON1, [1.4,-3.0,-1.2],"otochlaven"];
expl2 setVectorDirAndUp [[-0.1,0,1],[0,0,1]];
expl3 = "DemoCharge_Remote_Ammo_scripted" createVehicle position GORGON1;
expl3 attachTo [GORGON1,[1.4,-3.0,-1.3],"otochlaven"];
expl3 setVectorDirAndUp [[-0.1,0,1],[0,0,1]]; 

[[{[GORGON1, 1800] execVM "missions\missions\roulette\bomb\keypad_defuse\BombTimer.sqf"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
[[{GORGON1 addAction [("<t color='#E61616'>" + ("Access Bomb Keypad") + "</t>"),"missions\missions\roulette\bomb\keypad_defuse\defuseAction.sqf","",1,true,true,"","(_target distance _this) < 5"]}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;



// CREATE PATROLS with secret code
sleep 1;
_bombcode1 = [_randompos, EAST, ["O_Soldier_F", "O_Soldier_F"],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
[_bombcode1, _randompos, 300] call bis_fnc_taskPatrol;
_bombcode1 allowFleeing 0;
_bombcode1 = leader _bombcode1;
_Varname = "BOMBCODE1";
_bombcode1 SetVehicleVarName _VarName;
_bombcode1 Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName]; 
waitUntil {alive BOMBCODE1};
[[{leader BOMBCODE1 addAction [("<t color='#ff0011'>" + ("Search his papers") + "</t>"),"missions\missions\roulette\bomb\keypad_defuse\searchAction.sqf","",1,true,true,"","(_target distance _this) < 5"]}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;
leader BOMBCODE1 setVariable["persistent",true];
[[{leader BOMBCODE1 addEventHandler ["killed", {[]call deathhint}]}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;




// CREATE PATROLS without secret code
sleep 1;
[_missionpos, 15] execvm "createopteam.sqf"; // <-- around target		
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
 


// MISSION COMPLETED --   ATTENDRE QUE LA TOUR SOIT KO 
waitUntil {sleep 2; (!alive GORGON1 or DEFUSED)};

// IF MISSION FAILS////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ((!alive GORGON1) && (!DEFUSED)) exitWith {
	
[["TaskFailed",["","The armored vehicle is destroyed, Command Points Lost!"]],"bis_fnc_showNotification"] call BIS_fnc_MP;
[[{hint"**Side Mission FAILED**\n\n...the vehicle was destroyed\n\nYou Only Have 2 Command Points Remaining!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
commandpointsblu1 = commandpointsblu1 - commandpointsblu1 + 2;
publicVariable "commandpointsblu1";  
sleep 2;
deleteVehicle BOMBCODE1;
deleteMarker str(_markername2);
deleteMarker str(_markername);
player removeSimpleTask _taskhandle;  	
};

// IF MISSION SUCCESSFUL////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
if (DEFUSED) then {

sleep 2;
// Give cookies  (bonus & notifications)
[_cpreward, _apreward] execvm "missions\mission_reward.sqf";

sleep 1;
deleteVehicle BOMBCODE1;
removeAllActions GORGON1;
GORGON1 lock false;
deleteMarker str(_markername2);
deleteMarker str(_markername);
player removeSimpleTask _taskhandle;
sleep 1;
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
[[{hint"**Side Mission**\n\nSuccessfuly Completed!\n\n200 COMMAND POINTS AWARDED!!"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
sleep 2;
};
	
	
	

 



                       
