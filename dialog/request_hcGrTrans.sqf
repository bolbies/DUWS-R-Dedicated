_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+25, _spawnPos select 1];    
_cost = 2;
_grouptype = ["B_Truck_01_transport_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_grndt = DUWS_number_grndt + 1;
			  _group setGroupId [format["GrndTr transport %1",DUWS_number_grndt]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcGRTRANS = [player,"hc_GRTRANS"] call BIS_fnc_addCommMenuItem;
hcGRTRANS = _hcGRTRANS;
    
	





publicVariable "commandpointsblu1";