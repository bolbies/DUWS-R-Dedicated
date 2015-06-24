if (isServer) exitWith {};
waitUntil {weatherdone};
sleep 5;

if (!isServer) then{

0 setOvercast OvercastVar;
60 setFog FogVar;
setWind WindVar;
60 setRainbow RainbowVar;

sleep 1000;

while {true} do {

0 setOvercast OvercastVar;
60 setFog FogVar;
setWind WindVar;
60 setRainbow RainbowVar;

sleep 1300;
};
};