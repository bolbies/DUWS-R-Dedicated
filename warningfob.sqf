if (UseSiren==1) then {
[[{playSound "siren"}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
};
[[{hint format["This is HQ, enemies have been reported around FOB %1",fobname]}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
[[{PAPABEAR sidechat format["This is HQ, enemies have been reported around FOB %1",fobname]}],"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;



//  [[{"Your Code without the quotes"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;

