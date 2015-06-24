_veh = "support\veh\";
_exec = 'player execVM "'+_veh+'%1"';

vehdropmenu = 
[
	["Vehicle Dropoff",true],
		["Hunter HMG", [2], "", -5, [["expression", format[_exec,"hunter.sqf"]]], "1", "1"],
		["AMV-7 Marshall", [3], "", -5, [["expression", format[_exec,"amv.sqf"]]], "1", "1"],
		["M2A4 Slammer UP", [4], "", -5, [["expression", format[_exec,"slammer.sqf"]]], "1", "1"],
		["Wingsuit", [5], "", -5, [["expression", format[_exec,"wingsuit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:vehdropmenu";