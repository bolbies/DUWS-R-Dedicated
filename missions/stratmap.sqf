_array_of_missions = [];  // init the array of missions
_allFound = false;
_counter = 0;

if (isnil ("Mission_timeout_request")) then {Mission_timeout_request = true;};
if (!Mission_timeout_request) exitWith {PAPABEAR=[West,"HQ"]; PAPABEAR SideChat "We don't have any other missions for you right now, try again in 10 minutes";};
if (!isServer) exitWith {hint "Only the host can request side missions for now"};
if (officedead) exitWith {hint "Your commanding officer is dead, so there are no side-missions allowed!"};

startLoadingScreen ["Loading zones..."];
_kibot_pos_array_missionPos = [[-99999,-99999,-99999]];

while {_counter < 12;} do {
_foundSafePos = [center_of_map, 0,half_of_map,5,0,0.1,0] call BIS_fnc_findSafePos;

_array_exist = true;
_found_dist_away = true;

_array_exist = false;
     
_kibot_distances_array = [];

       for [{_t=1}, {_t<=count _kibot_pos_array_missionPos}, {_t=_t+1}] do // for each element of the array of positions
           {                                         
           _kibot_pos_array_missionPos_index = _t-1;  // get the index of the element
           _kibot_distances_array = _kibot_distances_array +[(_kibot_pos_array_missionPos select _kibot_pos_array_missionPos_index) distance (_foundSafePos)]; //compare the distance of the given pos with other pos in pos array and add it into an array of all the compared distance --> an array of distances is obtained
           };

       for [{_t=1}, {_t<=count _kibot_distances_array}, {_t=_t+1}] do // for each element of the array of distances we just generated...
           {                                           
           _kibot_distances_array_index = _t-1; // get the index of the tested element
           _check = (_kibot_distances_array select _kibot_distances_array_index); // select the element we just took the index so we can check them
              if (_check < 1000) then {    // check the distances contained the distances array 1 by 1. If a distance is inferior to defined value, this is a no go.
              _found_dist_away = false;   // If no zone is under 1500 meters, tell it to this variable
              };
            };
            
//if (_found_dist_away && !_array_exist) then {_kibot_pos_array_missionPos = [_kibot_pos_array_missionPos, 0] call BIS_fnc_removeIndex};  // remove the -9999 entry if there is

// if a distance has been found, add the position to the array of pos, because it's a valid pos.
if (_found_dist_away) then {};



    if (_foundsafePos distance player > 1000 && _found_dist_away && _foundsafePos distance hq_blu1 < zones_max_dist_from_hq) then {  // A VALID POS HAS BEEN FOUND
    switch (_counter) do
   {
    case 0: // mission RECOVER
    {
        //add the mission into the strat map
        _radius = 500;
        MissionNameCase0 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase0Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase0Mission] execVM "missions\missions\recover\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase0,
        "RECOVER THE MTV<br/>Mobile Teleport Vehicle<br/><br/>An enemy AAF Strider being used as a mobile teleport vehicle (MTV) has been reported stuck somewhere here. Find it, and bring it back to base safely to earn a new mobile teleporting option that you can use.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\BasicSpeed_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
	
	case 1: // mission ROULETTE
    {
        //add the mission into the strat map
        _radius = 500;
        MissionNameCase1 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase1Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase1Mission] execVM "missions\missions\roulette\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase1,
        "DEFUSE THE GORGON<br/>Get a Gorgon and 200 spendable CP or risk losing it all!<br/><br/>You must locate the defuse code on one of the enemy patrol units in the AO, then locate and safely defuse the armored Gorgon vehicle which is set to explode in 30 minutes. If you succeed your reward will earn you an extra 200 spendable Command Points and you get to keep the Gorgon, but if you fail all of your current Command Points will be taken away!<br/><br/>...well, you'll get to keep 2cp for a ride home and a Sitrep.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
	
	case 2: // mission Do or Die
    {
        //add the mission into the strat map
        _radius = 500;
        MissionNameCase2 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase2Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase2Mission] execVM "missions\missions\doordie\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase2,
        "DO or DIE!<br/>You Must Save Your Commanding Officer.<br/><br/>You must go to the AO marked on your map and locate the briefcase which contains the secret defuse code, then make it back to HQ within 30 minutes so you can disarm the bomb that is attached to the officer.<br/><br/>If you are successful you will earn 250 spendable CP, if you are not successful it's Mission Over and you lose at DUWS!",
        "",
        "\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
	case 3: // mission RESCUE
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase3 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase3Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase3Mission] execVM "missions\missions\rescue\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase3,
        "A friendly patrol has been ambushed and needs to be rescued in this area",
        "",
        "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };

    case 4: // mission STEAL
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase4 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase4Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase4Mission] execVM "missions\missions\steal\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase4,
        "An enemy truck full of supplies is stuck somewhere here. Find it and bring it back to base safely.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\BasicSpeed_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
    
    case 5: // mission TARGET
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase5 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase5Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase5Mission] execVM "missions\missions\target\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase5,
        "Our intel has reported a high value target around this area, probably an officer. Find him and kill him.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
    
    case 6: // mission DESTROY
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase6 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase6Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase6Mission] execVM "missions\missions\destroy\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase6,
        "A major military infrastructure has been detected around this area. You must destroy it.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
    
    case 7: // mission PILOT
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase7 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase7Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase7Mission] execVM "missions\missions\pilot\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase7,
        "One of our aircraft has been downed somewhere around this position. You must find the pilot and bring it back to base safely.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Direction_ca.paa", 
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };
    
    case 8: // mission SABOTAGE
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase8 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase8Mission = _foundSafepos;
        
        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase8Mission] execVM "missions\missions\sabotage\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase8,
        "The enemy is using a power supply near this location. We need to sabotage this power supply in order to know where their main infrastructures are.",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Rules_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };

    case 9: // mission ARMORY
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase9 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase9Mission = _foundSafepos;

        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase9Mission] execVM "missions\missions\armory\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase9,
        "Recover mobile armory",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };

    case 10: // mission TRANSPORTHELI
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase10 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase10Mission = _foundSafepos;

        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase10Mission] execVM "missions\missions\transportheli\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase10,
        "Recover transport helicopter",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };

    case 11: // mission build
    {
        //add the mission into the strat map
        _radius = 300;
        MissionNameCase11 = [0] call compile preprocessFile "random_name.sqf";
        PosOfCase11Mission = _foundSafepos;

        _missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
        {_handle = [PosOfCase11Mission] execVM "missions\missions\builder\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
        MissionNameCase11,
        "Recover builder vehicle",
        "",
        "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
        1,
        []
        ];
        _array_of_missions = _array_of_missions + [_missionArray];
    };

    };
    _counter = _counter + 1;
    _kibot_pos_array_missionPos = _kibot_pos_array_missionPos + [_foundSafePos];
    };
};
endLoadingScreen;

