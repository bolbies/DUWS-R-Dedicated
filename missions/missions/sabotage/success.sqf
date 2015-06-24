_arguments = _this select 3;
_missionPos   = _arguments select 0;
_mission_name = _arguments select 1;
_markername   = _arguments select 2;
_markername2  = _arguments select 3;
_cpreward = 20;
_apreward = 20;
_action = _this select 2;
_object = _this select 0;

hint "Sabotage done!";

private "_taskhandle";

_VARtaskgeneratedName = format["tsksabot%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task
call compile format["_taskhandle = %1",_VARtaskgeneratedName]; // recall variable and inject it into handle

_object removeAction _action;

player removeSimpleTask _taskhandle;


deleteMarker str(_markername2);
deleteMarker str(_markername);

// Give cookies  (bonus & notifications)
[_cpreward, _apreward] execvm "missions\mission_reward.sqf";


// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
