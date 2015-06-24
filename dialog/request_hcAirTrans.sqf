_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+250, _spawnPos select 1, (_spawnPos select 2)+200];    
_cost = 3;
_grouptype = ["B_Heli_Transport_01_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_aitransh = DUWS_number_aitransh + 1;
			  _group setGroupId [format["AirH transport %1",DUWS_number_aitransh]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcAIRTRANS = [player,"hc_AIRTRANS"] call BIS_fnc_addCommMenuItem;
hcAIRTRANS = _hcAIRTRANS;
    
	





publicVariable "commandpointsblu1";