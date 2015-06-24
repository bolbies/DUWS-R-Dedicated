_exiting = false;
_cpreward = 25;
_apreward = 25;

if (!isNil "TPH1") then
{
    if (alive TPH1) exitWith {_exiting = true;hint "**YOUR TPH IS STILL INTACT**\n\nOnly 1 TPH is permitted on the map at a time, please choose another mission for now."};

};

if (_exiting) exitWith {true};
_MissionPos = _this select 0;
// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 500;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

_initpos = getpos hq_blu1;

// CREATE NAME
_mission_name = MissionNameCase10;


// CREATE MARKER (ICON)
_markername = format["recov%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_pickup";
str(_markername) setMarkerColor "Color3_FD_F";
str(_markername) setMarkerText "Recover Transporter Heli";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipserecov",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "Color3_FD_F";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3;

// CREATE Mobile armory vehicle and give it a name with public variable
_tph1 = "I_Heli_Transport_02_F" createVehicle (_missionpos);
_Varname = "TPH1";
_tph1 SetVehicleVarName _VarName;
_tph1 Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName];





// TASK AND NOTIFICATION
_taskhandle = player createSimpleTask ["taskRecover"];
_taskhandle setSimpleTaskDescription ["RECOVER THE TPH<br/>Transport Helicopter<br/><br/>",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;
[[{hint"**New Side Mission Loaded**\n\ncheck your map!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;



// CREATE PATROLS
sleep 1;
[_missionpos, 15] execvm "createoppatrol.sqf"; // <-- around target
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
[_randompos, _radius] execvm "createopteam.sqf";

_group = createGroup east;
_unit = _group createUnit ["O_Soldier_SL_F", _missionpos, [], 0, "FORM"];
_unit = _group createUnit ["O_Soldier_LAT_F", _missionpos, [], 0, "FORM"];
_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];


// MISSION COMPLETED --   ATTENDRE QUE LE CAMION SOIT ARRIVE A LA BASE OU DETRUIT
waitUntil {sleep 2; ((getdammage TPH1)>0.95 OR (TPH1 distance _initpos)<50)};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

player removeSimpleTask _taskhandle;

if (getdammage TPH1>0.95) exitWith
{
  ["TaskFailed",["","The AAF Transport helicopter was destroyed!"]] call bis_fnc_showNotification;
  [[{hint"**Side Mission FAILED**\n\nthe AAF Transport helicopter was destroyed"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
};

// IF THE MISSION IS COMPLETE

[[{hint"**Side Mission**\n\nSuccessfuly Completed!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
sleep 2;
//[[{hint"Adding MTV to teleport options..."}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;


// Give cookies  (bonus & notifications)
[_cpreward, _apreward] execvm "missions\mission_reward.sqf";


// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";

// ADD VEHICLE MARKER

TPH1cap = true;
publicvariable "TPH1cap";
[[{[TPH1, "mil_triangle", "ColorBlue", "2", "2", "TPH-1"] call kndr_assignMarker}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;
sleep 1;
// We're not adding anything here, but we can use this heli as transport. Maybe we can configure it as separate MTV, but this will be too OP.
//[[{TPH1 addaction ["<t color='#15ff00'>FOB/Teleport</t>","dialog\fob\FOBmanageropen.sqf", "", 0, true, true, "", "_this == player"]}],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;



sleep 5;
//[[{hint"...Armory modifications complete!\nYou can now use the Zamak(Armory) as a mobile armory!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
