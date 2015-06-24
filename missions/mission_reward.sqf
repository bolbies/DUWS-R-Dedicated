//event handler for mission complete
// PARAMS:
// 1: command points reward
// 2: army power reward (both +BLUFOR and -OPFOR)
// 3: mission name (used in notifications)
// [25, 20, _mission_name] execvm "missions\mission_reward.sqf";

_cpreward = _this select 0;
_apreward = _this select 1;
_mission_name = _this select 2;

_cp_multiplied_reward = _cpreward;
["TaskSucceeded",["",_mission_name]] call bis_fnc_showNotification;
["cpaddedmission",[_cp_multiplied_reward]] call bis_fnc_showNotification;
commandpointsblu1 = commandpointsblu1 + _cp_multiplied_reward;
missions_success = missions_success + 1;
WARCOM_blufor_ap = WARCOM_blufor_ap + _apreward;
opfor_ap = opfor_ap - _apreward;
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";
publicvariable "finishedMissionsNumber";
_operHandler = execVM "dialog\operative\operative_mission_complete.sqf";
