                                                             // case #

  _handle = createDialog "ressourceheader";  
  waitUntil {dialog};
  ctrlSetText [1000, format["%1",commandpointsblu1]];
  ctrlSetText [1001, format["%1",zoneundercontrolblu]];
  ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];
    
// UNITS  
    _index = lbAdd [2100, "Rifleman(2CP)"];                  // 0
    _index = lbAdd [2100, "Grenadier(3CP)"];                 // 1
    _index = lbAdd [2100, "Automatic Rifleman(3CP)"];        // 2
    _index = lbAdd [2100, "AT Rifleman(3CP)"];               // 3
    _index = lbAdd [2100, "Medic(4CP)"];                     // 4
    _index = lbAdd [2100, "AA Specialist(4CP)"];             // 5
    _index = lbAdd [2100, "Repair Specialist(4CP)"];         // 6 
    _index = lbAdd [2100, "AT Specialist(4CP)"];             // 7
    _index = lbAdd [2100, "SF Diver(3CP)"];                  // 8 
    _index = lbAdd [2100, "Marksman(3CP)"];                  // 9 
    _index = lbAdd [2100, "Sniper(4CP)"]; 	                 // 10 	
    _index = lbAdd [2100, "Spotter(3CP)"];                   // 11	
    _index = lbAdd [2100, "Explosive specialist(4CP)"];      // 12	
	
  lbSetCurSel [2100, 0];

// SQUADS  
    _index0 = lbAdd [2101, "Fireteam(8CP)"];                   // 0
    _index0 = lbAdd [2101, "Rifle Squad(16CP)"];               // 1
    _index0 = lbAdd [2101, "Weapons Squad(18CP)"];             // 2
    _index0 = lbAdd [2101, "AT Team(12CP)"];                   // 3
    _index0 = lbAdd [2101, "AA Team(15CP)"];                   // 4
    _index0 = lbAdd [2101, "SF Recon Team(12CP)"];             // 5
    _index0 = lbAdd [2101, "SF Recon Squad(20CP)"];            // 6
    _index0 = lbAdd [2101, "Divers Team(12CP)"];               // 7
    _index0 = lbAdd [2101, "Sniper Team(8CP)"];                // 8
    _index0 = lbAdd [2101, "Medical Team(10CP)"];              // 9
    _index0 = lbAdd [2101, "Motorized scouts(28CP)"];          // 10
    _index0 = lbAdd [2101, "Mechanized squad(36CP)"];          // 11
	_index0 = lbAdd [2101, "Tank Section Slammer(40CP)"];          // 12
	_index0 = lbAdd [2101, "Tank Platoon AA(40CP)"];          // 13
	
	
  lbSetCurSel [2101, 0];

