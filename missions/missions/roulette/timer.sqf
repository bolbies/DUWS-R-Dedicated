
"BombTimer" addPublicVariableEventHandler {
private ["_BHint"];	_Btime = _this select 1;
cutText[format["Bomb Detonation: \n %1", [((_Btime)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],"PLAIN DOWN"];
};
CODEINPUT = [];