// -------****- NOW OPEN THE MAP

_isNight = false;
if ((20 < daytime) OR (daytime < 5)) then {_isNight=true};


[(findDisplay 46),                                                                          // 0: DISPLAY - parent display. When empty, mission display is used.
getpos player,                                                                // 1: ARRAY - default view position in format [x,y,y] or [x,y]
_array_of_missions,                                                              // 2: ARRAY - list of missions in format:             
[],                                                                           // 3: ARRAY - list of ORBAT groups in format:
[],                                                                           // 4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
[],                                                                           // 5: ARRAY - list of custom images in format:
1,                                                                            // 6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
_isNight                                                                         // 7: BOOL - true for night version of strategic map (darker with blue tone)
] call BIS_fnc_strategicMapOpen;

/*
Parameter(s):
		0: DISPLAY - parent display. When empty, mission display is used.
		1: ARRAY - default view position in format [x,y,y] or [x,y]
		2: ARRAY - list of missions in format:
			0: ARRAY - mission position in format [x,y,y] or [x,y]
			1: CODE - expression executed when user clicks on mission icon
			2: STRING - mission name
			3: STRING - short description
			4: STRING - name of mission's player
			5: STRING - path to overview image
			6: NUMBER - size multiplier, 1 means default size
			7: ARRAY - parameters for the -on click- code; referenced from the script as (_this select 9)
		3: ARRAY - list of ORBAT groups in format:
			0: ARRAY - group position in format [x,y,y] or [x,y]
			1: CONFIG - preview CfgORBAT group
			2: CONFIG - topmost displayed CfgORBAT group
			3: ARRAY - list of allowed tags
			4: NUMBER - maximum number of displayed tiers
		4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
		5: ARRAY - list of custom images in format:
			0: STRING - texture path
			1: ARRAY - color in format [R,G,B,A]
			2: ARRAY - image position
			3: NUMBER - image width (in metres)
			4: NUMBER - image height (in metres)
			5: NUMBER - image angle (in degrees)
			6: STRING - text displayed next to the image
			7: BOOL - true to display shadow
		6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
		7: BOOL - true for night version of strategic map (darker with blue tone)

	Returns:
	DISPLAY - RscDisplayStrategicMap
	*/
