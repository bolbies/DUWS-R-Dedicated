_markername = _this select 0;
_sol1 = _this select 1;
_sol2 = _this select 2;
_sol3 = _this select 3;
_MissionPos = _this select 4;
_markername2 = _this select 5;
_trg = _this select 6;
_cpreward = 10;
_apreward = 15;

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);


private "_task";
_taskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate taskname/variable name
call compile format["_task = %1",_taskgeneratedname]; // recall variable and inject it into handle


player removeSimpleTask _task;


// IF SOLDIERS DEAD
if (!(alive _sol1) && !(alive _sol2) && !(alive _sol3)) exitWith
  {
    ["TaskFailed",["","Rescue the friendly troops"]] call bis_fnc_showNotification;
    
  };



 

// JOIN PLAYER
_sol1 setcaptive false;
_sol2 setcaptive false;
_sol3 setcaptive false;
_sol1 switchMove "AmovPpneMstpSnonWnonDnon";
_sol2 switchMove "AmovPpneMstpSnonWnonDnon";
_sol3 switchMove "AmovPpneMstpSnonWnonDnon";
[_sol1, _sol2, _sol3] joinSilent player;
titleText ["Thanks for the rescue, we'll be fighting with you from now on, lead the way!", "PLAIN DOWN"]; 

sleep 5;

// Give cookies  (bonus & notifications)
[_cpreward, _apreward] execvm "missions\mission_reward.sqf";

// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
