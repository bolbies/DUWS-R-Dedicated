



protect_officer = {
    private["_victim","_shooter","_vicFac","_shooterFac"];
    _victim = _this select 0;
    _shooter = _this select 1;
    _vicFac = side (group _victim);
    _shooterFac = side (group _shooter);
	
	

    if(_shooter == player) then {_victim allowdamage false};
	if(_shooter != player) exitwith {};
	

	[] execvm "damag.sqf";
	
	
    };    
