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
if (_unit isKindOf "Car") then {_coef = 140; _lenght = 4.5; _height = 1.3; _width = 1.6; _weight = 800; _steel = 2; _weakness1 = "kola"; _weakness2 = "svetla";};/*
	if (_unit isKindOf "Bus") then {_coef = 140;  _lenght = 10; _height = 3; _width = 2.5; _weight = 5800;};
	if (_unit isKindOf "HMMWV_Base") then {_coef = 140; _lenght = 4.6; _height = 1.8; _width = 1.8; _weight = 2340; _steel = 4;};
	if (_unit isKindOf "SUV_Base_EP1") then {_coef = 140; _lenght = 4.8; _height = 1.7; _width = 1.8; _weight = 2340;};
	if (_unit isKindOf "ArmoredSUV_Base_PMC") then {_coef = 140; _lenght = 4.8; _height = 1.7; _width = 1.8; _weight = 2540; _steel = 4; _weakness1 = "zbran"; _weakness2 = "svetla";};
	if (_unit isKindOf "Lada_base") then {_coef = 140; _lenght = 4.0; _height = 1.3; _width = 1.6; _weight = 800;};
	if (_unit isKindOf "Offroad_DSHKM_base") then {_coef = 140; _lenght = 4.12; _height = 1.8; _width = 1.64; _weight = 800;};
	if (_unit isKindOf "Pickup_PK_base") then {_coef = 140; _lenght = 4.1; _height = 1.8; _width = 1.6; _weight = 1000;};
	if (_unit isKindOf "LandRover_Base") then {_coef = 140; _lenght = 4.1; _height = 1.8; _width = 1.6; _weight = 1500;};		
	if (_unit isKindOf "SkodaBase") then {_coef = 140; _lenght = 4.16; _height = 1.4; _width = 1.595; _weight = 800;};
	if (_unit isKindOf "tractor") then {_coef = 140; _lenght = 3.67; _height = 2.71; _width = 1.91; _weight = 3740;};
	if (_unit isKindOf "Truck") then {_coef = 140; _lenght = 7.35; _height = 3.09; _width = 2.40; _weight = 10210; _steel = 3;};
	if (_unit isKindOf "MAZ_543_SCUD_Base_EP1") then {_coef = 120; _lenght = 12.35; _height = 4.09; _width = 3.80; _weight = 16300; _steel = 4;};
	if (_unit isKindOf "ATV_Base_EP1") then {_coef = 140; _lenght = 2.12; _height = 1.09; _width = 1.20; _weight = 100;};
	if (_unit isKindOf "UAZ_Base") then {_coef = 140; _lenght = 4.02; _height = 2.05; _width = 1.78; _weight = 1650;};
	if (_unit isKindOf "Wheeled_APC") then {_coef = 140; _lenght = 5.50; _height = 2.35; _width = 2.30; _weight = 5300; _steel = 8; _weakness1 = "kanon"; _weakness2 = "elektronika";};
	if (_unit isKindOf "Motorcycle") then {_coef = 150; _lenght = 1.33; _height = 0.83; _width = 0.3; _weight = 105;};*/
