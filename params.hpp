class Params {
	class Revive {
		title = "Revive";
		values[] = {0,1,2};
		texts[] = {"REVIVE OFF","REVIVE ON (Only Humans Can Revive)","REVIVE ON (Humans + AI Can Revive)"};
		default = 0;
	};
	class DeatPenalty {
		title = "CP death penalty";
		values[] = {1,2,3,4,5,6,7,8,9,10,0};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","No penalty"};
		default = 1;
	};
	class PlayerFatigue {
		title = "Player Fatigue";
		values[] = {0,1};
		texts[] = {"Disable Fatigue","Enable Fatigue"};
		default = 0;
	};
	class TimeOfDay {
        title = "Time of Day:";
        values[] = {5,14,19,23};
        texts[] = {"Dawn","Afternoon","Dusk","Evening"};
        default = 14;
    };

	class AttackHelis {
        title = "Attack Aircraft:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 0;
    };

	class TrkAllPlayers {
        title = "Show Player Markers on Map:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    };

    class WarcomLimiter {
        title = "DUWS AI Limiter (leave enabled for improved fps):";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 0;
    };

    class IedBomb {
        title = "Random Roadside IED's:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled (*initialization lag at mission start is normal)"};
        default = 0;
    };

    class SirenWarn {
        title = "Enemy Warning Siren:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    };

   class MisEnd {
        title = "Mission Win/Lose Condition:";
        values[] = {0,1};
        texts[] = {"Cap All Zones/Officer Killed","Cap All Zones/Officer & Players Killed"};
        default = 0;
    };

   class ZbeCache {
        title = "Zbe Cache status:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 0;
    };
}
