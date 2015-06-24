_loop = true;
WARCOM_blu_patrol_type = "";
FIRSTCHOICEBLU = "";



// Type of attack wave
[] spawn {
          WARCOM_blu_patrol_type = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam");

          waitUntil {sleep 1;WARCOM_blufor_ap>40};          
          WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad"); 
          
          waitUntil {sleep 1;WARCOM_blufor_ap>65};          
          WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons"); 
          
          waitUntil {sleep 1;WARCOM_blufor_ap>100};          
          WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInfSquad");
          
          waitUntil {sleep 1;WARCOM_blufor_ap>135};          
          WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInf_AT");
		  
		  FIRSTCHOICEBLU = WARCOM_blu_patrol_type; publicVariable "WARCOM_blu_patrol_type";
};





[] spawn {
		  
          while {Warcom_Limiter_Param == 1} do {
				aliveAllUnits = {alive _x} count allunits;
		    

			  if ((count WARCOM_zones_controled_by_BLUFOR>1) && (aliveAllUnits<130)) then {	  // make sure blufor is controlling at least 2 zones
			   	sleep 2;			  
			  
			  // find a zone where to spawn OPF wave *** BEGIN
			  _found = false;
			  _randomZone = [];
			  _failSafe = 0;
				while {!_found} do {
				_randomZone = WARCOM_zones_controled_by_BLUFOR call BIS_fnc_selectRandom;
				if (_randomZone distance player>900) then {_found=true;};
				sleep 0.2;
	
				_failSafe = _failSafe + 1;
				if (_failsafe>5) then {sleep 300; _failsafe = 0;};
				};
			  // find a zone *** end //////////////////////Spawn Troops
			  
				aliveAllTanks = {(alive _x) && ((_x isKindOf "Tank") || (_x isKindOf "car"))} count vehicles;
			   if (aliveAllTanks>7) then {WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons")}
			   else{WARCOM_blu_patrol_type = FIRSTCHOICEBLU}; ///if too many vehicles then downgrade to non-vehicle groups
			  _randomZone = [(_randomZone select 0)+40,_randomZone select 1];
			  _group = [_randomZone, WEST, WARCOM_blu_patrol_type,[],[],WARCOM_blu_ai_skill_range] call BIS_fnc_spawnGroup;
			  _opf_assault = [_group] execVM "WARCOM\WARCOM_wp_blu_patrol.sqf"; 
			   			   
			   
				// spawn armored
				
				sleep 2;
				aliveAllTanks = {alive _x AND _x isKindOf "Tank" || _x isKindOf "car"} count vehicles;
				
				if ((WARCOM_blufor_ap>50) && (aliveAllTanks<8)) then {
									
					["BLU_F","armored",_randomZone] execVM "WARCOM\random_veh_blu_patrol.sqf";
					
				};
				
				// Spawn Air
				
				sleep 2;
				aliveAllAir = {_x isKindOf "Air" AND alive _x} count vehicles;
				
				if ((Attack) && (WARCOM_blufor_ap>149) && (aliveAllAir< 3)) then {
										
					["BLU_F","air",_randomZone] execVM "WARCOM\random_veh_blu_patrol.sqf";
					
					
					};
				};

				sleep (900 + (random 900)); //15-30min was 1500///1500/900
		};
};


[] spawn {
		  
          while {Warcom_Limiter_Param == 0} do {
				aliveAllUnits = {alive _x} count allunits;
		 
			  if ((count WARCOM_zones_controled_by_BLUFOR > 1) && (aliveAllUnits < 200)) then { // make sure blufor is controlling at least 2 zones
			  sleep 2;
			  
			  // find a zone where to spawn OPF wave *** BEGIN
			  _found = false;
			  _randomZone = [];
			  _failSafe = 0;
				while {!_found} do {
				_randomZone = WARCOM_zones_controled_by_BLUFOR call BIS_fnc_selectRandom;
				if (_randomZone distance player>900) then {_found=true;};
				sleep 0.2;
	
				_failSafe = _failSafe + 1;
				if (_failsafe>5) then {sleep 300; _failsafe = 0;};
				};
				_randomZone = [(_randomZone select 0)+40,_randomZone select 1];
				
				// find a zone *** end /////Spawn Troops
				
			   aliveAllTanks = {(alive _x) && ((_x isKindOf "Tank") || (_x isKindOf "car"))} count vehicles;
			   if (aliveAllTanks>11) then {WARCOM_blu_patrol_type = (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons")}
			   else{WARCOM_blu_patrol_type = FIRSTCHOICEBLU}; ///if too many vehicles then downgrade to non-vehicle groups			   
			  _group = [_randomZone, WEST, WARCOM_blu_patrol_type,[],[],WARCOM_blu_ai_skill_range] call BIS_fnc_spawnGroup;			   
			  _opf_assault = [_group] execVM "WARCOM\WARCOM_wp_blu_patrol.sqf";
			  
  

				// spawn armored
				
				sleep 2;
				aliveAllTanks = {alive _x AND _x isKindOf "Tank" || _x isKindOf "car"} count vehicles;
				if ((WARCOM_blufor_ap>50) && (aliveAllTanks<12)) then {
									
					["BLU_F","armored",_randomZone] execVM "WARCOM\random_veh_blu_patrol.sqf";
										
				};
				
				// spawn air
				
				sleep 2;
				aliveAllAir = {_x isKindOf "Air" AND alive _x} count vehicles;
				
				if ((Attack) && (WARCOM_blufor_ap>149) && (aliveAllAir<4)) then {
										
					["BLU_F","air",_randomZone] execVM "WARCOM\random_veh_blu_patrol.sqf";
					
					};
			};

				sleep (900 + (random 900)); //15-30min was 1200 //1200/900
	};
};
