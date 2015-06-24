private ["_fallPos","_kT","_ni","_stableA","_cloudCA","_cloudA","_markerA","_marksA","_marksCA","_Step","_stepX","_stepY",
"_markerName","_marker","_cA","_spreadChance","_deviation","_direction","_dev","_dots","_stepper","_blend","_markAdd"
];

_fallPos = _this select 0;  			// centre of explosion
_kT = _this select 1;				// Power of Nuke in kT
_ni = _this select 2;
_dots = _this select 3;

spreadAngle = 80;
spreadOrigin = spreadAngle;
_direction = _ni;
if (spreadAngle < 30) then {spreadAngle = 30;};
if (spreadAngle > 90) then {spreadAngle = 90;};

falloutDone = false;
fallTime = 0;
sleepTime = 20;					// Intensity of Dots creating cloud - lower means higher intensity

_stepper = sleepTime * 10;
_blend = 1;
_blending = _kT * 10000 / sleepTime;
						// Global array of only coordinates
_cloudA = [];			// array of active spreading waves in air
_cloudCA = [];			// Only checking array
_stableA = [];			// array of passive waves in air

_markerA = [];			// array of One single marker Dot on map
_marksA = [];			// array of All markers in One certain wave
_marksCA = [];			// Only checking array

_fallPos = [position _fallPos select 0,position _fallPos select 1];

_Step = _stepper + random _stepper;
_ni = _ni -(10 - random 20);
_stepX = cos _ni * _Step;
_stepY = sin _ni * _Step;
_fallPos = [(_fallPos select 0) + _stepX,(_fallPos select 1) + _stepY];

if (_dots) then
	{
	_markerName = (format ["fallout_%1",markerFalloutCounter]);
	_marker = createMarker [_markerName, _fallPos];
	_marker setMarkerShape "Icon";
	_marker setMarkerType "Dot";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerAlpha _blend; 
	};

markerFalloutCounter = markerFalloutCounter + 1;

_markerA = [markerFalloutCounter,_fallPos,_ni];
_markAdd = [_fallPos select 0,_fallPos select 1,fallTime];
CLOUD = CLOUD + [_markAdd];
_marksA = _marksA + [_markerA];
_cloudA = _cloudA + [_marksA];

sleep sleepTime;

while {_blend > 0 or !falloutDone} do
	{
	spreadAngle = spreadAngle - (1 / _kT);
	if (spreadAngle < 10) then {spreadAngle = 10;};
	_blend = (1- markerFalloutCounter / _blending);
	_cloudCA = _cloudA;
	_cloudA = [];
	_cA = 0;

	while {_cA < (count _cloudCA)} do
		{
		_marksA = _cloudCA select _cA;
		_markerA = _marksA select ((count _marksA)-1);
		_ni = _markerA select 2;
		_Step = _stepper + random _stepper;
		
		_dev = (10 - random 20);
		_deviation = _ni + _dev;
		if ((_deviation > (_direction + spreadAngle)) or (_deviation < (_direction - spreadAngle))) then
			{
			_dev = - _dev;
			};
		_ni = _ni + _dev;
			
		_stepX = cos _ni * _Step;
		_stepY = sin _ni * _Step;
		_fallPos = _markerA select 1;
		_fallPos = [(_fallPos select 0) + _stepX,(_fallPos select 1) + _stepY];
		if (_dots) then
			{
			_markerName = (format ["fallout_%1",markerFalloutCounter]);
			_marker = createMarker [_markerName, _fallPos];
			_marker setMarkerShape "Icon";
			_marker setMarkerType "Dot";
			_marker setMarkerColor "ColorRed";
			_marker setMarkerAlpha _blend; 
			};
		markerFalloutCounter = markerFalloutCounter + 1;

		_markerA = [markerFalloutCounter,_fallPos,_ni];
		_markAdd = [_fallPos select 0,_fallPos select 1,fallTime];
		CLOUD = CLOUD + [_markAdd];
		_marksA = _marksA + [_markerA];
		_cloudA = _cloudA + [_marksA];

		_cA = _cA + 1;

// -- random furcation of Fallout cloud
		_spreadChance =  ceil random 100;
		if (_spreadChance < (spreadAngle - 2 * (count _cloudCA))) then
			{
			_marksA = [];
			_Step = _stepper + random _stepper;
			_plusMinus = random ceil 2;
			_dev = (20 + random 15);

			if (_plusMinus == 1) then
				{
				_dev = _dev;
				}
			else
				{
				_dev = - _dev;
				};
		
			_deviation = _ni + _dev;
		if ((_deviation > (_direction + spreadAngle)) or (_deviation < (_direction - spreadAngle))) then
			{
			_dev = - _dev;
			};
			_ni = _ni + _dev;

			_stepX = cos _ni * _Step;
			_stepY = sin _ni * _Step;
			_fallPos = [(_fallPos select 0) + _stepX,(_fallPos select 1) + _stepY];
			if (_dots) then
				{
				_markerName = (format ["fallout_%1",markerFalloutCounter]);
				_marker = createMarker [_markerName, _fallPos];
				_marker setMarkerShape "Icon";
				_marker setMarkerType "Dot";
				_marker setMarkerColor "ColorRed";
				_marker setMarkerAlpha _blend; 
				};
			markerFalloutCounter = markerFalloutCounter + 1;

			_markerA = [markerFalloutCounter,_fallPos,_ni];
			_markAdd = [_fallPos select 0,_fallPos select 1,fallTime];
			CLOUD = CLOUD + [_markAdd];
			
			_marksA = _marksA + [_markerA];
			_cloudA = _cloudA + [_marksA];
			};
		};
	sleep sleepTime;
	fallTime = fallTime + sleepTime;
};

waitUntil {falloutDone};


