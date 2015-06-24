
if (UseSiren==1) then {
[[{playSound "siren"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
};
[[{PAPABEAR sidechat "This is HQ, there are enemies near our main base!"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
[[{hint "...enemies approaching the main base!"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;




//  [[{"Your Codewithout the quotes"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;