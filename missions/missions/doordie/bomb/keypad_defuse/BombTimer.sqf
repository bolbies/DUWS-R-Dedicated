private ["_bomb", "_time"];
_bomb = _this select 0;
_time = _this select 1;
CODEINPUT = [];
CODE=[(floor(random 9)),(floor(random 9)),(floor(random 9)),(floor(random 9))]; publicVariable "CODE";
WIRE = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom; publicVariable "WIRE";
DEFUSED = false; publicVariable "DEFUSED";
ARMED = false; publicVariable "ARMED";
BOMBFINISHED=false; publicVariable "BOMBFINISHED";
EXPL=false; publicVariable "EXPL";


while {_time > 0 && !(DEFUSED) && (alive _bomb)} do {

_time = _time - 1;  
cutText [format["Bomb Detonation: \n %1", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],"PLAIN DOWN"];
BombTimer=_time;
publicVariable "BombTimer";
	
if (_time < 1) then {

expl1 setdamage 1;
expl2 setdamage 1;
expl3 setdamage 1;
EXPL=true;
};

if (ARMED) then {
_time = 7; 
ARMED = false
};
	
	sleep 1;
};


CODE=[];
publicVariable "CODE";
//deleteVehicle _bomb;
deleteVehicle expl1;
deleteVehicle expl2;
deleteVehicle expl3;
sleep 1;
BombTimer="";
BOMBFINISHED=true;
