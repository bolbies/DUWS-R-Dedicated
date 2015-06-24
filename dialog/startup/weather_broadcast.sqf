sleep 10; // make sure the weather is init

while {true} do {
OvercastVar = Overcast;
publicVariable "OvercastVar";

FogVar = fogParams;
publicVariable "FogVar";

RainVar = Rain;
publicVariable "RainVar";

WindVar = Wind;
publicVariable "WindVar";
sleep 900;
};