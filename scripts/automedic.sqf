// This script is bardosy's automedic script v1.0. The goal of this script is to free the player squad leader from micromanaging the medic.
// Use it only in player's squad medic if the player is the squad leader. It's a very simple script: if someone injured in the squad,
// he will stop and lay and the medic run for him to heal. When injured is healed, he can continue his way and the medic is return
// follow his leader.
// You can trun off the medic's group chat when you set _needradio variable to false.
// You can trun off the the possibility to player can turn the script off when you set _switchable variable to false.
// If you don't modify anything, the player can turn off this script in the action menu to activate "Automedic OFF". And then the
// player get a new action menu: Automedic ON. So he can turn back this script anytime.
// 
// Usage: 
// Copy the two sqf file into your mission's folder's scripts folder. If there is no scripts folder in your mission folder,
// create a new folder and name it "scripts" and copy the two files into it.
// You can run this script in several way. Eg. you can pu this line into init.sqf file:
// dummy = [med1, units (group player)] execVM "scripts\automedic.sqf";
// But in this case you have to name your medic to "med1".
// Or you can just copy this line into your medic's init field:
// dummy = [this, units (group player)] execVM "scripts\automedic.sqf";
// But don't do both. Run the scipt only once!


sleep 10;

player addeventhandler ["Respawn", {_this execVM "scripts\addActionAgain.sqf"}];

if (not isServer) exitWith{};

_medic = _this select 0;
_units = _this select 1;
if (count _this > 2) then {
	_medic = LCK_automedicmedic;
	_units = LCK_automedicunits;
};
_injured = objNull;
//if you want the medic groupChating, set this true. Else set it false;
_needradio = true;
//if medic is in the player's group and player is the squad leader, you can set this script to switchable: so player can switch off and switch back on, when he want.
_switchable = true;

//no need automedic if the medic is a player
if (isPlayer _medic) exitWith{};

//init to switch off automedic
if (_switchable) then {
	if (count _this > 2) then {
		(leader group _medic) removeAction LCK_automedicaction;
	};
	LCK_automedicaction = (leader group _medic) addAction ["Automedic OFF", "scripts\automedicoff.sqf", [], 1, false, true, "", "true"];
	LCK_automedicmedic = _medic;
	LCK_automedicunits = _units;
	LCK_automedicexit = false;
};

//main loop
while {alive _medic and (not LCK_automedicexit)} do {
	if(LCK_automedicexit) exitWith{};
	sleep 2;
	//waiting for a wounded
	while {(isNull _injured) and (alive _medic)} do {
		//if the medic is injured
		if (getDammage _medic > 0.1) then {
			//if medic is already dead, then exit
			if (!alive _medic) exitWith{};
			//else he is the injured and he is a priority to heal himself
			_injured = _medic;
		} else {
			_deads = [];
			{
				if (!alive _x or isNull _x) then {
					_deads = _deads + [_x];
				};
				if ((isNull _injured) and (getDammage _x > 0.1) and (alive _x) and (!isNull _x)) then {			
					_injured = _x;
					if (_needradio) then {_medic groupChat format["Keep calm %1, I will heal you.", (name _injured)];};
				};
			} foreach _units;
			_units = _units - _deads;
			LCK_automedicunits = _units;
		};
		sleep 5;
		if(LCK_automedicexit) exitWith{};
	};

	if(LCK_automedicexit or (!alive _medic)) exitWith{};
	
	//we have an injured, stop him
	if ((!isPlayer _injured) and (_medic!=_injured)) then {
		_injured disableAI "MOVE";
		_injured setUnitPos "down";
	};
	if (_medic!=_injured) then {
		//medic go for him
		_medic doMove (position _injured);
		while {(_medic distance _injured > 3) and (alive _injured) and (!isNull _injured)} do {		
			sleep 1;
			_medic doMove (position _injured);
			if(LCK_automedicexit or (!alive _medic)) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};
		};
	};
	
	if(LCK_automedicexit or (!alive _medic)) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};
	
	//when medic is close enough to the injured...
	//...and injured is still alive
	if ((alive _injured) and (!isNull _injured) and (alive _medic) and (!LCK_automedicexit)) then {	
		//stop the medic
		_medic disableAI "MOVE";
		_medic setUnitPos "middle";
		sleep 1;
		//HEAL the injured
		// ******************************
		_injured action ["Heal", _medic];
		// ******************************

		//wait until injured is healed or dead
		waitUntil { (getDammage _injured < 0.1) or (!alive _injured) };
		sleep 3;
		if (_medic!=_injured) then {
			if (_needradio) then {_medic groupChat format["OK %1, you are ready to fight.", (name _injured)];};
		};
		
		//healed soldier is ready to fight
		_injured enableAI "MOVE";
		_injured setUnitPos "auto";
	};
	//we are ready for looking a new injured
	_injured = objNull;
	//set the medic to ready to looking for a new injured
	_medic enableAI "MOVE";
	_medic setUnitPos "auto";
	//doMove stops the medic, so we have to command him to follow his leader
	_medic doFollow (leader group _medic);
	
	if(LCK_automedicexit or (!alive _medic)) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};

};

if (not alive _medic) then {
	(leader group _medic) removeAction LCK_automedicaction;
};
if (not(isNull _injured)) then {
	_injured enableAI "MOVE";
	_injured setUnitPos "auto";
};