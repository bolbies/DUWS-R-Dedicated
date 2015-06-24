private ["_unit","_pos","_rad","_force","_xPos","_yPos","_xVel","_yVel","_zVel","_coef","_fi",
"_n","_fi","_dam","_vel","_vecUp","_nX","_nY","_nXX","_nYY","_leanF","_leanX","_leanY","_cyklus","_theta",
"_diference","_fXX","_fYY","_fZZ","_xxF","_yyF","_zzF","_spread","_omega","_heatRad","_timeAfter","_plus","_radRad",
"_material","_intenzity","_Sound","_soundPos","_SoundWave","_SoundTurbolence","_lenght","_height","_width","_weight",
"_weakness1","_weakness2","_weakness3","_cubature","_acc","_steel","_blastDir","_burnUnit","_kappa","_zMaxima","_zChange",
"_crossXUp","_crossZUp","_crossXInter","_crossZInter","_k1","_k2","_q1","_q2","_x0","_xAcc","_yAcc","_zAcc","_crewInside",
"_shockWavePassed","_fakeBlast","_heatDamage","_markerArray","_density","_xP","_yP","_pD","_densRad","_luckyDay","_house",
"_nObject","_mortality","_getStance","_result","_animState","_animStateChars","_animP","_lowerAngle","_upperAngle",
"_nObjects","_insider","_behinder","_survivor","_stander","_priorityB","_priorityM","_bParams","_bParamsM","_bPa","_bPb","_bPc"];

// -- Declaration
_unit = _this select 0; 			// unit affected by shockwave
_pos = _this select 1;  			// centre of explosion
_kT = _this select 2;				// power of nuke in kT
_shockWavePassed = _this select 3; 	// Check if the shockwave already passed unit


//if ((isPlayer _unit) or (player in _unit)) exitWith {};

_blastDir = 0;	// Angle which is Unit pointed to a Center of Explosion (BI system)
_theta = 0;		// Lean Angle
_omega = 0;		// Velocity Angle (Cartesian system)
_n = 0;			// coef
_coef = 0;		// Coeficient defining type of unit
_density = 0;	// Ammount of Radiation Cloud points in close area of Unit
_fi = 0;		// Angle which is Unit pointed to a Center of Explosion (Cartesian system)
_k1 = 0;		// Escalation of function Underline
_k2 = 0;		// Escalation of function Interline
_q1 = 0;		// Y movement of function Underline
_q2 = 0;		// Y movement of function Interline
_x0 = 0;		// Point where Unit cross Ground to define Overpressure in any place in space
_xP = 0;		// X position of Radiation Cloud point
_yP = 0;		// Y position of Radiation Cloud point
_pD = 0;		// Distnace between Unit and point
_leaner = 0.04; // Intensity of Push and Lean it self 0.01 means lot of CPU computing (recommend for 0.03)
_house = 1;		// Basic Coeficient for Man class defining if he is outside of house or inside or behind it

// -- vehicle properties
_lenght = 0;	// Lenght of Unit	\
_height = 0;	// Height of Unit	-- Modified to be not filled in full shape of cuboid
_width = 0;		// Width of Unit	/
_weight = 0;	// Weight of Unit
_weakness1 = ""; //	I\
_weakness2 = ""; // I-- Weak parts of Unit 
_weakness3 = ""; // I/
_steel = 0; 	// Robustness of Unit
//  | 5 - Human , 2 - Cars , 3 - Trucks,Choppers,Planes, 4 - HMMWV,Jackal, 8 - T34,T55,APC, 10 - M1A1,T72,T90

_crewInside = crew _unit; // Array of units inside of vehicle

// Units needs to be applied into list of units 
// BAF_FV510_D , BAF_ATV_D , BAF_Jackal2_GMG_D , BAF_Jackal2_L2A1_D , BAF_Offroad_D

