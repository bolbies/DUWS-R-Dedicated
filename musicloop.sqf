_loop = true;

waitUntil {chosen_settings};
sleep 1800;

while {_loop} do  
{
waitUntil {sleep 120;daytime < 1 or daytime > 2};
playmusic "wasteland";

waitUntil {sleep 120;daytime > 2};
playmusic "fallout";

waitUntil {sleep 120;daytime > 4};
playmusic "Track11_StageB_stealth";

waitUntil {sleep 120;daytime > 7};
playMusic "Track09_Night_percussions";

waitUntil {sleep 120;daytime > 9};
playMusic "BackgroundTrack01a_F";

waitUntil {sleep 120;daytime > 12};
playMusic "LeadTrack01_F_EPA";



waitUntil {sleep 120;daytime > 16};
playMusic "LeadTrack02_F";
};





 