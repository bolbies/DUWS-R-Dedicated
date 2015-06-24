_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+25, _spawnPos select 1];    
_cost = 2;
_grouptype = ["B_G_Van_01_fuel_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_refuela = DUWS_number_refuela + 1;
			  _group setGroupId [format["Fuel Team %1",DUWS_number_refuela]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcREFUEL = [player,"hc_REFUEL"] call BIS_fnc_addCommMenuItem;
hcREFUEL = _hcREFUEL;
    
	





publicVariable "commandpointsblu1";