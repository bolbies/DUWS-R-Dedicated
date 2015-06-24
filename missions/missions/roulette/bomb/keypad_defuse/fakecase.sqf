 _unit = _this select 0;
 _caller = _this select 1;
 _id = _this select 2;
 _fakeitem=["Recipe for cake","The Bill of Rights","A hospital bill","old OPFOR battle plans","A love poem","Divorce Papers","Airline Tickets","Bus Tickets","A Sandwich"] call BIS_fnc_selectRandom;
 _caller playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
 hint format["You have found - %1", _fakeitem];