// VEHICLES  
    _index1 = lbAdd [2102, "Ifrit HMG(18CP)"];                // 0
    _index1 = lbAdd [2102, "Hunter HMG(18CP)"];               // 1
    _index1 = lbAdd [2102, "Hunter GMG(25CP)"];               // 2
    _index1 = lbAdd [2102, "AMV-7 Marshall(35CP)"];           // 3
    _index1 = lbAdd [2102, "Mi-48 Kajman(45CP)"];             // 4
    _index1 = lbAdd [2102, "AH-9 Pawnee (35CP)"];             // 5
    _index1 = lbAdd [2102, "AH-99 Blackfoot(45CP)"];          // 6
    _index1 = lbAdd [2102, "MH-9 Hummingbird(15CP)"];         // 7
    _index1 = lbAdd [2102, "MH-80 Ghosthawk(22CP)"];          // 8
    _index1 = lbAdd [2102, "IFV-6c Panther(35CP)"];           // 9
    _index1 = lbAdd [2102, "ATV(1CP)"];                       // 10
    _index1 = lbAdd [2102, "IFV-6c Cheetah(30CP)"];           // 11
    _index1 = lbAdd [2102, "M2A1 Slammer(40CP)"];             // 12
    _index1 = lbAdd [2102, "CRV-6e Bobcat(28CP)"];            // 13
    _index1 = lbAdd [2102, "SF SUV(2CP)"];      		      // 14
	_index1 = lbAdd [2102, "MLRS Artillary (75CP)"];      		      // 15
	_index1 = lbAdd [2102, "Scorcher Artillary (75CP)"];      		      // 16
	_index1 = lbAdd [2102, "Fuel Truck (10CP)"];      		      // 17
	_index1 = lbAdd [2102, "BUY ONLY AT AIRPORTS A-164 CAS(45CP)"];     // 18
	_index1 = lbAdd [2102, "M2A4 SlammerUP(40CP)"];    // 19
	_index1 = lbAdd [2102, "Stomper RCWS Autonomous(20CP)"];    // 20
	_index1 = lbAdd [2102, "Stomper Autonomous Recon(10CP)"];    // 21
	_index1 = lbAdd [2102, "MH47E Chinook(45CP)"];    // 22
	_index1 = lbAdd [2102, "MV-22 Osprey(40CP)"];    // 23
	_index1 = lbAdd [2102, "Cargo Delivery(0CP)"];    // 24
	_index1 = lbAdd [2102, "AC-130(75CP)"];    // 25
	_index1 = lbAdd [2102, "Mi-290 Taru(25CP)"];    // 26
	_index1 = lbAdd [2102, "UAV GreyHawk w/ATG Missiles(15CP)"];    // 27
	_index1 = lbAdd [2102, "IFV Puma(45CP)"];    // 28
	_index1 = lbAdd [2102, "MBT Leopard 2A6M(45CP)"];    // 29 
    _index1 = lbAdd [2102, "HMMWV HMG(20CP)"];    // 30
    _index1 = lbAdd [2102, "HMMWV GMG(25CP)"];    // 31
	
  lbSetCurSel [2102, 0];
    
        
     
// Supports  !!! CHECK TO ADD AT INIT
			  index_support_supply = lbAdd [2103, "Supply drop(10CP)"];                // 0
              index_support_arty = lbAdd [2103, "Artillary strike(15CP)"];            // 1
              index_support_mortar = lbAdd [2103, "Mortar strike(10CP)"];             // 2
              index_support_paradrop = lbAdd [2103, "Airborne troops(20CP)"];         // 3
              index_support_jdam = lbAdd [2103, "JDAM strike(15CP)"];                 // 4
              index_support_armory = lbAdd [2103, "Armory(3CP)"];                     // 5
              index_support_pFLIR = lbAdd [2103, "Personal FLIR display(20CP)"];      // 6
              index_support_uavrecon = lbAdd [2103, "UAV Recon(15CP)"];               // 7
              index_support_refit = lbAdd [2103, "Vehicle Refit(3CP)"];               // 8
              index_support_helotaxi1 = lbAdd [2103, "Ghosthawk Taxi(3CP)"];          // 9
              index_support_helotaxi2 = lbAdd [2103, "Chinook Taxi(5CP)"];          // 9
              index_support_helotaxi3 = lbAdd [2103, "MV-22 Taxi(4CP)"];          // 9
              index_support_cluster = lbAdd [2103, "Mk.20 II CBU(15CP)"];             // 10
			  index_support_training = lbAdd [2103, "Specialized Infantry training(20CP)"];//11
			  index_support_boattaxi = lbAdd [2103, "Boat Taxi(2CP)"];				  //12
			  index_support_halo = lbAdd [2103, "Halo(15CP)"];                     // 13
			  index_support_hcCAS = lbAdd [2103, "High Command Close Air Support(20CP)"];                     // 14
			  index_support_hcAttChop = lbAdd [2103, "High Command Attack Chopper(20CP)"];                     // 15
			  index_support_hcAIRTRANS = lbAdd [2103, "High Command Air Transport(10CP)"];                     // 16
			  index_support_hcGRTRANS = lbAdd [2103, "High Command Ground Transport(8CP)"];                     // 17
			  index_support_hcBob = lbAdd [2103, "High Command Bobcat Refit(25CP)"];                     // 18
			  index_support_hcREPAIR = lbAdd [2103, "High Command Repair Team(8CP)"];                     // 19
			  index_support_nuke = lbAdd [2103, "Nuclear Bomb(100CP)"];                     // 20
			  index_support_dino = lbAdd [2103, "Raptor Drop(100CP)"];                     // 21
			  index_support_fob = lbAdd [2103, "**911 ONLY!** ADD FOB Reqst to 0-8"];                           //22
			
