_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+250, _spawnPos select 1, (_spawnPos select 2)+500];
_cost = 5;
_grouptype = ["B_Plane_CAS_01_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_casa = DUWS_number_casa + 1;
			  _group setGroupId [format["CAS squad %1",DUWS_number_casa]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcCAS = [player,"hc_CAS"] call BIS_fnc_addCommMenuItem;
hcCAS = _hcCAS;
    
	





publicVariable "commandpointsblu1";