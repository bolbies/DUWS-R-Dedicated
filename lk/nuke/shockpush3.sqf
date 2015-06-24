/*_radius = (_this select 0);
_force = (_this select 1);
_veh = (_this select 2);
_unit = (_this select 3);
_posunit = getpos _unit;

_objectVel = velocity _unit;
_objectDir = direction _unit;

_objectMass = getMass _unit;
_distance = _unit distance _veh;
_dis = _veh vectorDiff _posunit;
_shockX = sqrt(_force - (_dis select 0))*2;
_shockY = sqrt(_force - (_dis select 1))*2;
_shockZ = (_force - _distance)/2;

_shockX_F = ((_force/_objectMass)*_force)*_shockX;
_shockY_F = ((_force/_objectMass)*_force)*_shockY;
_shockZ_F = ((_force/_objectMass)*_force)*_shockZ;

if ((_dis select 0) > 0) then {
    _shockX_F = -_shockX_F;
};
if ((_dis select 1) > 0) then {
    _shockY_F = -_shockY_F;
};

_shockX_F = ceil(random _shockX_F);
_shockY_F = ceil(random _shockY_F);
_shockZ_F = ceil(random _shockZ_F);

if (_objectVel select 0 > 0 || _objectVel select 1 > 0) then {
    _unit setVelocity [(_objectVel select 0) + (sin _objectDir * _shockX_F),(_objectVel select 1) + (cos _objectDir * _shockY_F),_shockZ_F];
} else {
    _unit setVelocity [_shockX_F,_shockY_F,_shockZ_F];
};*/
_veh = _this select 0;;
_force = 50;
_objectList = nearestObjects [_veh, ["Man","LandVehicle","Air","Ship","Fence","Thing"], 3000];
_objectNum = count _objectList;

{
    _objectVel = velocity _x;
	_objectDir = direction _x;
    
    _objectMass = getMass _x;
	_distance = _x distance _veh;
	_dis = _veh vectorDiff (getpos _x);
	_shockX = (_force - (_dis select 0))*2;
	_shockY = (_force - (_dis select 1))*2;
	_shockZ = (_force - _distance)/10;
    
    if (_shockX < 0) then {
        _shockX = -_shockX;
        _shockX = sqrt(_shockX);
        _shockX = -_shockX;
	};
    
    if (_shockY < 0) then {
        _shockY = -_shockY;
        _shockY = sqrt(_shockY);
        _shockY = -_shockY;
	};
    
    if (_shockZ < 0) then {
        _shockZ = -_shockZ;
    };
    
    if (_objectMass == 0) then {
        _objectMass = 250;
        
        if(isplayer _x) then {
            player addEventHandler ["AnimStateChanged", {
                if (_this select 1 == "incapacitated") then {
                    player allowDamage false;
                    player setPosWorld getPosWorld player;
                    player allowDamage true;
            
                    //if ((player distance _veh > 1000) && (player distance _veh < 1500)) then {player setDamage (0.5 + random 0.45);};
                    //if ((player distance _veh > 1500) && (player distance _veh < 2000)) then {player setDamage (0.1 + random 0.5);};
                };
            }]; 
            
            if (vehicle player != player) exitWith {};
            
            private "_rag";
            _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
            _rag setMass 1e10;
            _rag attachTo [player, [0,0,0], "Spine3"];
            _rag setVelocity [0,0,6];
            player allowDamage false;
            detach _rag;
            deletevehicle _rag;
            player allowdamage true;
            
        } else {
            _x addEventHandler ["AnimStateChanged", {
                if (_this select 1 == "incapacitated") then {
                    _x allowDamage false;
                    _x setPosWorld getPosWorld _x;
                    _x allowDamage true;
            
                    //if ((_x distance _veh > 1000) && (_x distance _veh < 1500)) then {_x setDamage (0.5 + random 0.45);};
                    //if ((_x distance _veh > 1500) && (_x distance _veh < 2000)) then {_x setDamage (0.1 + random 0.5);};
                };
            }]; 
            
            if (vehicle _x != _x) exitWith {};
            
            private "_rag";
            _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
            _rag setMass 1e10;
            _rag attachTo [_x, [0,0,0], "Spine3"];
            _rag setVelocity [0,0,6];
            _x allowDamage false;
            detach _rag;
            deletevehicle _rag;
            _x allowdamage true;
        };
    };
	
	_shockX_F = ((_force/_objectMass)*_force)*_shockX;
	_shockY_F = ((_force/_objectMass)*_force)*_shockY;
	_shockZ_F = ((_force/_objectMass)*_force)*_shockZ;
    
	_shockX_F = ceil(random _shockX_F);
	_shockY_F = ceil(random _shockY_F);
	_shockZ_F = ceil(random _shockZ_F);
		
	if ((_objectVel select 0) > 0 || (_objectVel select 1) > 0) then {
		_x setVelocity [(_objectVel select 0) + (sin _objectDir * _shockX_F),(_objectVel select 1) + (cos _objectDir * _shockY_F),0];
	} else {
		_x setVelocity [_shockX_F,_shockY_F,0];
	};
    
    _x removeeventhandler ["AnimStateChanged",0];
    
    //_x setdamage 1;
    
} foreach _objectList;