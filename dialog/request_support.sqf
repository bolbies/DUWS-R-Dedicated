_index2 = lbCurSel 2103;

switch (_index2) do
{
    case 0:  
    {
         if (commandpointsblu1 >= 10) then 
             {
              if (!support_supplydrop_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 10;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"ammo"] call BIS_fnc_addCommMenuItem;
				  DUWSsupplydrop =_supplydrop;
                  lbSetColor [2103, 0, [0, 1, 0, 1]];
				  playSound "boots";
                  support_supplydrop_available = true;
                }
              else
                {
                  
				  commandpointsblu1 = commandpointsblu1 + 5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,DUWSsupplydrop] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 0, [1, 0, 0, 1]];
				  playSound "boots";
				  support_supplydrop_available = false;
				  hint "Support Locked & 50% Refunded";
                };    
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 1:
    {
         if (commandpointsblu1 >= 15) then 
             {
              if (!support_arty_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _arty = [player,"artillery"] call BIS_fnc_addCommMenuItem;
				  arty = _arty;
                  lbSetColor [2103, 1, [0, 1, 0, 1]];
				  playSound "boots";
                  support_arty_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 7.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,arty] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 1, [1, 0, 0, 1]];
				  playSound "boots";
				  support_arty_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 2:
    {
         if (commandpointsblu1 >= 10) then 
             {
              if (!support_mortar_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 10;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _morty = [player,"mortar"] call BIS_fnc_addCommMenuItem;
				  morty = _morty;
                  lbSetColor [2103, 2, [0, 1, 0, 1]];
				  playSound "boots";
                  support_mortar_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,morty] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 2, [1, 0, 0, 1]];
				  playSound "boots";
				  support_mortar_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

        case 3:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_paradrop_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _paradrops = [player,"paradrop"] call BIS_fnc_addCommMenuItem;
				  paradrops = _paradrops;
                  lbSetColor [2103, 3, [0, 1, 0, 1]];
				  playSound "boots";
                  support_paradrop_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 10;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,paradrops] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 3, [1, 0, 0, 1]];
				  playSound "boots";
				  support_paradrop_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    
    case 4:
    {
         if (commandpointsblu1 >= 15) then 
             {
              if (!support_jdam_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _jdams = [player,"jdam"] call BIS_fnc_addCommMenuItem;
				  jdams = _jdams;
                  lbSetColor [2103, 4, [0, 1, 0, 1]];
				  playSound "boots";
                  support_jdam_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 7.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,jdams] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 4, [1, 0, 0, 1]];
				  playSound "boots";
				  support_jdam_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    
    case 5:
    {
         if (!support_armory_available) then 
             {
              if (commandpointsblu1>=3) then
                {
                  commandpointsblu1 = commandpointsblu1 - 3;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  hq_blu1 addaction ["<t color='#ff0066'>Armory 1 (VAS)</t>","VAS\open.sqf", "", 0, true, true, "", "_this == player"];
				  hq_blu1 addaction ["<t color='#ff0066'>Armory 2 (VA)</t>","va.sqf", "", 0, true, true, "", "_this == player"];
				  lbSetColor [2103, 5, [0, 1, 0, 1]];
                  support_armory_available = true;
				  
				 {_x addaction ["<t color='#ff0066'>Armory 1 (VAS)</t>","VAS\open.sqf", "", 0, true, true, "", "_this == player"]} forEach (Array_of_FOBS);
				 {_x addaction ["<t color='#ff0066'>Armory 2 (VA)</t>","va.sqf", "", 0, true, true, "", "_this == player"]} forEach (Array_of_FOBS);
				  
				  playSound "loadgun";
				 // publicVariable "support_armory_available";
                  ["armory",["Armory Unlocked","Access the armory at the HQ and at the dropped supply crates"]] call bis_fnc_showNotification;
				 
				  
                }
              else
                {
                  hint "Not enough command points!";
                };
             } 
          else 
             {
               hint "You cannot re-lock this support for any refunds";
             };
    };  
    
    case 6:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_PFLIR_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  pFLIRenable = player addaction ["<t color='#a9ff59'>Activate FLIR</t>","pflir\livefeed1.sqf","", 0,false,true,"","_target == _this"];
				  PlayerRespawnEH2 = player addEventHandler ["respawn",{pFLIRenable = player addaction ["<t color='#a9ff59'>Enable FLIR</t>","pflir\livefeed1.sqf","", 0,false,true,"","_target == _this"]}];
                  lbSetColor [2103, 6, [0, 1, 0, 1]];
                  support_pflir_available = true;
				  playSound "loadgun";
                  ["pflir",["Personal FLIR display","Toggle you personal FLIR display using the action menu"]] call bis_fnc_showNotification;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 7:
    {
         if (commandpointsblu1 >= 15) then 
             {
              if (!support_uav_recon_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _uav_recon = [player,"uav_recon"] call BIS_fnc_addCommMenuItem;
				  uavrecon = _uav_recon;
                  lbSetColor [2103, 7, [0, 1, 0, 1]];
				  playSound "boots";
                  support_uav_recon_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 7.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,uavrecon] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 7, [1, 0, 0, 1]];
				  playSound "boots";
				  support_uav_recon_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 8:
    {
         if (commandpointsblu1 >= 3) then 
             {
              if (!support_veh_refit_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 3;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _veh_refit = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
				  vehrefit = _veh_refit;
                  lbSetColor [2103, 8, [0, 1, 0, 1]];
				  playSound "loadgun";
                  support_veh_refit_available = true;				  
							 
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 1.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,vehrefit] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 8, [1, 0, 0, 1]];
				  playSound "boots";
				  support_veh_refit_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
             
    case 9:
    {
         if (commandpointsblu1 >= 3) then 
             {
              if (!support_helotaxi1_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 3;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
				  helotax = _helotax;
                  lbSetColor [2103, 9, [0, 1, 0, 1]];
				  playSound "boots";
                  support_helotaxi1_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 1.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,helotax] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 9, [1, 0, 0, 1]];
				  playSound "boots";
				  support_helotaxi1_available = false;
				  hint "Support Locked & 50% Refunded";
                  _helitoremove = 1;
                  _nul = [_helitoremove] execvm "support\taxi\removetaxi.sqf";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
             
    case 10:
    {
         if (commandpointsblu1 >= 5) then 
             {
              if (!support_helotaxi2_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 5;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _helotax1 = [player,"helo_taxi2"] call BIS_fnc_addCommMenuItem;
				  helotax1 = _helotax1;
                  lbSetColor [2103, 10, [0, 1, 0, 1]];
				  playSound "boots";
                  support_helotaxi2_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 2.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,helotax1] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 10, [1, 0, 0, 1]];
				  playSound "boots";
				  support_helotaxi2_available = false;
				  hint "Support Locked & 50% Refunded";
                  _helitoremove = 1;
                  _nul = [_helitoremove] execvm "support\taxi\removetaxi.sqf";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
             
    case 11:
    {
         if (commandpointsblu1 >= 4) then 
             {
              if (!support_helotaxi3_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 4;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _helotax2 = [player,"helo_taxi3"] call BIS_fnc_addCommMenuItem;
				  helotax2 = _helotax2;
                  lbSetColor [2103, 11, [0, 1, 0, 1]];
				  playSound "boots";
                  support_helotaxi3_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 2;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,helotax2] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 11, [1, 0, 0, 1]];
				  playSound "boots";
				  support_helotaxi3_available = false;
				  hint "Support Locked & 50% Refunded";
                  _helitoremove = 1;
                  _nul = [_helitoremove] execvm "support\taxi\removetaxi.sqf";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 12:
    {
         if (commandpointsblu1 >= 15) then 
             {
              if (!support_cluster_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _cluster = [player,"cluster"] call BIS_fnc_addCommMenuItem;
				  cluster = _cluster;
                  lbSetColor [2103, 12, [0, 1, 0, 1]];
				  playSound "boots";
                  support_cluster_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 7.5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,cluster] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 12, [1, 0, 0, 1]];
				  playSound "boots";
				  support_cluster_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
	
    case 13:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_specialized_training_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  ["inf_training",["Specialized Infantry training","Our troops are now more skilled in battle"]] call bis_fnc_showNotification;
				  blufor_ai_skill = [(blufor_ai_skill select 0)+0.3,(blufor_ai_skill select 1)+0.3];
                  lbSetColor [2103, 13, [0, 1, 0, 1]];
                  support_specialized_training_available = true;
				  publicVariable "support_specialized_training_available";
				  playSound "boots";
				  publicVariable "blufor_ai_skill";				  
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };	
	
    case 14:
    {
         if (commandpointsblu1 >= 2) then 
             {
              if (!support_boattaxi_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 2;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  lbSetColor [2103, 14, [0, 1, 0, 1]];
                  support_boattaxi_available = true;
				  _boattaxi = [player,"boat_taxi"] call BIS_fnc_addCommMenuItem;
				  boattaxi = _boattaxi;
				  playSound "boots";
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 1;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,boattaxi] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 14, [1, 0, 0, 1]];
				  playSound "boots";
				  support_boattaxi_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 15:
    {
         if (!support_halo_available) then 
             {
              if (commandpointsblu1>=15) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  hq_blu1 addaction ["<t color='#15ff00'>HALO Alone (5CP)</t>", "ATM_airdrop\atm_airdrop.sqf", "", 0, true, true, "", "_this == player"];
				  hq_blu1 addaction ["<t color='#15ff00'>HALO Group (5CP)</t>", "COB_HALO\grphalo.sqf", "", 0, true, true, "", "_this == player"];
                  lbSetColor [2103, 15, [0, 1, 0, 1]];
                  support_halo_available = true;
				  {_x addaction ["<t color='#15ff00'>HALO Alone (5CP)</t>", "ATM_airdrop\atm_airdrop.sqf", "", 0, true, true, "", "_this == player"]} forEach (Array_of_FOBS);
				  {_x addaction ["<t color='#15ff00'>HALO Group (5CP)</t>", "COB_HALO\grphalo.sqf", "", 0, true, true, "", "_this == player"]} forEach (Array_of_FOBS);
				  playSound "loadgun";
				 // publicVariable "support_halo_available";
                  ["halo",["Halo Unlocked","Access Halo Jumping at the HQ and at FOB's"]] call bis_fnc_showNotification;
                }
              else
                {
                  hint "Not enough command points!";
                };
             } 
          else 
             {
               hint "You cannot re-lock this support for any refunds";
             };
    };

case 16:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_hcCAS_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcCAS = [player,"hc_CAS"] call BIS_fnc_addCommMenuItem;
				  hcCAS = _hcCAS;
                  lbSetColor [2103, 16, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcCAS_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 10;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcCAS] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 16, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcCAS_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 17:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_hcAttChop_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcAttChop = [player,"hc_ATTchop"] call BIS_fnc_addCommMenuItem;
				  hcAttChop = _hcAttChop;
                  lbSetColor [2103, 17, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcAttChop_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 10;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcAttChop] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 17, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcAttChop_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 18:
    {
         if (commandpointsblu1 >= 10) then 
             {
              if (!support_hcAIRTRANS_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 10;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcAIRTRANS = [player,"hc_AIRTRANS"] call BIS_fnc_addCommMenuItem;
				  hcAIRTRANS = _hcAIRTRANS;
                  lbSetColor [2103, 18, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcAIRTRANS_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 5;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcAIRTRANS] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 18, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcAIRTRANS_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 19:
    {
         if (commandpointsblu1 >= 8) then 
             {
              if (!support_hcGRTRANS_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 8;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcGRTRANS = [player,"hc_GRTRANS"] call BIS_fnc_addCommMenuItem;
				  hcGRTRANS = _hcGRTRANS;
                  lbSetColor [2103, 19, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcGRTRANS_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 4;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcGRTRANS] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 19, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcGRTRANS_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
	
case 20:
    {
         if (commandpointsblu1 >= 25) then 
             {
              if (!support_hcREPAIR_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 25;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcBOBCATREP = [player,"hc_BOBCATREP"] call BIS_fnc_addCommMenuItem;
				  hcBOBCATREP = _hcBOBCATREP;
                  lbSetColor [2103, 20, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcBob_available = true;
                }
              else
                {				
				  commandpointsblu1 = commandpointsblu1 + 4;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcREPAIR] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 20, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcREPAIR_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };	

case 21:
    {
         if (commandpointsblu1 >= 8) then 
             {
              if (!support_hcREPAIR_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 8;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _hcREPAIR = [player,"hc_REPAIR"] call BIS_fnc_addCommMenuItem;
				  hcREPAIR = _hcREPAIR;
                  lbSetColor [2103, 21, [0, 1, 0, 1]];
				  playSound "boots";
                  support_hcREPAIR_available = true;
                }
              else
                {				
				  commandpointsblu1 = commandpointsblu1 + 4;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,hcREPAIR] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 21, [1, 0, 0, 1]];
				  playSound "boots";
				  support_hcREPAIR_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 22:
    {
         if (commandpointsblu1 >= 100) then 
             {
              if (!support_nuke_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 100;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _nuke = [player,"nuke"] call BIS_fnc_addCommMenuItem;
				  nuke = _nuke;
                  lbSetColor [2103, 22, [0, 1, 0, 1]];
				  playSound "boots";
                  support_nuke_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 50;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,nuke] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 22, [1, 0, 0, 1]];
				  playSound "boots";
				  support_nuke_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };	

case 23:
    {
         if (commandpointsblu1 >= 100) then 
             {
              if (!support_dino_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 100;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _dino = [player,"dino"] call BIS_fnc_addCommMenuItem;
				  dino = _dino;
                  lbSetColor [2103, 23, [0, 1, 0, 1]];
				  playSound "boots";
                  support_dino_available = true;
                }
              else
                {				
				  commandpointsblu1 = commandpointsblu1 + 50;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,dino] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 23, [1, 0, 0, 1]];
				  playSound "boots";
				  support_dino_available = false;
				  hint "Support Locked & 50% Refunded";
                  
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

case 24:
    {
         if (zoneundercontrolblu >= 1) then 
             {
              if (!support_FOB_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 0;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _repfob = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
				  DUWSrepfob = _repfob;
                  lbSetColor [2103, 24, [0, 1, 0, 1]];
				  playSound "boots";
                  support_FOB_available = true;
                }
              else
                {
				  commandpointsblu1 = commandpointsblu1 + 0;
				  ctrlSetText [1000, format["%1",commandpointsblu1]];
				  [player,DUWSrepfob] call BIS_fnc_removeCommMenuItem;
				  lbSetColor [2103, 24, [1, 0, 0, 1]];
				  playSound "boots";
				  support_FOB_available = false;
                  hint "Support removed from comm menu";
                };
             } 
          else 
             {
               hint "Your team must control at least 1 zone";
             };
    }; 
	
};

//hint format["index: %1",_index2];


publicVariable "commandpointsblu1";
