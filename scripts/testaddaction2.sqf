_u1 = _this select 0;

_u1 addaction ["<t color='#99ff00'>Fix Unit</t>","scripts\test.sqf", "", 0, true, true, "", "_this == player"];
unitfix = u1 addEventHandler ["respawn",{u1 addaction ["<t color='#ffb700'>Vehicle Dropoff</t>","scripts\test2.sqf", "", 0, true, true, "", "_this == player"]}];