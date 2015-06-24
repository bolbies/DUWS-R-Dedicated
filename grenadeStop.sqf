/*
	Based on GrenadeStop v0.8 for ArmA 3 Alpha by Bake
	Modified for DUWS by Bigshot
	
	DESCRIPTION:
	Stops players from throwing grenades in safety zones.
	
	INSTALLATION:
	Move grenadeStop.sqf to your mission's folder. Then add the
	following line to your init.sqf file (create one if necessary):
	execVM "grenadeStop.sqf";
	
	CONFIGURATION:
	Edit the #defines below.
*/

#define SAFETY_ZONES	[["respawn_west", 50]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE			"Player explosives are not allowed within 50m of HQ!"
						
//_mylist = ["HandGrenadeMuzzle"]

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if (_this select 2 == "HandGrenadeMuzzle" || _this select 2 == "MiniGrenadeMuzzle" || _this select 2 == "DIrectionalMineRemoteMuzzle" || _this select 2 == "DemoChargeMuzzle" || _this select 2 == "PipeBombMuzzle" || _this select 2 == "ClassicMineWireMuzzle" || _this select 2 == "DirectionalMineRangeMuzzle" || _this select 2 == "BoundingMineRangeMuzzle" || _this select 2 == "ClassicMineRangeMuzzle" || _this select 2 == "MineMuzzle") then
	{
		// Lazy evaluation now supported by default? Curly brackets not working.
		
		if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
		{
			deleteVehicle (_this select 6);
			titleText [MESSAGE, "PLAIN", 3];
		};
	};
}];
