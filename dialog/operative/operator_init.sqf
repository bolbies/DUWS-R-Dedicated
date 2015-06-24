duws_operator_list=[[1,1,1,1,1,1,"Scout","Ready","Matthew 'Ghost' Norton","ghost","B_recon_F","H_Shemag_olive_hs",0,50],
[1,1,1,1,1,1,"Rifleman","Ready","Tyler Adams","adams","B_Soldier_F","H_Cap_oli_hs",0,50],
[1,1,1,1,1,1,"AT Rifleman","Ready","John Campbell","campbell","B_soldier_LAT_F","H_HelmetB_camo",0,50],
[1,1,1,1,1,1,"Medic","Ready","Julian 'Jester' Foote","jester","B_medic_F","H_HelmetB_grass",0,50],
[1,1,1,1,1,1,"Machinegunner","Ready","Ryan Armstrong","armstrong","B_CTRG_soldier_AR_A_F","H_Beret_02",0,50],
[1,1,1,1,1,1,"Sniper","Ready","Darnell Sykes","sykes","B_sniper_F","H_Booniehat_khk",0,50],
[1,1,1,1,1,1,"Team leader","Ready","James O'Connor","oconnor","B_Soldier_TL_F","H_MilCap_ocamo",0,50],
[1,1,1,1,1,1,"Grenadier","Ready","Nick 'Viper' Mundy","viper","B_Soldier_GL_F","H_Booniehat_khk_hs",0,50],
[1,1,1,1,1,1,"Engineer","Ready","Martin 'Frost' Moore","frost","B_CTRG_soldier_engineer_exp_F","H_Watchcap_blk",0,50],
[1,1,1,1,1,1,"Medic","Ready","Chris Hawkins","hawkins","B_CTRG_soldier_M_medic_F","H_HelmetB_camo",0,50],
[1,1,1,1,1,1,"Marksman","Ready","Alex Taylor","taylor","B_soldier_M_F","H_Watchcap_blk",0,50],
[1,1,1,1,1,1,"AT Specialist","Ready","Arnold Patterson","patterson","B_soldier_AT_F","H_HelmetB",0,50],
[1,1,1,1,1,1,"Rifleman","Ready","Marcus Lopez","lopez","B_Soldier_F","H_Booniehat_mcamo",0,50],
[1,1,1,1,1,1,"Machinegunner","Ready","Adam Reynolds","reynolds","B_soldier_AR_F","H_Cap_headphones",0,50],
[1,1,1,1,1,1,"AA Specialist","Ready","Andrew Levine","levine","B_soldier_AA_F","H_HelmetB_camo",0,50],
[1,1,1,1,1,1,"Grenadier","Ready","Hines McKendrick","mckendrick","B_Story_Protagonist_F","H_Cap_tan_specops_US",0,50],
[1,1,1,1,1,1,"Saboteur","Ready","Sean 'Snake' Vincent","snake","B_recon_exp_F","H_MilCap_ocamo",0,50],
[1,1,1,1,1,1,"Squad leader","Ready","Darryl Franklin","franklin","B_Soldier_SL_F","H_Beret_02",0,50],
[1,1,1,1,1,1,"Spotter","Ready","Julian 'Fox' Warren","fox","B_spotter_F","H_Beret_red",0,50],
[1,1,1,1,1,1,"Repair specialist","Ready","Samuel Martinez","martinez","B_soldier_repair_F","H_HelmetB",0,50],
[1,1,1,1,1,1,"AT Rifleman","Ready","Mike 'Stranger' Sanders","stranger","B_CTRG_soldier_GL_LAT_F","H_Booniehat_khk_hs",0,50],
[1,1,1,1,1,1,"Marksman","Ready","Charles Dixon","dixon","B_recon_M_F","H_Shemag_olive_hs",0,50]];

/*
0: aim
1: reflexes
2: spotting
3: courage
4: communications
5: reload speed
6: role
7: status (always "Ready")
8: name
9: CfgIdentity class
10: soldier class
11: hat
12: time before heal
13: available spendable points
*/

// init functions for adding skills
DUWS_operator_add_aim = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_aim = _selected_soldier select 0;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_aim >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_aim_new = _selected_soldier_aim + 0.01; // update the variable
	_selected_soldier set [0,_selected_soldier_aim_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};
	
DUWS_operator_add_reflexes = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_reflexes = _selected_soldier select 1;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_reflexes >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_reflexes_new = _selected_soldier_reflexes + 0.01; // update the variable
	_selected_soldier set [1,_selected_soldier_reflexes_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};	
	
DUWS_operator_add_spotting = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_spotting = _selected_soldier select 2;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_spotting >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_spotting_new = _selected_soldier_spotting + 0.01; // update the variable
	_selected_soldier set [2,_selected_soldier_spotting_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};
	
DUWS_operator_add_courage = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_courage = _selected_soldier select 3;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_courage >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_courage_new = _selected_soldier_courage + 0.01; // update the variable
	_selected_soldier set [3,_selected_soldier_courage_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};
	
DUWS_operator_add_comms = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_comms = _selected_soldier select 4;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_comms >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_comms_new = _selected_soldier_comms + 0.01; // update the variable
	_selected_soldier set [4,_selected_soldier_comms_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};
	
DUWS_operator_add_reload = {
	_selected_index = lbCurSel 1500;
	_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index
	
	_selected_soldier_reload = _selected_soldier select 5;
	_selected_soldier_points = _selected_soldier select 13;
	if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
	if (_selected_soldier_reload >= 1) exitWith {hint "This stat is already at the maximum"};
	
	_selected_soldier_reload_new = _selected_soldier_reload + 0.01; // update the variable
	_selected_soldier set [5,_selected_soldier_reload_new];
	
	_selected_soldier_pts_new = _selected_soldier_points - 1;
	_selected_soldier set [13,_selected_soldier_pts_new];
	[] execVM 'dialog\operative\LBselected.sqf';
	hint "New stats will be applied at the next deployment of this operative";
	};