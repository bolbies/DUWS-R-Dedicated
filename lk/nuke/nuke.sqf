_pos = _this select 0;
_radius = _this select 1;

_markernuke = format["Killzone",round(_pos select 0),round(_pos select 1)]; // Define marker name
_markerstr = createMarker [str(_markernuke), _pos];
_markerstr setMarkerShape "ELLIPSE";
str(_markernuke) setMarkerBrush "SolidBorder";
str(_markernuke) setMarkerColor "ColorRed";
str(_markernuke) setMarkerSize [_radius, _radius];
str(_markernuke) setMarkerAlpha 0.5;

_markernuke1 = format["Blastzone",round(_pos select 0),round(_pos select 1)]; // Define marker name
_markerstr1 = createMarker [str(_markernuke1), _pos];
_markerstr1 setMarkerShape "ELLIPSE";
str(_markernuke1) setMarkerBrush "SolidBorder";
str(_markernuke1) setMarkerColor "ColorGrey";
str(_markernuke1) setMarkerSize [3000, 3000];
str(_markernuke1) setMarkerAlpha 0.5;

// create unit for comms
_group = createGroup west;
_unit = _group createUnit ["B_Soldier_SL_F", [0,0,0], [], 0, "FORM"];
_unit allowDamage false;

_unit sidechat format["This is Widow-maker, we are approaching the designated target area, ETA 1 minute"];
sleep 30;
_unit sidechat format["This is Widow-maker, ETA 30 seconds"];
sleep 30;
_unit sidechat format["This is Widow-maker, we have the target in visual, release in 15 seconds."];
sleep 15;
_unit sidechat format["Detonation in 10 seconds."];
sleep 10;

_kT = 1;

windAngle = 135;
heatWaveSpreadDistance = 0;
shockWaveSpreadDistance = 0;
radTime = (ln(_kT)+1) * 6666; // Endurance of Radiation time in air
heatTime = (ln(_kT)+1) * 167; // Endurance of Heat time in air
shockDistance = (ln(_kT)+1) * 3333; // How far will shockwave spread
heatDistance = (ln(_kT)+1) * 6666; // How far will heatwave spread
CLOUD = [];
nul = [] execVM "lk\nuke\nenvi.sqf";
ApertureDistance = ((ln(_kT)+1) * 4667);
if (ApertureDistance < 1) then {ApertureDistance = 1;};

//*******************************************************************
//*******************************************************************

_Wave = "#particlesource" createVehicle _pos;
_Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, (_kT^(1/5)*(10)), [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [(_kT^(1/3)*(40)),(_kT^(1/3)*(70))], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", _pos];
_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Wave setParticleCircle [50, [(_kT^(1/3)*(-68)), (_kT^(1/3)*(-68)), 2.5]];
_Wave setDropInterval 0.0002;

_Cone = "#particlesource" createVehicle _pos;
_Cone setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
				[0, 0, 0], 0, 1.275, 1, 0, [(_kT^(1/5)*20),(_kT^(1/5)*40)], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
				[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", _pos];
_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Cone setParticleCircle [(_kT^(1/5)*5), [-(_kT^(1/5)*5), -(_kT^(1/5)*5), (_kT^(1/5)*10)]];
_Cone setDropInterval 0.005;

_top = "#particlesource" createVehicle _pos;
_top setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 21, [0, 0, 0],
				[0, 0, (_kT^(1/5)*(65))], 0, 1.7, 1, 0, [(_kT^(1/3)*50),(_kT^(1/3)*40),(_kT^(1/3)*55)], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _pos];
_top setParticleRandom [0,[(_kT^(1/5)*(75/2)),(_kT^(1/5)*(75/2)),(_kT^(1/5)*(15/2))], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top setDropInterval 0.002;

_top2 = "#particlesource" createVehicle _pos;
_top2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 112, 0], "", "Billboard", 1, 22, [0, 0, 0],
				[0, 0, (_kT^(1/5)*(60))], 0, 1.7, 1, 0, [(_kT^(1/3)*50),(_kT^(1/3)*40),(_kT^(1/3)*50)], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", _pos];
_top2 setParticleRandom [0, [(_kT^(1/5)*(75/2)),(_kT^(1/5)*(75/2)),(_kT^(1/5)*(15/2))], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top2 setDropInterval 0.002;


_smoke = "#particlesource" createVehicle _pos;
_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, (_kT^(1/3)*(25)), [0, 0, 0],
				[0, 0, (_kT^(1/5)*(60))], 0, 1.7, 1, 0, [(_kT^(1/3)*(30)),(_kT^(1/3)*(10)),(_kT^(1/3)*(80))], 
				[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _pos];
_smoke setParticleRandom [0, [10, 10, 150], [(_kT^(1/3)*(6)),(_kT^(1/3)*(6)),(_kT^(1/5)*(1))], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_smoke setDropInterval 0.002;

_light = "#lightpoint" createVehicle [((_pos select 0)),(_pos select 1),((_pos select 2)+800)];
_light setLightAmbient[1500, 1200, 1000];
_light setLightColor[1500, 1200, 1000];
_light setLightBrightness 10.0;


//*******************************************************************
//*******************************************************************

deletemarker str(_markernuke);
deletemarker str(_markernuke1);
deleteVehicle _unit;

// Heatwave effect
[_pos,_kT] exec "lk\nuke\nuke_blast1_80kt.sqs";

if (player distance _pos < ApertureDistance) then {
// setup of overbrigtness since inpact
	OverShine = (((player distance _pos) / 1000)*15 - ((ln(_kT)+1) * 3));
	if (OverShine < 1) then {OverShine = 1;};
	if (OverShine > 40) then {OverShine = 40;};
	setaperture OverShine;

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0.5];
	"dynamicBlur" ppEffectCommit 0.5; //2

	sleep 0.3;

	"dynamicBlur" ppEffectAdjust [2];
	"dynamicBlur" ppEffectCommit 0.4; //1

	"dynamicBlur" ppEffectAdjust [1];
	"dynamicBlur" ppEffectCommit 0.5; //2
};
[_pos,_kT] execvm "lk\nuke\shockawe.sqf";
sleep 0.5;

// -- color correction into red blasted one
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.5],[1.2, 0.05, -0.12, 0.5],[0.2, 0.59, 0.11, 0]];
_hndl ppEffectCommit 4;

