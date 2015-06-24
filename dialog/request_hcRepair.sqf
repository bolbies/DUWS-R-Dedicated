_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+25, _spawnPos select 1];
_spawnPos2 = [(_spawnPos select 0)+25, _spawnPos select 1];    
_cost = 4;
_grouptype = ["B_Truck_01_Repair_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos2, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_repaira = DUWS_number_repaira + 1;
			  _group setGroupId [format["Repair Team %1",DUWS_number_repaira]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcREPAIR = [player,"hc_REPAIR"] call BIS_fnc_addCommMenuItem;
hcREPAIR = _hcREPAIR;
    
	





publicVariable "commandpointsblu1";