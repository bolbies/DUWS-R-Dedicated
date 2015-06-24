_index = lbCurSel 2103;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+25, _spawnPos select 1];    
_cost = 8;
_grouptype = ["B_APC_Tracked_01_CRV_F"];

	
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_bobcata = DUWS_number_bobcata + 1;
			  _group setGroupId [format["BobCat Refit %1",DUWS_number_bobcata]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
			 
sleep 15;
_hcBOBCATREP = [player,"hc_BOBCATREP"] call BIS_fnc_addCommMenuItem;
hcBOBCATREP = _hcBOBCATREP;
    
	





publicVariable "commandpointsblu1";