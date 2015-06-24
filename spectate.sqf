

RscSpectator_allowFreeCam = true; // Free cam
RscSpectator_hints = [true,true,true]; // Shows the controls as hint
    
setPlayerRespawnTime 9999;
str blu_hq_markername setMarkerColor "ColorOrange";
str blu_hq_markername setMarkerText "Main base **OFFICER KILLED**";
//blu_hq_markername = _markername; publicVariable "blu_hq_markername";

waitUntil {sleep 3;!alive player};

BIS_fnc_feedback_allowPP = false;         
cutRsc ["RscSpectator", "PLAIN"];
TitleText ["*** YOU ARE DEAD ***\nUSE SPACEBAR: Free Roam Camera\n- use H for help -", "PLAIN"];titleFadeOut 20;

waitUntil {sleep 3;{alive _x} count playableUnits == 0};
cutText ["", "PLAIN"];
titleFadeOut 1;
sleep 3;
[["officerandplayerskilled",true,true],"BIS_fnc_endMission"] call BIS_fnc_MP;