if (_unit isKindOf "Tank") then {_coef = 120; _lenght = 9.82; _height = 2.72; _width = 3.79; _weight = 48200; _steel = 10; _weakness1 = "pasy"; _weakness2 = "kanon"; _weakness3 = "elektronika";};/*
	if (_unit isKindOf "2S6M_Tunguska") then {_coef = 120; _lenght = 9.82; _height = 2.72; _width = 3.79; _weight = 48200;};
	if (_unit isKindOf "APC") then {_coef = 120; _lenght = 5.50; _height = 2.35; _width = 2.30; _weight = 5300; _steel = 8;};
	if (_unit isKindOf "StrykerBase_EP1") then {_coef = 120; _lenght = 6.95; _height = 2.64; _width = 2.72; _weight = 24000; _steel = 8;};
	if (_unit isKindOf "Tracked_APC") then {_coef = 120; _lenght = 7.94; _height = 3.26; _width = 3.27; _weight = 29100; _steel = 9;};
	if (_unit isKindOf "M1A1") then {_coef = 120; _lenght = 7.93; _height = 2.4; _width = 3.66; _weight = 61300; _steel = 11;};
	if (_unit isKindOf "M2A2_Base") then {_coef = 120; _lenght = 6.55; _height = 2.98; _width = 3.60; _weight = 27600;};
	if (_unit isKindOf "T34") then {_coef = 120; _lenght = 6.68; _height = 2.45; _width = 3.00; _weight = 26500; _steel = 7;};
	if (_unit isKindOf "T72_Base") then {_coef = 120; _lenght = 6.95; _height = 2.23; _width = 3.59; _weight = 41500;};
	if (_unit isKindOf "T90") then {_coef = 120; _lenght = 9.53; _height = 2.22; _width = 3.78; _weight = 46500; _steel = 11;};
	if (_unit isKindOf "ZSU_Base") then {_coef = 120; _lenght = 6.53; _height = 2.57; _width = 3.12; _weight = 16000;};
	if (_unit isKindOf "MLRS_base") then {_coef = 120; _lenght = 6.85; _height = 2.59; _width = 2.97; _weight = 24950; _steel = 6; _weakness1 = "pasy"; _weakness2 = "elektronika";};*/
if (_unit isKindOf "Man") then {_coef = 180; _lenght = 0.30; _height = 1.77; _width = 0.40; _weight = 120; _steel = 1; _weakness1 = "ruce"; _weakness2 = "nohy";};/*
	if (_unit isKindOf "Cow") then {_coef = 180; _lenght = 3.03; _height = 1.45; _width = 0.5; _weight = 1750; _steel = 4; _weakness1 = "ruce"; _weakness2 = "nohy";};
	if (_unit isKindOf "Goat") then {_coef = 200; _lenght = 1.53; _height = 0.70; _width = 0.4; _weight = 280;};
	if (_unit isKindOf "Hen") then {_coef = 280; _lenght = 0.30; _height = 0.37; _width = 0.18; _weight = 23.5;};
	if (_unit isKindOf "Rabbit") then {_coef = 280; _lenght = 0.43; _height = 0.27; _width = 0.22; _weight = 212;};
	if (_unit isKindOf "Sheep") then {_coef = 180; _lenght = 1.53; _height = 0.70; _width = 0.4; _weight = 280;};
	if (_unit isKindOf "WildBoar") then {_coef = 180; _lenght = 1.23; _height = 0.90; _width = 0.42; _weight = 270;};
	if (_unit isKindOf "CAManBase") then {_coef = 180; _lenght = 0.35; _height = 1.77; _width = 0.5;};*/
