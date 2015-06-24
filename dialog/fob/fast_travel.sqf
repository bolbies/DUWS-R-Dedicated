if (!enable_fast_travel) exitWith {hint "Fast travel is disabled"};


if (commandpointsblu1<5) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (2CP required)"]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - 5;


//// CREATE THE ARRAY OF FOBS w/ POSITION
_array_of_fobs_list = [];  // init the array of fobs
_list = [];


_index = -1;
{
_array_of_fobs_list = _array_of_fobs_list + [[getpos _x]]; // add the FOB (pos) into a nested array

_index = _index + 1; 
_array_of_fobs_list_selected = _array_of_fobs_list select _index; // select the current array inside _array_of_fobs_list

_actual_fobname = Array_of_FOBname select _index;
_array_of_fobs_list_selected = _array_of_fobs_list_selected + [_actual_fobname];

_list = _list + [_array_of_fobs_list_selected];
} forEach Array_of_FOBS;
//// CREATE THE ARRAY OF FOBS w/ POSITION -- END
// add the base
//_hqpos = getpos hq_blu1;
_hqpos = getmarkerpos str blu_hq_markername;
_list = _list + [[_hqpos,"Main base"]];
if ((MTV1cap) && (alive MTV1)) then {
_mtv1pos = getpos MTV1;
_list = _list + [[_mtv1pos,"Mobile Teleport Vehicle 1"]];
};

_index = lbCurSel 2100;


_selected_fob = _list select _index;
_selected_fob_pos =  _selected_fob select 0;
_selected_fob_name = _selected_fob select 1;

closedialog 0;
player allowDamage false;
[[player, false], "fn_enableSimulation"] call BIS_fnc_MP;
TitleCut ["", "BLACK OUT", 3];
titleText ["Standby, transfer in progress...30 seconds", "PLAIN", 0];
titleFadeOut 7;
sleep 7;
titleText ["Standby, transfer in progress...25 seconds", "PLAIN", 0];
titleFadeOut 5;
sleep 5;
titleText ["Standby, transfer in progress...20 seconds", "PLAIN", 0];
titleFadeOut 5;
sleep 5;
titleText ["Standby, transfer in progress...15 seconds", "PLAIN", 0];
titleFadeOut 5;
sleep 5;
titleText ["Standby, transfer in progress...10 seconds", "PLAIN", 0];
titleFadeOut 5;
sleep 5;
titleText ["Standby, transfer in progress...5 seconds", "PLAIN", 0];
titleFadeOut 5;
sleep 5;
titleCut ["Transfer complete!", "BLACK IN", 3];
player allowDamage true;
[[player, true], "fn_enableSimulation"] call BIS_fnc_MP;


if ((_selected_fob_name) == "Mobile Teleport Vehicle 1") exitWith {
player setpos _selected_fob_pos;
_newpos = [(getpos player select 0)-15, (getpos player select 1)-4];
{_x setpos (_newpos)} forEach units group player;
//player setpos _newpos;
hint "Fast travel done";
};


player setpos _selected_fob_pos;
_newpos = [(getpos player select 0)-15, (getpos player select 1)-4];
{_x setpos (_newpos)} forEach units group player;
hint "Fast travel done";





