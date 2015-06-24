_loop = true;
WARCOM_opf_patrol_type = "";
FIRSTCHOICEOPF = "";


// Type of attack wave
[] spawn {
          WARCOM_opf_patrol_type = (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam");
      
          waitUntil {sleep 1;WARCOM_opfor_ap>40};          
          WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad");
          
          waitUntil {sleep 1;WARCOM_opfor_ap>65};          
          WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons");

          waitUntil {sleep 1;WARCOM_opfor_ap>100};          
          WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Mechanized" >> "OIA_MechInfSquad");

          waitUntil {sleep 1;WARCOM_opfor_ap>135};          
          WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Mechanized" >> "OIA_MechInf_AT");
		  
		  FIRSTCHOICEOPF = WARCOM_opf_patrol_type; publicVariable "WARCOM_opf_patrol_type";
};




// Attack waves main
[] spawn {		  
		  
          while {Warcom_Limiter_Param == 1} do {		  
				aliveAllUnits = {alive _x} count allunits;
				
				
				if ((count WARCOM_zones_controled_by_OPFOR > 1) && (aliveAllUnits<130)) then { // make sure opfor is controlling at least 2 zones
				sleep 2;				
			  
			  // find a zone where to spawn OPF wave *** BEGIN
			  _found = false;
			  _randomZone = [];
			  _failSafe = 0;
				while {!_found} do {
				_randomZone = WARCOM_zones_controled_by_OPFOR call BIS_fnc_selectRandom;
				if (_randomZone distance player > 900) then {_found=true;};
				sleep 0.2;
				
				_failSafe = _failSafe + 1;
				if (_failsafe > 5) then {sleep 300; _failsafe = 0;};
				};
			  // find a zone *** end Spawn Troops
			  
				aliveAllTanks = {(alive _x) && ((_x isKindOf "Tank") || (_x isKindOf "car"))} count vehicles;
			   if (aliveAllTanks>7) then {WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons")}
			   else{WARCOM_opf_patrol_type = FIRSTCHOICEOPF}; ///if too many vehicles then downgrade to non-vehicle groups
			  _randomZone = [(_randomZone select 0)+40,_randomZone select 1];
			  _group = [_randomZone, EAST, WARCOM_opf_patrol_type,[],[],WARCOM_opf_ai_skill_range] call BIS_fnc_spawnGroup;
			  _killcp = [] call cp_ehkilledeast;
			  _opf_assault = [_group] execVM "WARCOM\WARCOM_wp_opf_patrol.sqf";
			  				

				// spawn armored
				
				sleep 2;
				aliveAllTanks = {alive _x AND _x isKindOf "Tank" || _x isKindOf "car"} count vehicles;
				
				if ((WARCOM_opfor_ap>50) && (aliveAllTanks<8)) then {				
				  	["OPF_F","armored",_randomZone] execVM "WARCOM\random_veh_opf_patrol.sqf";
					};					
				
				// spawn air
				
				sleep 2;
				aliveAllAir = {_x isKindOf "Air" AND alive _x} count vehicles;
				
				if ((Attack) && (WARCOM_opfor_ap>149) && (aliveAllAir< 3)) then {				
					["OPF_F","air",_randomZone] execVM "WARCOM\random_veh_opf_patrol.sqf";
					
				};
			};			  
			  
			  sleep (900 + (random 900));	// patrol delay		  
          };
};



[] spawn {

		while {Warcom_Limiter_Param == 0} do {
				aliveAllUnits = {alive _x} count allunits;
		  
			  if ((count WARCOM_zones_controled_by_OPFOR > 1) && (aliveAllUnits<200)) then { // make sure opfor is controlling at least 2 zones
			  sleep 2;
			  
			  // find a zone where to spawn OPF wave *** BEGIN
			  _found = false;
			  _randomZone = [];
			  _failSafe = 0;
				while {!_found} do {
				_randomZone = WARCOM_zones_controled_by_OPFOR call BIS_fnc_selectRandom;
				if (_randomZone distance player > 900) then {_found=true;};
				sleep 0.2;
	
				_failSafe = _failSafe + 1;
				if (_failsafe > 5) then {sleep 300; _failsafe = 0;};
				};
			  // find a zone *** end Spawn Troops
			  
				aliveAllTanks = {(alive _x) && ((_x isKindOf "Tank") || (_x isKindOf "car"))} count vehicles;
			   if (aliveAllTanks>11) then {WARCOM_opf_patrol_type = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons")}
			   else{WARCOM_opf_patrol_type = FIRSTCHOICEOPF}; ///if too many vehicles then downgrade to non-vehicle groups
			  _randomZone = [(_randomZone select 0)+40,_randomZone select 1];
			  _group = [_randomZone, EAST, WARCOM_opf_patrol_type,[],[],WARCOM_opf_ai_skill_range] call BIS_fnc_spawnGroup;			  
			  _killcp = [] call cp_ehkilledeast;
			  _opf_assault = [_group] execVM "WARCOM\WARCOM_wp_opf_patrol.sqf";
			    
			
				// spawn armored
				sleep 2;
				aliveAllTanks = {alive _x AND _x isKindOf "Tank" || _x isKindOf "car"} count vehicles;
				
				if ((WARCOM_opfor_ap>50) && (aliveAllTanks<12)) then {				
				  	["OPF_F","armored",_randomZone] execVM "WARCOM\random_veh_opf_patrol.sqf";
					};
				
				
				// spawn air
				sleep 2;
				aliveAllAir = {_x isKindOf "Air" AND alive _x} count vehicles;
				
				if ((Attack) && (WARCOM_opfor_ap>149) && (aliveAllAir<4)) then {				
					["OPF_F","air",_randomZone] execVM "WARCOM\random_veh_opf_patrol.sqf";
					
				};
			};
				

			  
			  sleep (900 + (random 900));	// patrol delay		  
          
	};
};