if (_unit isKindOf "Air") then {_coef = 150; _lenght = 18.00; _height = 4.5; _width = 2.5; _weight = 4000; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "motor";};/*
	if (_unit isKindOf "AH1_Base") then {_coef = 150; _lenght = 14.20; _height = 3.12; _width = 2.00; _weight = 3550; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "AH64_base_EP1") then {_coef = 150; _lenght = 14.73; _height = 2.87; _width = 2.00; _weight = 8000; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "AW159_Lynx_BAF") then {_coef = 150; _lenght = 12.24; _height = 2.73; _width = 1.50; _weight = 4300; _steel = 3; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "BAF_Merlin_HC3_D") then {_coef = 150; _lenght = 18.81; _height = 5.65; _width = 2.50; _weight = 11550; _steel = 5; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "Ka60_GL_BASE_PMC") then {_coef = 150; _lenght = 11.50; _height = 3.93; _width = 1.80; _weight = 9800; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "Mi17_base") then {_coef = 150; _lenght = 15.46; _height = 3.76; _width = 2.55; _weight = 11100; _steel = 5; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "Mi24_Base") then {_coef = 150; _lenght = 14.50; _height = 5.20; _width = 1.65; _weight = 9800; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "UH1Y") then {_coef = 150; _lenght = 13.78; _height = 3.50; _width = 1.80; _weight = 6660; _steel = 3; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "UH1H_base") then {_coef = 150; _lenght = 13.40; _height = 3.39; _width = 1.80; _weight = 3600; _steel = 3; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "UH60_Base") then {_coef = 150; _lenght = 14.76; _height = 4.13; _width = 1.36; _weight = 9980; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "UH60M_US_base_EP1") then {_coef = 150; _lenght = 14.76; _height = 4.13; _width = 1.36; _weight = 9980; _steel = 4; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "CH47_base_EP1") then {_coef = 150; _lenght = 25.1; _height = 4.70; _width = 2.36; _weight = 12100; _steel = 6; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};
	if (_unit isKindOf "AH6_Base_EP1") then {_coef = 150; _lenght = 7.80; _height = 2.00; _width = 0.9; _weight = 980; _steel = 2; _weakness1 = "elektronika"; _weakness2 = "mala vrtule";};		 
	if (_unit isKindOf "ParachuteBase") then {_coef = 180; _lenght = 3.00; _height = 2.00; _width = 3.00; _weight = 95; _steel = 1; _weakness1 = "padak"; _weakness2 = "";};
	if (_unit isKindOf "A10") then {_coef = 150; _lenght = 13.26; _height = 3.47; _width = 3.8; _weight = 13782; _weakness3 = "kridlo";};
	if (_unit isKindOf "AV8B2") then {_coef = 150; _lenght = 12.12; _height = 2.55; _width = 3.2; _weight = 10410; _weakness3 = "kridlo";};
	if (_unit isKindOf "BIS_Steerable_Parachute") then {_coef = 150; _lenght = 2.00; _height = 2.00; _width = 2.00; _weight = 95; _steel = 1; _weakness1 = "padak"; _weakness2 = "";};
	if (_unit isKindOf "C130J") then {_coef = 150; _lenght = 25.79; _height = 9.84; _width = 8.00; _weight = 40000; _steel = 6; _weakness3 = "kridlo";};
	if (_unit isKindOf "F35_base") then {_coef = 150; _lenght = 12.67; _height = 3.33; _width = 5.3; _weight = 22470; _weakness3 = "kridlo";};
	if (_unit isKindOf "MV22") then {_coef = 150; _lenght = 15.50; _height = 4.73; _width = 8.00; _weight = 18000; _weakness3 = "kridlo";};
	if (_unit isKindOf "Su25_base") then {_coef = 150; _lenght = 13.33; _height = 3.80; _width = 7.00; _weight = 16990; _weakness3 = "kridlo";};
	if (_unit isKindOf "Su34") then {_coef = 150; _lenght = 20.34; _height = 5.09; _width = 8.00; _weight = 39000; _weakness3 = "kridlo";};
	if (_unit isKindOf "An2_Base_EP") then {_coef = 150; _lenght = 10.40; _height = 3.1; _width = 8.10; _weight = 4900; _steel = 2; _weakness3 = "kridlo";};
	if (_unit isKindOf "MQ9PredatorB") then {_coef = 150; _lenght = 10.00; _height = 1.60; _width = 6.00; _weight = 3500; _steel = 3; _weakness3 = "kridlo";};
	if (_unit isKindOf "Ka137_Base_PMC") then {_coef = 150; _lenght = 1.00; _height = 1.00; _width = 1.00; _weight = 80; _steel = 2;};
	if (_unit isKindOf "Pchela1T") then {_coef = 150; _lenght = 1.78; _height = 1.05; _width = 1.2; _weight = 138; _steel = 2; _weakness3 = "kridlo";};		*/