// -- Declaration of Unit type
if (_unit isKindOf "Car") then {_coef = 140; _lenght = 4.5; _height = 1.3; _width = 1.6; _weight = 800; _steel = 2; _weakness1 = "kola"; _weakness2 = "svetla";};
if (_unit isKindOf "Tank") then {_coef = 120; _lenght = 9.82; _height = 2.72; _width = 3.79; _weight = 48200; _steel = 10; _weakness1 = "pasy"; _weakness2 = "kanon"; _weakness3 = "elektronika";};
if (_unit isKindOf "Man") then {_coef = 180; _lenght = 0.30; _height = 1.77; _width = 0.40; _weight = 120; _steel = 1; _weakness1 = "ruce"; _weakness2 = "nohy";};
if (_unit isKindOf "Air") then {_coef = 150; _lenght = 18.00; _height = 4.5; _width = 2.5; _weight = 4000; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "motor";};
if (_unit isKindOf "StaticWeapon") then {_coef = 10; _lenght = 1.05; _height = 1.07; _width = 1.00; _weight = 100; _steel = 4;};
if (_unit isKindOf "Ship") then {_coef = 100; _lenght = 5.35; _height = 3.27; _width = 2.5; _weight = 395; _steel = 3;};
if (_unit isKindOf "Thing") then {_coef = 10;};
if (_unit isKindOf "Building") then {_coef = 8;};
if (_unit isKindOf "Strategic") then {_coef = 5;};
if (_unit isKindOf "Nonstrategic") then {_coef = 5;};

_rad = _unit distance _pos;

_soundPos = "Land_HelipadEmpty_F" createVehicle _pos;

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

// -- Cycle which waits for a heatWave comes to a player
while {heatWaveSpreadDistance < _rad and heatWaveSpreadDistance < heatDistance} do
{
	_rad = _unit distance _pos;
	_xPos = ((_pos select 0) - (_pos select 0));
	_yPos = ((_pos select 1) - (_pos select 1));
	if (_xPos >= 0 and _yPos >= 0) then {_fi = 0};
	if (_xPos >= 0 and _yPos < 0) then {_fi = 270 + atan (abs(_xPos / _yPos));};
	if (_xPos < 0 and _yPos < 0) then {_fi = 180 + atan (abs(_yPos / _xPos));};
	if (_xPos < 0 and _yPos >= 0) then {_fi = 90 + atan (abs(_xPos / _yPos));};
	_xSpos = shockWaveSpreadDistance * cos (_fi); _ySpos = shockWaveSpreadDistance * sin (_fi);
	_soundPos setPos [((_pos select 0)+_xSPos),((_pos select 1)+_ySPos),0];
	sleep 0.1;
};

if (vehicle _unit == _unit and !_shockWavePassed) then
{
	// -- Check if some unit did not got out of vehicle - !!!! not sure if works properly
	{
	if (!(_x in _unit)) then
	{
		if (!(_x in AllArray)) then
		{
			[_x,_pos,_kT,false] spawn ShockpushPreLoad;};
			AllArray = Allarray + [_x];
		};
	} forEach _crewInside;

	// -- Damage applied by a HeatWave to a unit or vehicles body and its weak parts
	if (heatWaveSpreadDistance < heatDistance) then
		{
		_heatDamage = _coef^3.5 / _rad^3;
		if (_heatDamage > 1) then {_heatDamage = 1;};
		_unit setHit ["trup",((Damage _unit) + _heatDamage)];
		};
};