player spawn quake;

if (player distance _pos < 1000) then {playmusic "nuke2s";};
if (player distance _pos > 1000) then {playmusic "nuke1s";};

sleep 1;
setaperture -1;
_Wave setDropInterval 0.001;
sleep 1.9;
deletevehicle _top;
deletevehicle _top2;
sleep 2;

_top3 = "#particlesource" createVehicle _pos;
_top3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 24, [0, 0, (_kT^(1/5)*350)],
				[0, 0, (_kT^(1/5)*(49))], 0, 1.7, 1, 0, [(_kT^(1/2)*40),(_kT^(1/2)*50),(_kT^(1/2)*60)], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _pos];
_top3 setParticleRandom [0, [(_kT^(1/5)*(75/2)),(_kT^(1/5)*(75/2)),(_kT^(1/5)*15)], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top3 setDropInterval 0.002;

sleep 3;
deletevehicle _top3;

sleep 5;

// -- color correction into yellow aftershock one
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.6],[2.8, 2.5, 0.7, 0.4],[0.2, 0.59, 0.11, 0]];
_hndl ppEffectCommit 5;

if (player distance _pos < 4000) then {
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 1;
};

_top4 = "#particlesource" createVehicle _pos;
_top4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 22, [0, 0, (_kT^(1/5)*570)],
				[0, 0, (_kT^(1/5)*(30))], 0, 1.7, 1, 0, [(_kT^(1/2)*20),(_kT^(1/2)*40),(_kT^(1/2)*60)], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _pos];
_top4 setParticleRandom [0, [(_kT^(1/5)*(75/2)),(_kT^(1/5)*(75/2)),(_kT^(1/5)*15)], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top4 setDropInterval 0.002;

sleep 3;

//nul = [_pos] execVM "lk\nuke\radzone.sqf";
_top4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 25, [0, 0, (_kT^(1/5)*630)],
				[0, 0, (_kT^(1/5)*(30))], 0, 1.7, 1, 0, [(_kT^(1/2)*30),(_kT^(1/2)*40),(_kT^(1/2)*60)], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _pos];

_Wave setDropInterval 0.001*10;
_Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, (_kT^(1/5)*(10)), [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [(_kT^(1/3)*(40)),(_kT^(1/3)*(70))], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", _pos];
_Wave setParticleCircle [50, [(_kT^(1/3)*(-40)), (_kT^(1/3)*(-40)), 2.5]];

player spawn ash;
windv=true;
player spawn wind1;
30 setovercast 0.8;

deleteVehicle _light;

60 setRain 1;

sleep 4;

deletevehicle _top4;

//nul = [_pos,_kT,windAngle,true] execVM "lk\nuke\fallout_cloud.sqf";

// -- color correction into grey cold ash
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.8],[-0.09, 0.96, 2.63, 0.6],[0.4, 0.59, 0.11, 0]];
_hndl ppEffectCommit ((ln(_kT)+1)*120);

_i = 0;
while {_i < 100} do
	{
	_light setLightBrightness (100.0 - _i)/100;
	_i = _i + 1;
	sleep 0.1;
	};

	
for "_i" from 0 to 15 do {
	_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, (_kT^(1/3)*(25)), [0, 0, 0],
					[0, 0, (_kT^(1/5)*(55+_i))], 0, 1.7, 1, 0, [(_kT^(1/3)*(30)),(_kT^(1/3)*(10)),(_kT^(1/3)*(80))], 
					[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]]
					, [0.5, 0.1], 1, 1, "", "", _pos];
					
};

_timeNow = time;
waituntil {(time - _timeNow) > ((ln(_kT)+1)*300)};

_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, (_kT^(1/3)*(25)), [0, 0, 0],
				[0, 0, (_kT^(1/5)*(45))], 0, 1.7, 1, 0, [(_kT^(1/3)*(30)),(_kT^(1/3)*(15)),(_kT^(1/3)*(80))], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _pos];

_smoke setDropInterval 0.012;
_Cone setDropInterval 0.02;
_Wave setDropInterval 0.01;

sleep 10;
deleteVehicle _Wave;
deleteVehicle _smoke;
deletevehicle snow;
// -- color correction into almost origin
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.71],[0.48, 1.19, 0.4, 1.09],[0.2, 0.69, 0.11, 0]];
_hndl ppEffectCommit ((ln(_kT)+1)*280);

sleep (((ln(_kT)+1)*300)/ 3);
deleteVehicle _cone;
falloutDone = true;
sleep (2*((ln(_kT)+1)*300)/ 3);

"filmGrain" ppEffectEnable false;
sleep 10;
"colorCorrections" ppEffectEnable false;
sleep 10;
60 setovercast 0;
windv=false;

setwind [0,0,true];