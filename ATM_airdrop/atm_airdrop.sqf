///////////////////////////////////////////////////////////
//                =ATM= Airdrop       	 				    //
//         		 =ATM=Pokertour        		       		    //
//				version : 6.0							        //
//				date : 12/02/2014						   //
//                   visit us : atmarma.fr                 //
/////////////////////////////////////////////////////////

if (commandpointsblu1<5) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (5CP required)"]] call bis_fnc_showNotification;
};


private ["_position","_cut","_dialog","_s_alt","_s_alt_text","_sound","_sound2","_soundPath"];
	waitUntil { !isNull player };
[] execVM "ATM_airdrop\functions.sqf";


		_position = GetPos player;
		_z = _position select 2;
		Altitude = 2500;
		
		
	hint Localize "STR_ATM_hinton";
	openMap true;	
	
Jump = false;	
	
while {!Jump} do{
ATM_Jump_clickpos = [];
ATM_Jump_mapclick = false; 
onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; onMapSingleClick ''; true;";
waitUntil {ATM_Jump_mapclick or !(visiblemap)};
if (!visibleMap) exitwith {systemChat "Halo jump canceled."; Jump = true; breakOut "main";};	
_pos = ATM_Jump_clickpos;
_closest = [WARCOM_zones_controled_by_OPFOR, ATM_Jump_clickpos] call BIS_fnc_nearestPosition;
_dist = _closest distance ATM_Jump_clickpos;
if (_closest distance ATM_Jump_clickpos < 999) then {
["info",["CLICKED TOO CLOSE TO RED ZONE","No Halo Within 1km of a Red Zone's CENTER"]] call bis_fnc_showNotification; hint format ["Try Again!\nYou Must Click At Least 1km Away From A Red Zone's CENTER\n\nYOUR MAPCLICK WAS ONLY\n%1m AWAY\n\n Large GridBox Lines = 1km apart\nSmall GridBox Lines = 100m apart",_dist];}
else {Jump=true};

};
	

	
	ATM_Jump_mapclick = if(true) then{
	call compile format ['
	mkr_halo = createmarker ["mkr_halo", ATM_Jump_Clickpos];
	"mkr_halo" setMarkerTypeLocal "hd_dot";
	"mkr_halo" setMarkerColorLocal "ColorGreen";
	"mkr_halo" setMarkerTextLocal "Jump";'];
	};
	
commandpointsblu1 = commandpointsblu1 - 5;

	_target = player;
	
	RedOn = _target addAction["<t color='#B40404'>Chemlight Red On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_red"],6,false,false,"","_target == ( player)"];
    BlueOn = _target addAction["<t color='#68ccf6'>Chemlight Blue On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_blue"],6,false,false,"","_target == ( player)"];
    YellowOn = _target addAction["<t color='#fcf018'>Chemlight Yellow On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_yellow"],6,false,false,"","_target == ( player)"];
    GreenOn = _target addAction["<t color='#30fd07'>Chemlight Green On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_green"],6,false,false,"","_target == ( player)"];
    IrOn = _target addAction["<t color='#FF00CC'>Strobe IR On</t>", "ATM_airdrop\atm_chem_on.sqf",["NVG_TargetC"],6,false,false,"","_target == ( player)"];

_loadout=[_target] call GetloadoutATM;

		_posJump = getMarkerPos "mkr_halo";
		_x = _posJump select 0;
		_y = _posJump select 1;
		_z = _posJump select 2;
		_target setPos [_x,_y,_z+Altitude];
        

	openMap false;
	deleteMarker "mkr_halo";

if (!isNil backPack _target) then {removebackpack _target} else {};

	sleep 0.5;
	_target addBackpack "B_Parachute";
if ((getPos _target select 2) >= 8000) then{
	removeHeadgear _target;
	_target addHeadgear "H_CrewHelmetHeli_B";
	sleep 0.5;
};

hintsilent "";
//hint Localize "STR_ATM_hintjump";
//Cut_Rope = (FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyDown"];

	_height = getPos _target select 2;

while {(getPos _target select 2) > 2} do {
	if(isTouchingGround _target and player == vehicle player) then{
	}
	else{
	playSound "Vent";
	playSound "Vent2";
	sleep 1;

	};
	if ((getPos _target select 2) < 150) then {
		_target action ["OpenParachute", _target];
	};
	if(!alive _target) then {
	_target setPos [getPos _target select 0, getPos _target select 1, 0];
	0=[_target,_loadout] call SetloadoutATM;
	};
};

	hint Localize "STR_ATM_hintload";
		_target removeAction RedOn;
		_target removeAction BlueOn;
		_target removeAction YellowOn;
		_target removeAction GreenOn;
		_target removeaction Iron;
		

hintsilent "";
sleep 1;

	0=[_target,_loadout] call SetloadoutATM;


if (true) exitWith {};