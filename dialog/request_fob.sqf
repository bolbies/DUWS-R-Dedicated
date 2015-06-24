                                                             // case #

  _handle = createDialog "ressourceheader2";  
  waitUntil {dialog};
  ctrlSetText [1000, format["%1",commandpointsblu1]];
  ctrlSetText [1001, format["%1",zoneundercontrolblu]];
  ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];
    
// UNITS  
    _index = lbAdd [2120, "Rifleman(2CP)"];                 // 0
    _index = lbAdd [2120, "Medic(4CP)"];                    // 1
	_index = lbAdd [2120, "Repair Specialist(4CP)"];        // 2
    	
	
  lbSetCurSel [2120, 0];
  
  
// SQUADS  
    _index0 = lbAdd [2121, "Fireteam(12CP)"];                   // 0    
    _index0 = lbAdd [2121, "AT Team(18CP)"];                   // 1
    _index0 = lbAdd [2121, "AA Team(18CP)"];                   // 2

	
	
  lbSetCurSel [2121, 0];
  

// VEHICLES  
	_index1 = lbAdd [2122, "Hunter Unarmed(5CP)"];            // 2
    _index1 = lbAdd [2122, "Hunter HMG(18CP)"];               // 3
    _index1 = lbAdd [2122, "HEMTT Transport Covered(8CP)"];                     // 4
    _index1 = lbAdd [2122, "MH-9 Hummingbird(15CP)"];         // 5
    _index1 = lbAdd [2122, "ATV(1CP)"];                       // 6
    _index1 = lbAdd [2122, "SF SUV(2CP)"];      		      // 7
	_index1 = lbAdd [2122, "Fuel Truck(10CP)"];      		      // 8
	_index1 = lbAdd [2122, "Stomper Autonomous Recon(10CP)"];    // 9
	
  lbSetCurSel [2122, 0];
    
        
     
// Supports  !!! CHECK TO ADD AT INIT
				
			//	index_support_blank = lbAdd [2123, "No Support Unlocks at FOBs"];                // 0
            //  index_support_arty = lbAdd [2103, "Artillery strike(20CP)"];            // 1
            //  index_support_mortar = lbAdd [2103, "Mortar strike(10CP)"];             // 2
            //  index_support_paradrop = lbAdd [2103, "Airborne troops(20CP)"];         // 3
            //  index_support_jdam = lbAdd [2103, "JDAM strike(15CP)"];                 // 4
            //  index_support_armory = lbAdd [2103, "Armory(3CP)"];                     // 5
            //  index_support_pFLIR = lbAdd [2103, "Personal FLIR display(20CP)"];      // 6
            //  index_support_uavrecon = lbAdd [2103, "UAV Recon(10CP)"];               // 7
            //  index_support_refit = lbAdd [2103, "Vehicle Refit(3CP)"];               // 8
           //   index_support_helotaxi = lbAdd [2103, "Helicopter Taxi(3CP)"];          // 9
           //   index_support_cluster = lbAdd [2103, "Mk.20 II CBU(15CP)"];             // 10
			//  index_support_training = lbAdd [2103, "Specialized Infantry training(20CP)"];//11
			//  index_support_boattaxi = lbAdd [2103, "Boat Taxi(2CP)"];				  //12
			//  index_support_halo = lbAdd [2103, "Halo(15CP)"];                     // 13
			//  index_support_fob = lbAdd [2103, "**911 ONLY!** ADD FOB Reqst to 0-8"];                           //14
			
//  lbSetCurSel [2123, 0];
    


//       if (support_blank_available) then 
//           {
//            lbSetColor [2103, 0, [0, 1, 0, 1]];
//           }; 
//       if (support_arty_available) then 
//           {
//            lbSetColor [2103, 1, [0, 1, 0, 1]];
//           };                
//       if (support_mortar_available) then 
//           {
//            lbSetColor [2103, 2, [0, 1, 0, 1]];
//           };          
//       if (support_paradrop_available) then 
//           {
//            lbSetColor [2103, 3, [0, 1, 0, 1]];
//           };              
//       if (support_jdam_available) then 
//           {
//            lbSetColor [2103, 4, [0, 1, 0, 1]];
//           }; 
//       if (support_armory_available) then 
//           {
//            lbSetColor [2103, 5, [0, 1, 0, 1]];
//           }; 
//       if (support_pflir_available) then 
//           {
//            lbSetColor [2103, 6, [0, 1, 0, 1]];
//           }; 
//       if (support_uav_recon_available) then 
//           {
//            lbSetColor [2103, 7, [0, 1, 0, 1]];
//           }; 
//       if (support_veh_refit_available) then 
//           {
//            lbSetColor [2103, 8, [0, 1, 0, 1]];
//           };              
//       if (support_helotaxi_available) then 
//           {
//            lbSetColor [2103, 9, [0, 1, 0, 1]];
//           }; 
//       if (support_cluster_available) then 
//           {
//            lbSetColor [2103, 10, [0, 1, 0, 1]];
//           }; 
//       if (support_specialized_training_available) then 
//           {
//            lbSetColor [2103, 11, [0, 1, 0, 1]];
//           };              
//        if (support_boattaxi_available) then 
//           {
//            lbSetColor [2103, 12, [0, 1, 0, 1]];
//           };
//	  if (support_halo_available) then 
//           {
//            lbSetColor [2103, 13, [0, 1, 0, 1]];
//           };
//	  if (support_FOB_available) then 
//           {
//            lbSetColor [2103, 20, [0, 1, 0, 1]];
//           };	 
                       
    
    
     
       