if (_unit isKindOf "StaticWeapon") then {_coef = 10; _lenght = 1.05; _height = 1.07; _width = 1.00; _weight = 100; _steel = 4;};
if (_unit isKindOf "Ship") then {_coef = 100; _lenght = 5.35; _height = 3.27; _width = 2.5; _weight = 395; _steel = 3;};
if (_unit isKindOf "Thing") then {_coef = 10;};
if (_unit isKindOf "Building") then {_coef = 8;};
if (_unit isKindOf "Strategic") then {_coef = 5;};
if (_unit isKindOf "Nonstrategic") then {_coef = 5;};

_rad = _unit distance _pos;

// -- Sound of Vehicle shaking after Explosion
if ((isPlayer _unit) or (player in _unit) and ((_unit distance _pos) < ((ln(_kT)+1) * 4500))) then
{
	if (_coef != 180) then
	{
		if (player distance _pos < ((ln(_kT)+1) * 800)) then {_intenzity = "Close";};
		if (player distance _pos >= ((ln(_kT)+1) * 800) and player distance _pos < ((ln(_kT)+1) * 2000)) then {_intenzity = "Standard";};
		if (player distance _pos >= ((ln(_kT)+1) * 2000) and player distance _pos < ((ln(_kT)+1) * 4500)) then {_intenzity = "Far";};
		_SoundTurbolence = "interiorTurbolance"+_intenzity;
		playmusic _SoundTurbolence;
	};
};

_soundPos = "Land_HelipadEmpty_F" createVehicle _pos;

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

	// Sound of HeatWave impact to a unit or vehicle
	if ((isPlayer _unit) or (player in _unit) and ((_unit distance _pos) < ((ln(_kT)+1) * 4500)) and (heatWaveSpreadDistance < heatDistance)) then
		{
		if (_coef == 180) then {_material = "Body";} else {_material = "Metal";};
		if ((player distance _pos) < ((ln(_kT)+1) * 800)) then {_intenzity = "Close";};
		if (((player distance _pos) >= ((ln(_kT)+1) * 800)) and (player distance _pos) < ((ln(_kT)+1) * 2000)) then {_intenzity = "Standard";};
		if (((player distance _pos) >= ((ln(_kT)+1) * 2000)) and (player distance _pos) < ((ln(_kT)+1) * 4500)) then {_intenzity = "Far";};
		_Sound = "impact"+_material+"Soft"+_intenzity;
		if (player distance _pos < ((ln(_kT)+1) * 4500)) then { playmusic _Sound;};
		};

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
if (_unit distance _soundPos < ln(10000 - shockWaveSpreadDistance)*21) then {
if (player distance _pos < ((ln(_kT)+1) * 800)) then {_intenzity = "Close";};
if (player distance _pos >= ((ln(_kT)+1) * 800) and player distance _pos < ((ln(_kT)+1) * 2000)) then {_intenzity = "Standard";};
if (player distance _pos >= ((ln(_kT)+1) * 2000) and player distance _pos < ((ln(_kT)+1) * 4500)) then {_intenzity = "Far";};
_SoundWave = "shockwave"+_intenzity;
if (player distance _pos < ((ln(_kT)+1) * 4500)) then { playmusic _SoundWave; playmusic "rhumble";};
};
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
	
// -- Sound of ShockWave impact to a unit or vehicle
if ((isPlayer _unit) or (player in _unit)and(_unit distance _pos < ((ln(_kT)+1) * 4500))and(shockWaveSpreadDistance < shockDistance)) then {
if (player distance _pos < ((ln(_kT)+1) * 800)) then {_intenzity = "Close";};
if (player distance _pos >= ((ln(_kT)+1) * 800) and player distance _pos < ((ln(_kT)+1) * 2000)) then {_intenzity = "Standard";};
if (player distance _pos >= ((ln(_kT)+1) * 2000) and player distance _pos < ((ln(_kT)+1) * 4500)) then {_intenzity = "Far";};
_Sound = "impact"+_material+"Hard"+_intenzity;
if (player distance _pos < ((ln(_kT)+1) * 4500)) then { playmusic _Sound;};
deleteVehicle _soundPos;
};

[_pos,_kT] spawn StaticPreLoad;

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