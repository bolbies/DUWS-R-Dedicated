_pos = _this select 0;

hint "Coordinates recieved";

commandpointsblu1 = commandpointsblu1 - 50;
publicVariable "commandpointsblu1";

_crate = "Land_Cargo20_brick_red_F" createVehicle _pos;
_crate setpos [_pos select 0, _pos select 1, (_pos select 2) + 5000];

sleep 1;

waituntil {(getpos _crate select 2) <= 1};

sleep 5;

_pos3 = getpos _crate;
_dinogroup = creategroup resistance;
_dinogroup setcombatmode "RED";

_rad = 15;
_count = 5;

//_dinos1 = _dinogroup createunit ["Raptor2_E", [(_pos3 select 0)+(random _rad)-(random _rad), (_pos3 select 1)+(random _rad)-(random _rad), (_pos3 select 2)], [], 0, "NONE"];

while {_count > 0} do {
_dinos1 = _dinogroup createunit ["Raptor2_E", [(_pos3 select 0)+(random _rad)-(random _rad), (_pos3 select 1)+(random _rad)-(random _rad), (_pos3 select 2)], [], 0, "NONE"];
_dinos2 = _dinogroup createunit ["RaptorAIF2_E", [(_pos3 select 0)+(random _rad)-(random _rad), (_pos3 select 1)+(random _rad)-(random _rad), (_pos3 select 2)], [], 0, "NONE"];
_dinos3 = _dinogroup createunit ["RaptorAIM1_E", [(_pos3 select 0)+(random _rad)-(random _rad), (_pos3 select 1)+(random _rad)-(random _rad), (_pos3 select 2)], [], 0, "NONE"];
sleep .75;
_count = (_count - 1);
};

{_x setskill 1; _x addrating -1000000000; _x addeventhandler ["Fired", {_this execvm "support\rgrenadestop.sqf"}];} foreach units _dinogroup;

//{_x addeventhandler ["Fired", {_this execvm "support\rgrenadestop.sqf"}];} foreach units _dinogroup;

//{_x addrating -1000000000;} foreach units _dinogroup;