_index = lbCurSel 2102;


_spawnPos = getpos player;
_spawnPos = [(_spawnPos select 0)+30, _spawnPos select 1];

switch (_index) do
{
    case 0:  
    {
          if (commandpointsblu1 >= 18) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 18;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "O_MRAP_02_hmg_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

    case 1:  
    {
          if (commandpointsblu1 >= 18) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 18;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MRAP_01_hmg_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

    case 2:  
    {
          if (commandpointsblu1 >= 25) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 25;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MRAP_01_gmg_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 3:  
    {
          if (commandpointsblu1 >= 35) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 35;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Wheeled_01_cannon_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 4:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "O_Heli_Attack_02_black_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 5:  
    {
          if (commandpointsblu1 >= 35) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 35;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Light_01_armed_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 6:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Attack_01_F" createVehicle _spawnPos;
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
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 15;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Light_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 8:  
    {
          if (commandpointsblu1 >= 22) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 22;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Transport_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 9:  
    {
          if (commandpointsblu1 >= 35) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 35;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_rcws_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
    
    case 10:  
    {
          if (commandpointsblu1 >= 1) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 1;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Quadbike_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
   
    case 11:  
    {
          if (commandpointsblu1 >= 30) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 30;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_AA_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };

    case 12:  
    {
          if (commandpointsblu1 >= 40) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 40;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MBT_01_cannon_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
   
    case 13:  
    {
          if (commandpointsblu1 >= 28) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 28;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_CRV_F" createVehicle _spawnPos;
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
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 2;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "C_Offroad_01_F" createVehicle _spawnPos;
		   sleep 1;
		   _vehic setObjectTexture [0, "#(argb,8,8,3)color(0.141,0.118,0.082,1)"];
		   _vehic animate ["Hidepolice", 1];
		   _vehic animate ["Hideservices", 1];
		   _vehic animate ["Hidebackpacks", 0];
		   _vehic animate ["Hidebumper1", 0];
		   _vehic animate ["Hidebumper2", 0];
		   _vehic animate ["Hideconstruction", 0];
		   _vehic animate ["Hidedoor1", 1];
		   _vehic animate ["Hidedoor2", 1];
		   _vehic animate ["Hidedoor3", 1];
		   _vehic animate ["Hideglass2", 1];
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
	
case 15:  
    {
          if (commandpointsblu1 >= 75) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 75;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MBT_01_mlrs_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

case 16:  
    {
          if (commandpointsblu1 >= 75) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 75;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MBT_01_arty_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
	
case 17:  
    {
          if (commandpointsblu1 >= 10) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 10;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_G_Van_01_fuel_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

case 18:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = execVM "dialog\casspawn.sqf";
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

case 19:  
    {
          if (commandpointsblu1 >= 40) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 40;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MBT_01_TUSK_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };

case 20:  
    {
          if (commandpointsblu1 >= 20) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 20;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_UGV_01_rcws_F" createVehicle _spawnPos; createVehicleCrew _vehic; 
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 21:  
    {
          if (commandpointsblu1 >= 10) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 10;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_UGV_01_F" createVehicle _spawnPos; createVehicleCrew _vehic; 
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };		
	
case 22:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "kyo_MH47E_Ramp" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };		
	
case 23:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "USAF_CV22" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 24:  
    {
          if (commandpointsblu1 >= 0) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 0;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_UCSV_02" createVehicle _spawnPos; createVehicleCrew _vehic;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };		
	
case 25:  
    {
          if (commandpointsblu1 >= 75) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 75;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = execVM "support\halo.sqf";
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 26:  
    {
          if (commandpointsblu1 >= 25) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 25;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "O_Heli_Transport_04_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 27:  
    {
          if (commandpointsblu1 >= 15) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 15;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = execVM "dialog\UAV1.sqf";
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };		
	
case 28:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "BWA3_Puma_Fleck" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 29:  
    {
          if (commandpointsblu1 >= 45) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 45;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "BWA3_Leopard2A6M_Fleck" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 30:  
    {
          if (commandpointsblu1 >= 20) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 20;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "HMMWV_M1151_M2" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
	
case 31:  
    {
          if (commandpointsblu1 >= 25) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 25;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "M1114_AGS_ACR" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };	
   
};
publicVariable "commandpointsblu1";
//hint format["index: %1",_index];

