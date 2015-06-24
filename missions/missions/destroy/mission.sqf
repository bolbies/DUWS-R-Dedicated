_MissionPos = _this select 0;
// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 400;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];
_cpreward = 25;
_apreward = 25;

// CREATE NAME
_mission_name = MissionNameCase6;


// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "loc_Transmitter";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Destroy";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3; 

// CREATE TOWER
_tower = "Land_TTowerBig_1_F" createVehicle (_missionpos);
_tower setdamage 0.85;
_tower setVectorUp [0,0,1];


// TASK AND NOTIFICATION
_taskhandle = player createSimpleTask ["taskDestroy"];
_taskhandle setSimpleTaskDescription ["We have detected a large amount of enemy trasmissions coming from this area. This is probably caused by a radio tower used by the enemy forces on the island. Destroy the tower. Be sure to take some satchels, which you can find in the armory. Armory can be unlocked at the HQ.",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

// CREATE PATROLS
      sleep 1;
      [_missionpos, 15] execvm "createoppatrol.sqf"; // <-- around target
      [_randompos, _radius] execvm "createoppatrol.sqf";
      [_randompos, _radius] execvm "createopteam.sqf";
      
//      _group = createGroup east;
//_unit = _group createUnit ["O_Soldier_SL_F", _missionpos, [], 0, "FORM"]; 
//_unit = _group createUnit ["O_Soldier_LAT_F", _missionpos, [], 0, "FORM"];
//_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];


// MISSION COMPLETED --   ATTENDRE QUE LA TOUR SOIT KO 
waitUntil {sleep 1; !alive _tower};  

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

player removeSimpleTask _taskhandle;
 
// Give cookies  (bonus & notifications)
[_cpreward, _apreward] execvm "missions\mission_reward.sqf";

// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
                       