// -- Cycle which waits for a shockWave comes to a player
while {(shockWaveSpreadDistance < _rad) and (shockWaveSpreadDistance < shockDistance)} do {
_rad = _unit distance _pos;
_xPos = ((_pos select 0) - (_pos select 0));
_yPos = ((_pos select 1) - (_pos select 1));
if (_xPos >= 0 and _yPos >= 0) then {_fi = 0};//  + atan (abs(_yPos / _xPos));
if (_xPos >= 0 and _yPos < 0) then {_fi = 270 + atan (abs(_xPos / _yPos));};
if (_xPos < 0 and _yPos < 0) then {_fi = 180 + atan (abs(_yPos / _xPos));};
if (_xPos < 0 and _yPos >= 0) then {_fi = 90 + atan (abs(_xPos / _yPos));};
_xSpos = shockWaveSpreadDistance * cos (_fi); _ySpos = shockWaveSpreadDistance * sin (_fi);
_soundPos setPos [((_pos select 0)+_xSPos),((_pos select 1)+_ySPos),(_pos select 2)];
sleep 0.2;
};
if (vehicle _unit == _unit and !_shockWavePassed) then
{
	// -- Check if some unit did not got out of vehicle - !!!! not sure if works properly
	{
	if (!(_x in _unit)) then
	{
		if (!(_x in AllArray)) then
		{
			[_x,_pos,_kT,false] spawn ShockpushPreLoad;};
			AllArray = Allarray + [_x];
		};
	} forEach _crewInside;

//[_pos,_kT] spawn StaticPreLoad;

// -- Final Declaration of Shockwave impact into a car
if (shockWaveSpreadDistance < shockDistance) then
{
	// -- Overpressure in air
	_xPos = ((_pos select 0) - (_pos select 0));
	_yPos = ((_pos select 1) - (_pos select 1));
	_zPos = ((_pos select 2) - (_pos select 2));

	_GR = sqrt(_xPos^2 + _yPos^2); // GR = Ground radius
	_zMaxima = 8 * _GR^0.5;
	_zChange = 15 * _GR^0.5;
	
	// IF VEHICLE IS ABOVE CHANGING CURVE y = 15*x^0.5 AND IS IN y = sqrt(R^2 - x^2)
	if (_zPos > _zChange) then
		{
		_rad = _unit distance _pos;
		_crossXUp = 1/2*(sqrt(4*_rad^2+50625)-225);
		_crossZUp = 15 * _crossXUp^0.5;
		_k2 =(_crossZUp + 300)/(_crossXUp - 4000);
		_q2 = _crossZUp - _crossXUp*_k2;
		_crossXInter = (- _k2*_q2-8*sqrt(16-_k2*_q2)+32)/_k2^2;
		_crossZInter = 8 * _crossXInter^0.5;
		_k1 =(_crossZInter + 500)/(_crossXInter - 150);										
		_x0 = (500 + _k1*150)/ _k1;
		};	
	// IF VEHICLE IS BETWEEN CHANGING CURVE y = 15*x^0.5 AND MAXIMUM CURVE y = 8*x^0.5 AND IS IN y = -kx + q
	if (_zPos > _zMaxima and _zPos <= _zChange) then
		{
		_k2 =(_zPos + 300)/(_GR - 4000);
		_q2 = _zPos - _GR*_k2;
		_crossXInter = (- _k2*_q2-8*sqrt(16-_k2*_q2)+32)/_k2^2;
		_crossZInter = 8 * _crossXInter^0.5;
		_k1 =(_crossZInter + 500)/(_crossXInter - 150);										
		_x0 = (500 + _k1*150)/ _k1;
		};
	// IF VEHICLE IS BELLOW MAXIMUM CURVE y = 8*x^0.5 AND IS IN y = kx + q
	if (_zPos <= _zMaxima) then
		{
		_k1 =(_zPos + 500)/(_GR - 150);
		_x0 = (500 + _k1*150)/ _k1;
		};
	//FOR MORE INFO ABOUT THESE APROXIMATED FUNCTIONS VISIT http://en.wikipedia.org/wiki/Effects_of_nuclear_explosions

_overPressure =(((15.071*_kT^0.5131)*(_x0/1000)^(-0.016*ln(_kT) - 1.4113))*3); // Result in kPa

if (_xPos >= 0 and _yPos >= 0) then {_fi = 0};
if (_xPos >= 0 and _yPos < 0) then {_fi = 270 + atan (abs(_xPos / _yPos));};
if (_xPos < 0 and _yPos < 0) then {_fi = 180 + atan (abs(_yPos / _xPos));};
if (_xPos < 0 and _yPos >= 0) then {_fi = 90 + atan (abs(_xPos / _yPos));};

if (_fi <= 90) then {_blastDir = 90 - _fi;};
if (_fi > 90) then {_blastDir = 450 - _fi;};	

if (_GR > 0) then {
    _kappa = atan(abs(_zPos / _GR));
    } else {
    _kappa = atan(abs(0));
};

// -- Definining position of vehicle in space, count of impact force and its own accelaration after impact
_dir = getDir _unit;
_diference = abs(_blastDir - _dir);

// -- Check in what position unit stands: UP / MIDDLE / DOWN	(By Muzzleflash)
// -- Reducing Height if is Unit in Crouch or Prone
_result = 1;
if (_unit isKindOf "Man") then
					{
                        if (stance _unit == "CROUCH") then {
                            _lenght = _lenght*1.7;
                            _height = _height * 0.62;
                            _result = 1.18;
                        };
                        if (stance _unit == "PRONE") then {
                            _lenght = _lenght*5.1;
                            _height = _height * 0.19;
                            _result = 1.42;
                        };
                        if (stance _unit == "STAND") then {
                            _result = 1;
                        };
					};

_cubature = (abs(_lenght* sin(_diference)) + abs(_width * cos(_diference))*_height); // Result in m^2
_force = _overpressure * _cubature; // Result in kN

_acc = 100*(_force / _weight);

// -- Defining damage to a vehicle + extra damage to its own weak parts like Engine,Electronics
_dam = _overPressure / (_steel * 8);

/*		// -- Check All Physical atributes impacting unit -- Be sured that if you use this check your vehicle wont be damaged (Bug?)
				if ((isPlayer _unit) or (player in _unit)) then
					{
					hintC format ["Overpressure: %1\nCubature: %2\nForce: %3\nAccelaration: %4\nDamage: %5",
					_overPressure,_cubature,_force,_acc,_dam];
					};
		 // --	
*/

			_luckyDay = 0;
			_insider = 0;	// Maximal distance for Inside area of building.
			_behinder = 0;	// Maximal distance for building where it can act like "Behind" cover.
			_survivor = 0;	// Multiplier of how much is building able to survive Blast (Standard is Brick small house: Inside=3/Behind=1.5)
			_stander = 0;	// Can Unit survive while stands inside/behind certain buidling? (1 = best chances > 0.1 = reallz poor chances)
			_nObject = "";
			_priorityM = 320;
			_bParamsM = [];
			
if (_dam > 1) then {_dam = 1;};

if (_unit isKindOf "Air") then
	{
	_dam = (_dam / (ln(_x0)/(ln(_x0-_x0/1.3))));
	_acc = _acc/(2/(ln(_kT)+1));
	};

			
/*		// -- Check where player is
				if ((isPlayer _unit) or (player in _unit)) then
					{
					hintC format ["Object: %1\nUDistO: %2\n - DistU: %4\nCoef: %5\nMort: %8 - Luck? %6\nDam: %7\nOP: %3\nAcc: %9\nInside Coef: %10\nBehind Coef: %11",
					_nObject,_nObject distance _unit,_overPressure,_GR,_house,_LuckyDay,_dam,_mortality,_acc,_insider,_behinder];
					};
		// --						
	*/
	
_unit setDamage ((Damage _unit) + _dam);

if (!(_unit isKindOf "Man")) then
	{
	{_x setDamage ((Damage _x) + (_dam*(0.7+(random 0.6))))} forEach crew _unit;
	};

	if (_weakness1 != "") then {_unit setHit [_weakness1,((Damage _unit) + _dam + _heatDamage)];};
	if (_weakness2 != "") then {_unit setHit [_weakness2,((Damage _unit) + _dam + _heatDamage)];};
	if (_weakness3 != "") then {_unit setHit [_weakness3,((Damage _unit) + _dam + _heatDamage)];};	
	
// -- Part which is counting with Shock Force and Leaning of vehicle or unit

if (_coef > 10) then
	{
	if (_force < 0) then {_force = 0;};

	// Debug if speed and lean of vehicle is equal to zero
	_vel = velocity _unit;
	if (_vel select 0 == 0) then {_vel = [0.0001,_vel select 1, _vel select 2];};
	if (_vel select 1 == 0) then {_vel = [_vel select 0,0.0001, _vel select 2];};
	if (_vel select 2 == 0) then {_vel = [_vel select 0,_vel select 1, 0.0001];};	
	_vecUp = vectorUp _unit;
	if (_vecUp select 0 == 0) then {_vecUp = [0.0001,_vecUp select 1, _vecUp select 2];};
	if (_vecUp select 1 == 0) then {_vecUp = [_vecUp select 0,0.0001, _vecUp select 2];};
	if (_vecUp select 2 == 0) then {_vecUp = [_vecUp select 0,_vecUp select 1, 0.0001];};

	_xVel = _vel select 0;
	_yVel = _vel select 1;
	_zVel = _vel select 2;
	// Check in which way is vehicle moving and some speed correction of it
	if (_xVel >= 0 and _yVel >= 0) then {_omega = 0  + atan (abs(_yVel / _xVel));};
	if (_xVel >= 0 and _yVel < 0) then {_omega = 270 + atan (abs(_xVel / _yVel));};
	if (_xVel < 0 and _yVel < 0) then {_omega = 180 + atan (abs(_yVel / _xVel));};
	if (_xVel < 0 and _yVel >= 0) then {_omega = 90 + atan (abs(_xVel / _yVel));};
	_diferencial = abs(_omega - _fi);
	if (_diferencial > 90 and _diferencial < 270) then
		{
		_xVel = _xVel * (cos(_diferencial)+2)/ ln(_coef/7.77);
		_yVel = _yVel * (cos(_diferencial)+2)/ ln(_coef/7.77);
		};
		
	// -- Setting up for Leaning
	_nY = 0; _nX = 0; _nXX = 0; _nYY = 0; _fXX = 0; _fYY = 0; _fZZ = 0;	_n = 0;
	_nX = _leaner * cos (_fi);
	_nY = _leaner * sin (_fi);
	_cyklus = _acc^0.4 / 4;
	if (_cyklus < _leaner) then {_cyklus = _leaner;};

	_zAcc = _acc * sin(_kappa) + (3 * _acc) / ln(_GR);
	
	if (((_diference > 60 and _diference < 120)or(_diference > 240 and _diference < 300))
		and(_unit isKindOf "LandVehicle")) then
		{
		_acc = _acc * 0.36;
		};
	
	_xAcc = _acc * cos(_fi);
	_yAcc = _acc * sin(_fi);

	_xxF = _xAcc / _cyklus;
	_yyF = _yAcc / _cyklus;
	_zzF = _zAcc / _cyklus;
	
	// -- Finding out on what side unit should lean
	if ((_vecUp select 0) >= 0 and (_vecUp select 1) >= 0) then {_theta = 0  + atan (abs((_vecUp select 1) / (_vecUp select 0)));};
	if ((_vecUp select 0) >= 0 and (_vecUp select 1) < 0) then {_theta = 270 + atan (abs((_vecUp select 0) / (_vecUp select 1)));};
	if ((_vecUp select 0) < 0 and (_vecUp select 1) < 0) then {_theta = 180 + atan (abs((_vecUp select 1) / (_vecUp select 0)));};
	if ((_vecUp select 0) < 0 and (_vecUp select 1) >= 0) then {_theta = 90 + atan (abs((_vecUp select 0) / (_vecUp select 1)));};
	_diference = abs(_theta - _fi);

	if (_diference < 270 and _diference > 90 and _unit isKindOf "Air") then {_nX = - _nX; _nY = - _nY;};
	
	// -- Cycle which will Lean unit and push it in wright way

	// -- Locking vehicle	
	{_x disableAI "MOVE";} forEach crew _unit;
	_unit lock true;
	
	// -- Push and Lean it self

	while {_n < _cyklus} do
		{
		    _unit setvectorup [(_vecUp select 0)+_nXX,(_vecUp select 1)+_nYY,(_vecUp select 2)];
			_n = _n + _leaner;
			_nXX = _nXX + _nX; _nYY = _nYY + _nY;
			_unit setVelocity [(_xVel+_fXX),(_yVel+_fYY),((_vel select 2)+_zAcc)];
			_fXX = _fXX + _xxF; _fyy = _fyy + _yyF; _fzz = _fzz + _zzF; 
			sleep _leaner;
      	};
	// -- Opening vehicle
	{_x enableAI "MOVE";} forEach crew _unit;
	_unit lock false;
	};
sleep 2;
_densRad = 0;
};
};

