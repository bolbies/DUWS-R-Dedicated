_MissionPos = _this select 0;
// define random pos AROUND TARGET. spawn markers at random.
_radius = 300;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];
_cpreward = 20;
_apreward = 20;
// CREATE NAME
_mission_name = MissionNameCase5;


// CREATE MARKER (ICON)
_markername = format["target%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "selector_selectedEnemy";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Assassinate Officer";
str(_markername) setMarkerSize [1, 1];

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipsetarget",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.5;

// CREATE PATROLS
      sleep 1;
      [_missionpos, 15] execvm "createoppatrol.sqf"; // <-- around target
      [_randompos, _radius] execvm "createoppatrol.sqf";
      [_randompos, _radius] execvm "createoppatrol.sqf";
	  [_randompos, _radius] execvm "createoppatrol.sqf";
      [_randompos, _radius] execvm "createopteam.sqf";
	  [_randompos, _radius] execvm "createopteam.sqf";
     // "O_APC_Tracked_02_cannon_F" createVehicle ([(_missionpos select 0)+(random 150),(_missionpos select 1)+(random 150)]); //  	O_APC_Wheeled_02_rcws_F
	  _group = [_randompos, EAST, WARCOM_opf_attack_wave_type,[],[],[0.90,1.0]] call BIS_fnc_spawnGroup;
	  _group setCombatMode "RED";
      _wp = _group addWaypoint [_randompos, 50];
      _wp setWaypointType "MOVE";
	  _wp setWaypointBehaviour "SAFE";
	  _wp setWaypointSpeed "LIMITED";
	  _wp setWaypointCompletionRadius 25;
	  _wp = _group addWaypoint [_randompos, 100];
      _wp setWaypointType "MOVE";
	  _wp setWaypointBehaviour "SAFE";
	  _wp setWaypointSpeed "LIMITED";
	  _wp setWaypointCompletionRadius 80;
	  _wp = _group addWaypoint [_randompos, 100];
      _wp setWaypointType "CYCLE";
	  _wp setWaypointBehaviour "SAFE";
	  _wp setWaypointSpeed "LIMITED";
	  _wp setWaypointCompletionRadius 50;
	  	

_group = createGroup east;
_target = _group createUnit ["O_officer_F", _missionpos, [], 0, "FORM"];
_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];
_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];

// TASK AND NOTIFICATION
_taskhandle = player createSimpleTask ["taskTarget"];
_taskhandle setSimpleTaskDescription ["A high enemy target has been spotted somewhere in this location. Hunt the officer down.",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));

[["TaskAssigned",["",_mission_name]],"bis_fnc_showNotification"] call BIS_fnc_MP;
[[{hint"**New Side Mission Loaded**\n\ncheck your map!"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;


waitUntil {sleep 2; !alive _target};  // MISSION COMPLETED --

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

player removeSimpleTask _taskhandle;

sleep 1;
//execute reward script
_reward = [_cpreward, _apreward, _mission_name] execvm "missions\mission_reward.sqf";

// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
