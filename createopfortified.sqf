_position = _this select 0;
_group = [];




// hint format["%1",_position];

if (Warcom_Limiter_Param == 1) then {
_group = [_position, EAST, ["O_Soldier_SL_F","O_Soldier_AA_F","O_Soldier_AT_F","O_Soldier_GL_F"],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
};

if (Warcom_Limiter_Param == 0) then {
_group = [_position, EAST, ["O_Soldier_SL_F","O_Soldier_AA_F","O_Soldier_AT_F","O_Soldier_GL_F","O_Soldier_LAT_F"],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
};

[_group, _position] call bis_fnc_taskDefend;





// ADD QRF eventhandler
_EH = leader _group addEventHandler ["Fired", {[_this select 0] spawn QRF_test}];
_killcp = [] call cp_ehkilledeast;