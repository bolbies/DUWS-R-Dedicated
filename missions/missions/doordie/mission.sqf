//0= {_x setpos [getpos hq_blu1 select 0, (getpos hq_blu1 select 1)+20];} forEach units _bombcode1;/////////////////////////////////////////////////////////////

_cpreward = 250;
_apreward = 35;

[[{[]execVM "missions\missions\doordie\timer.sqf"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;

_MissionPos = _this select 0;
// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 350;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

// CREATE NAME
_mission_name = MissionNameCase2;


// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "loc_Transmitter";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Find Code in Briefcase!";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3;


// TASK AND NOTIFICATION
_taskhandle = player createSimpleTask ["taskFindcode"];
_taskhandle setSimpleTaskDescription ["DO or DIE!<br/>You Must Save Your Commanding Officer.<br/><br/>You must go to the AO marked on your map and locate the briefcase which contains the secret defuse code, then make it back to HQ within 30 minutes so you can disarm the bomb that is attached to the officer.<br/><br/>If you are successful you will earn 250 spendable CP, if you are not successful it's Mission Over and you lose at DUWS!",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));
["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;
[[{hint"**New Side Mission Loaded**\n\ncheck your map!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;

// CREATE bomb, timer and keypad on Officer

expl1 = "DemoCharge_Remote_Ammo_scripted" createVehicle position hq_blu1;
expl1 attachTo [hq_blu1, [-0.1,0,0.15],"pelvis"];
expl1 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
expl2 = "DemoCharge_Remote_Ammo_scripted" createVehicle position hq_blu1;
expl2 attachTo [hq_blu1, [0,0,0.15],"pelvis"];
expl2 setVectorDirAndUp [[1,0,0],[0,1,0]];
expl3 = "DemoCharge_Remote_Ammo_scripted" createVehicle position hq_blu1;
expl3 attachTo [hq_blu1,[0.1,0,0.15],"pelvis"];
expl3 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]]; 
[[{KEYPAD1 = hq_blu1 addAction [("<t color='#E61616'>" + ("Access Bomb Keypad") + "</t>"),"missions\missions\doordie\bomb\keypad_defuse\defuseAction.sqf","",1,true,true,"","(_target distance _this) < 5"]}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;
[hq_blu1, 1800] execVM "missions\missions\doordie\bomb\keypad_defuse\BombTimer.sqf";
hq_blu1 switchmove "AmovPsitMstpSnonWnonDnon_ground";
publicVariable "KEYPAD1";




// CREATE BRIEFCASE
sleep 1;
_bombcode1 = createVehicle ["Land_Suitcase_F", _missionpos, [], 0, "NONE"];
_Varname = "BOMBCODE1";
_bombcode1 SetVehicleVarName _VarName;
_bombcode1 Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName]; 
waitUntil {alive BOMBCODE1};
[[{BOMBCODE1 addAction [("<t color='#ff0011'>" + ("Search Briefcase") + "</t>"),"missions\missions\doordie\bomb\keypad_defuse\searchAction.sqf","",1,true,true,"","(_target distance _this) < 5"]}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;


// CREATE PATROLS
sleep 1;
[_missionpos, 15] execvm "createopteam.sqf"; // <-- around target		
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
 


// MISSION COMPLETED --   ATTENDRE QUE LA TOUR SOIT KO 
waitUntil {sleep 2; (EXPL or DEFUSED or officedead)};


//IF OFFICER KILLED BY ENEMY DURING MISSION, BUT MISSION DOES NOT END///////////////////////////////////////////////////////////////////////////////////
if ((MisEndCond==1) && (officedead) && (!DEFUSED) && (!EXPL)) exitWith {

sleep 5;	
["TaskFailed",["","Your commanding officer has been killed, All Command Points Lost!"]] call bis_fnc_showNotification;
[[{hint"**Side Mission FAILED**\n\nYour commanding officer was killed, All Command Points Lost!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
commandpointsblu1 = commandpointsblu1 - commandpointsblu1 + 1;
publicVariable "commandpointsblu1";  
sleep 2;
deleteVehicle BOMBCODE1;
deleteMarker str(_markername2);
deleteMarker str(_markername);
player removeSimpleTask _taskhandle;  	
};

// IF MISSION FAILS, BUT OFFICER SURVIVES////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ((alive hq_blu1) && (!DEFUSED) && (EXPL)) exitWith {

sleep 5;	
["TaskFailed",["","The HQ is destroyed, All Command Points Lost!"]] call bis_fnc_showNotification;
[[{hint"**Side Mission FAILED**\n\nthe HQ was destroyed, All Command Points Lost!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
commandpointsblu1 = commandpointsblu1 - commandpointsblu1 + 1;
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
[[{hq_blu1 removeaction KEYPAD1}], "BIS_fnc_Spawn",true] call BIS_fnc_MP;
hq_blu1 switchMove "acts_StandingSpeakingUnarmed";
deleteMarker str(_markername2);
deleteMarker str(_markername);
player removeSimpleTask _taskhandle;
sleep 1;
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
[[{hint"**Side Mission**\n\nSuccessfuly Completed!\n\n250 COMMAND POINTS AWARDED!!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
sleep 2;
};
	
	
	

 



                       
