deathhint = {
_deathhintDir = [player, BOMBCODE1] call BIS_fnc_dirTo;
_deathhintDis = leader BOMBCODE1 distance player;
//[hint format ["*MARK YOUR MAP!*\n\n... enemy unit with secret papers\nhas just been killed\n\n...Approx. Location Of Corpse Is\n HEADING: %1 degrees\nRANGE: %2 meters", _deathhintDir,_deathhintDis],"BIS_fnc_Spawn",true,true] call BIS_fnc_MP;
hint format ["*MARK YOUR MAP!*\n\n... enemy unit with secret papers\nhas just been killed\n\n...Approx. Location Of Corpse Is\n HEADING: %1 degrees\nRANGE: %2 meters", _deathhintDir,_deathhintDis];
};
//publicvariable "deathhint";