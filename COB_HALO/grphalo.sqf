if (commandpointsblu1<5) exitWith  
{
  ["info",["Not enough command points","Not enough Command Points (5CP required)"]] call bis_fnc_showNotification;
};


hint "Click on the map where you'd like to HALO jump.";
openMap true;
Jump = false;	
	
while {!Jump} do{
ATM_Jump_clickpos = [];
pos = [];
ATM_Jump_mapclick = false; 
onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; onMapSingleClick ''; true;";
waitUntil {ATM_Jump_mapclick or !(visiblemap)};
if (!visibleMap) exitwith {systemChat "Halo jump canceled."; Jump = true; breakOut "main";};
_pos = pos;
pos = ATM_Jump_clickpos; publicvariable "pos";
_closest = [WARCOM_zones_controled_by_OPFOR, ATM_Jump_clickpos] call BIS_fnc_nearestPosition;
_dist = _closest distance ATM_Jump_clickpos;
if (_closest distance ATM_Jump_clickpos < 999) then {
["info",["CLICKED TOO CLOSE TO RED ZONE","No Halo Within 1km of a Red Zone's CENTER"]] call bis_fnc_showNotification; hint format ["Try Again!\nYou Must Click At Least 1km Away From A Red Zone's CENTER\n\nYOUR MAPCLICK WAS ONLY\n%1m AWAY\n\n Large GridBox Lines = 1km apart\nSmall GridBox Lines = 100m apart",_dist];}
else {publicvariable "ATM_Jump_clickpos";Jump=true;};
};

ATM_Jump_mapclick = if(true) then{

    publicvariable "ATM_Jump_clickpos";
	pos = ATM_Jump_clickpos;
	publicvariable "pos";
    call compile format ['
	mkr_halo = createmarker ["mkr_halo", ATM_Jump_Clickpos];
	"mkr_halo" setMarkerTypeLocal "hd_dot";
	"mkr_halo" setMarkerColorLocal "ColorGreen";
	"mkr_halo" setMarkerTextLocal "Jump";'];
	
	    Altitude = 2500;
		posJump = getMarkerPos "mkr_halo";publicvariable "posJump";
	    xCoord = posJump select 0;publicvariable "xCoord";
		yCoord = posJump select 1;publicvariable "yCoord";
		zCoord = posJump select 2;publicvariable "zCoord";
		
	commandpointsblu1 = commandpointsblu1 - 5;
	{_x setpos [xCoord,yCoord,zCoord+Altitude];sleep 0.1;} forEach units group player; 
	[[{{[_x, 2500, true, true, true] execVM "COB_HALO\functions\fn_halo.sqf";} forEach units group player}],"BIS_fnc_Call",group player,false] call BIS_fnc_MP;	
	hint '';
	openMap false;
    deleteMarker "mkr_halo";	
};
//{[_x, 2500, true, true, true] execVM "COB_HALO\functions\fn_halo.sqf";} forEach units group player;