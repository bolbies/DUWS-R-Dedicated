 _unit = _this select 0;
 _caller = _this select 1;
 _id = _this select 2;
 
 _caller playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
 hint format["You have found the bomb code - %1", CODE];
 
 //_unit removeAction _id;