// -- Aftershock (Cycle which counts with Heat and Radiation in time)
/*while {damage _unit < 1  or timeAfter < radTime} do
	{
	// -- Check if some unit did not got out of vehicle - !!!! not sure if works properly
	{
	if (!(_x in _unit)) then
		{
		if (!(_x in AllArray)) then
			{
			[_x,_pos,_kT,true] spawn ShockpushPreLoad;};
			AllArray = Allarray + [_x];
		};
	} forEach _crewInside;
	// -- Check for HeatDamage
	if (timeAfter <= heatTime) then
		{
		_heatRad = 20*(_coef^4/(_unit distance _pos)^4)*(cos(timeAfter/heatTime*180)+1)/2*3/4;
		};
	// -- Check of Fallout density in air
	_density = 0;

	// -- Check if is Unit in spreadAngle
	_xPos = ((_pos select 0) - (_pos select 0));
	_yPos = ((_pos select 1) - (_pos select 1));
	if (_xPos >= 0 and _yPos >= 0) then {_fi = 0};
	if (_xPos >= 0 and _yPos < 0) then {_fi = 270 + atan (abs(_xPos / _yPos));};
	if (_xPos < 0 and _yPos < 0) then {_fi = 180 + atan (abs(_yPos / _xPos));};
	if (_xPos < 0 and _yPos >= 0) then {_fi = 90 + atan (abs(_xPos / _yPos));};
	_lowerAngle = windAngle - spreadOrigin;
	if (_lowerAngle < 0) then {_lowerAngle = _lowerAngle + 360;};
	_upperAngle = windAngle - spreadOrigin;
	if (_upperAngle > 360) then {_lowerAngle = 360 - _lowerAngle;};
	
	if (_fi >= _lowerAngle and _fi <= _upperAngle and count CLOUD > 0 and fallTime > 0) then
	{
		{
            _xP = ((_pos select 0) - (_x select 0));
            _yP = ((_pos select 1) - (_x select 1));
            _dotDur = fallTime - (_x select 2);
            _pD = sqrt(_xP^2 + _yP^2);
            if (_pD < (61*(ln(_dotDur)+1))) then {_density = _density + floor (ln(_dotDur));};
        } forEach CLOUD;
	};
	_densRad = ((_density * sleepTime) / (_unit distance _pos)^2)*((cos(timeAfter/radTime*180)+1)/2);
	_radRad  = 10*(_coef^4/(_unit distance _pos)^4)*(cos(timeAfter/radTime*180)+1)/2*1/4;
	_unit setDamage (Damage _unit + _heatRad + _radRad + _densRad);

	/*	if ((isPlayer _unit) or (player in _unit)) then
			{
			hintSilent format ["Ground Zero Heat Damage\n%1\n\nGround Zero Radiation Damage\n%2\n\nFallout Cloud Radiation Damage\n%3\n\nDensity of Rad particles in air\n%4",
			_heatRad,_radRad,_densRad,_density];
			};
	*/
	
	/*if ((isPlayer _unit) or (player in _unit) and _density > 0) then
		{			
		}
	else
		{
		};
		///////////////////////////////	
	{_x setDamage  (Damage _x + (_heatRad + _radRad + _densRad)/ln(_coef / 3))} forEach crew _unit;
	if (_weakness1 != "") then {_unit setHit [_weakness1,((Damage _unit) + _dam + _heatDamage)];};
	if (_weakness2 != "") then {_unit setHit [_weakness2,((Damage _unit) + _dam + _heatDamage)];};
	if (_weakness3 != "") then {_unit setHit [_weakness3,((Damage _unit) + _dam + _heatDamage)];};

	sleep plus;
};