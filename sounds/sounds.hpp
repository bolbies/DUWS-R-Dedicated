class CfgSounds
{
	sounds[] = {};
	class radiochatter2
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "radiochatter2";
		// filename, volume, pitch
		sound[] = {"sounds\radiochatter2.ogg", 1, 1};
		titles[] = {};
	};
	class radiochatter4
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "radiochatter4";
		// filename, volume, pitch
		sound[] = {"sounds\radiochatter4.ogg", 1, 1};
		titles[] = {};
	};	
	class loadgun
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "loadgun";
		// filename, volume, pitch
		sound[] = {"sounds\support\loadgun.ogg", 1, 1};
		titles[] = {};
	};	
	class boots
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "boots";
		// filename, volume, pitch
		sound[] = {"sounds\support\boots.ogg", 2, 1};
		titles[] = {};
	};
   class siren
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "siren";
		// filename, volume, pitch
		sound[] = {"sounds\Siren.ogg", db-15, 1};
		titles[] = {};
	};	
    
	class Vent {name="Vent";sound[]={ATM_Airdrop\data\vent.ogg,db-11,1.0};titles[] = {};};
	class Para {name="Para";sound[]={ATM_Airdrop\data\parachute.ogg,db-11,1.0};titles[] = {};};
	class Vent2 {name="Vent2";sound[]={ATM_Airdrop\data\vent2.ogg,db-11,1.0};titles[] = {};};
	class flapping	{sound[] = {"COB_HALO\sounds\flapping.ogg", 10, 1};titles[] = {};};
	class open_chute {sound[] = {"COB_HALO\sounds\open_chute.ogg", 10, 1};titles[] = {};};
	class para_pilot {sound[] = {"COB_HALO\sounds\para_pilot.ogg", 10, 1};titles[] = {};};
	
	
	// Definition for each sound
	class radiom1
	{
		name = "radiomorse"; // Name for mission editor
		sound[] = {sounds\RADIO.ogg, 0.4, 1.0};
		titles[] = {0, ""};
	};	
};