//  lbSetCurSel [2103, 0];

		
         if (support_supplydrop_available) then 
             {
              lbSetColor [2103, 0, [0, 1, 0, 1]];
             }; 
         if (support_arty_available) then 
             {
              lbSetColor [2103, 1, [0, 1, 0, 1]];
             };                
         if (support_mortar_available) then 
             {
              lbSetColor [2103, 2, [0, 1, 0, 1]];
             };          
         if (support_paradrop_available) then 
             {
              lbSetColor [2103, 3, [0, 1, 0, 1]];
             };              
         if (support_jdam_available) then 
             {
              lbSetColor [2103, 4, [0, 1, 0, 1]];
             }; 
         if (support_armory_available) then 
             {
              lbSetColor [2103, 5, [0, 1, 0, 1]];
             }; 
         if (support_pflir_available) then 
             {
              lbSetColor [2103, 6, [0, 1, 0, 1]];
             }; 
         if (support_uav_recon_available) then 
             {
              lbSetColor [2103, 7, [0, 1, 0, 1]];
             }; 
         if (support_veh_refit_available) then 
             {
              lbSetColor [2103, 8, [0, 1, 0, 1]];
             };              
         if (support_helotaxi1_available) then 
             {
              lbSetColor [2103, 9, [0, 1, 0, 1]];
             }; 
         if (support_helotaxi2_available) then 
             {
              lbSetColor [2103, 10, [0, 1, 0, 1]];
             }; 
         if (support_helotaxi3_available) then 
             {
              lbSetColor [2103, 11, [0, 1, 0, 1]];
             }; 
         if (support_cluster_available) then 
             {
              lbSetColor [2103, 12, [0, 1, 0, 1]];
             }; 
         if (support_specialized_training_available) then 
             {
              lbSetColor [2103, 13, [0, 1, 0, 1]];
             };              
          if (support_boattaxi_available) then 
             {
              lbSetColor [2103, 14, [0, 1, 0, 1]];
             };
		  if (support_halo_available) then 
             {
              lbSetColor [2103, 15, [0, 1, 0, 1]];
             }; 
		  if (support_hcCAS_available) then 
             {
              lbSetColor [2103, 16, [0, 1, 0, 1]];
             };
		  if (support_hcAttChop_available) then 
             {
              lbSetColor [2103, 17, [0, 1, 0, 1]];
             };	 
          if (support_hcAIRTRANS_available) then 
             {
              lbSetColor [2103, 18, [0, 1, 0, 1]];
             };
		 if (support_hcGRTRANS_available) then 
             {
              lbSetColor [2103, 19, [0, 1, 0, 1]];
             };
		 if (support_hcBob_available) then 
             {
              lbSetColor [2103, 20, [0, 1, 0, 1]];
             };
         if (support_hcREPAIR_available) then 
             {
              lbSetColor [2103, 21, [0, 1, 0, 1]];
             };
         if (support_nuke_available) then 
             {
              lbSetColor [2103, 22, [0, 1, 0, 1]];
             };
         if (support_dino_available) then 
             {
              lbSetColor [2103, 23, [0, 1, 0, 1]];
             };
		 if (support_FOB_available) then 
             {
              lbSetColor [2103, 24, [0, 1, 0, 1]];
             };
		 if (support_nuky_available) then
			 {
			  1bSetColor [2103, 25, [0, 1, 0, 1]];
			 };
         		 