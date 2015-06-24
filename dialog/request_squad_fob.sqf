_index = lbCurSel 2121;

_spawnPos = getpos player;
_spawnPos = [(_spawnPos select 0)+25, _spawnPos select 1];



  switch (_index) do
{
    case 0:  
    {
    _cost = 12;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_fireteam = DUWS_number_fireteam + 1;
			  _group setGroupId [format["Fireteam %1",DUWS_number_fireteam]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 1:  
    {
    _cost = 18;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AT");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_at = DUWS_number_at + 1;
			  _group setGroupId [format["AT team %1",DUWS_number_at]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

        case 2:  
    {
    _cost = 18;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AA");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_aa = DUWS_number_aa + 1;
			  _group setGroupId [format["AA team %1",DUWS_number_aa]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    
	


};


publicVariable "commandpointsblu1";