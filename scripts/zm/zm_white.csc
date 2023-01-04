// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_102fa70a8153e81f.csc;
hashed-3\script_12549eb8cb2580e4.csc;
hashed-2\script_14e736d5e4272b3d.csc;
hashed-3\script_1611421ee9b880d3.csc;
hashed-1\script_1de1583a62cc580f.csc;
hashed-3\script_23037fdea02db280.csc;
hashed-2\script_27a4aedb3d2a899b.csc;
hashed-3\script_28144a2871e71a78.csc;
hashed-1\script_2c454d63a96d2d0b.csc;
hashed-1\script_2cb5724648b5b416.csc;
hashed-3\script_318816742cac11da.csc;
hashed-3\script_3619535866efa23a.csc;
hashed-1\script_3a10f19f96036e97.csc;
hashed-1\script_3ba495e039989116.csc;
hashed-3\script_412188df54bb77d9.csc;
hashed-1\script_4c9e3a985ae04008.csc;
hashed-1\script_4deda6ab11ad22af.csc;
hashed-2\script_518e526a2898bf6d.csc;
hashed-1\script_5d65ba89fe134c5c.csc;
hashed-3\script_67051bc8c81031aa.csc;
hashed-2\script_784bc1aee23dbf1f.csc;
hashed-2\script_84f5590d2ac48f8.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm\zm_white_main_quest.csc;
#using scripts\zm\zm_white_sound.csc;
#using scripts\zm\zm_white_util.csc;
#using scripts\zm_common\load.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace zm_white;

/*
	Name: opt_in
	Namespace: zm_white
	Checksum: 0xAF1070FF
	Offset: 0x668
	Size: 0x22
	Parameters: 0
	Flags: AutoExec
*/
autoexec function opt_in()
{
	level.aat_in_use = 1;
	level.bgb_in_use = 1;
}

/*
	Name: main
	Namespace: zm_white
	Checksum: 0xADDDE21A
	Offset: 0x698
	Size: 0x78C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	full_screen_movie::register("full_screen_movie");
	clientfield::register("clientuimodel", "player_lives", 1, 2, "int", undefined, 0, 0);
	level._effect[#"headshot"] = "_t6/impacts/fx_flesh_hit";
	level._effect[#"headshot_nochunks"] = "_t6/misc/fx_zombie_bloodsplat";
	level._effect[#"bloodspurt"] = "_t6/misc/fx_zombie_bloodspurt";
	level._effect[#"animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
	level._effect[#"animscript_gibtrail_fx"] = "_t6/trail/fx_trail_blood_streak";
	level._effect[#"hash_4cee8d16fd03fab3"] = #"hash_d763bb85d068431";
	level._effect[#"hash_b6fb18d53b3ba8f"] = #"hash_2a09c05622f43005";
	level._effect[#"hash_50a4de8d221c0d88"] = #"hash_5088b0c20d6a9452";
	clientfield::register("scriptmover", "" + #"hash_28b770e7e782837", 1, 1, "int", &function_61c6d401, 0, 0);
	clientfield::register("world", "portal_map_magicbox_lights_init", 1, 1, "int", &portal_map_magicbox_lights_init, 0, 0);
	clientfield::register("world", "portal_map_start_chest1", 1, 1, "int", &portal_map_start_chest1, 0, 0);
	clientfield::register("world", "portal_map_start_chest2", 1, 1, "int", &portal_map_start_chest2, 0, 0);
	clientfield::register("world", "portal_map_green_backyard_chest", 1, 1, "int", &portal_map_green_backyard_chest, 0, 0);
	clientfield::register("world", "portal_map_yellow_backyard_chest", 1, 1, "int", &portal_map_yellow_backyard_chest, 0, 0);
	clientfield::register("world", "portal_map_bunker1_chest", 1, 1, "int", &portal_map_bunker1_chest, 0, 0);
	clientfield::register("world", "portal_map_bunker2_chest", 1, 1, "int", &portal_map_bunker2_chest, 0, 0);
	clientfield::register("world", "portal_map_fire_sale", 1, 1, "int", &portal_map_fire_sale, 0, 0);
	clientfield::register("world", "portal_map_cul_de_sac_chest", 1, 1, "int", &portal_map_cul_de_sac_chest, 0, 0);
	clientfield::register("world", "power_pbg_control", 1, 1, "int", &power_pbg_control, 0, 0);
	cschashed-1\script_2cb5724648b5b416::init_fx();
	cschashed-1\script_2cb5724648b5b416::init_clientfields();
	namespace_4e1a75d3::init_fx();
	namespace_4e1a75d3::init_clientfields();
	cschashed-3\script_12549eb8cb2580e4::init_fx();
	cschashed-3\script_12549eb8cb2580e4::init_clientfields();
	level._uses_default_wallbuy_fx = 1;
	level._uses_sticky_grenades = 1;
	level._uses_taser_knuckles = 1;
	level.zombiemode_using_doubletap_perk = 1;
	level.zombiemode_using_juggernaut_perk = 1;
	level.zombiemode_using_revive_perk = 1;
	level.zombiemode_using_sleightofhand_perk = 1;
	level.var_d0ab70a2 = #"hash_6dcfc619b819ab4f";
	level cschashed-1\script_5d65ba89fe134c5c::main();
	level cschashed-3\script_28144a2871e71a78::preload();
	level cschashed-3\script_318816742cac11da::register_clientfields();
	level cschashed-1\script_4c9e3a985ae04008::init_clientfields();
	level cschashed-1\script_4deda6ab11ad22af::preload();
	level cschashed-3\script_412188df54bb77d9::init();
	level cschashed-2\script_102fa70a8153e81f::preload();
	level cschashed-2\script_14e736d5e4272b3d::preload();
	level cschashed-1\script_3ba495e039989116::preload();
	level cschashed-2\script_27a4aedb3d2a899b::preload();
	level cschashed-2\script_518e526a2898bf6d::init();
	load::main();
	level thread namespace_e313550c::main();
	level thread cschashed-1\script_4c9e3a985ae04008::init();
	level thread cschashed-3\script_318816742cac11da::init();
	level thread setup_personality_character_exerts();
	level thread function_b8da6f44();
	zm_utility::function_beed5764("rob_zm_eyes_blue_light", #"hash_7fcc925775fa9101");
	util::waitforclient(0);
}

/*
	Name: function_b8da6f44
	Namespace: zm_white
	Checksum: 0x18251EE8
	Offset: 0xE30
	Size: 0x16A
	Parameters: 0
	Flags: Linked
*/
function function_b8da6f44()
{
	level.var_4016a739 = vectorscale((0, 1, 0), 90);
	level._effect[#"hash_2bba72fdcc5508b5"] = #"hash_1e8cb303d3103833";
	level._effect[#"chest_light_closed"] = #"hash_602f075818a2fb2e";
	level._effect[#"hash_19f4dd97cbb87594"] = #"hash_2f7533f7f5b59f7c";
	level._effect[#"hash_246062f68a34e289"] = #"hash_61b9b9ada5bb46b1";
	level._effect[#"hash_73c11d9bf55cbb6"] = #"hash_71e5e40c76a09b21";
	level._effect[#"hash_5239f7431d4c72ca"] = #"hash_200de2be21c77806";
	level._effect[#"hash_b6e7f724af1ad5b"] = #"hash_6e05ede771d9fb16";
}

/*
	Name: function_bc7eec87
	Namespace: zm_white
	Checksum: 0x9C96E30E
	Offset: 0xFA8
	Size: 0x2AA
	Parameters: 7
	Flags: None
*/
function function_bc7eec87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.a_s_fx))
	{
		s_org = arraygetclosest(self.origin, struct::get_array("plasma_trap_org"));
		self.a_s_fx = struct::get_array(s_org.target);
	}
	switch(newval)
	{
		case 1:
		{
			fx_id = level._effect[#"hash_4cee8d16fd03fab3"];
			break;
		}
		case 2:
		{
			fx_id = level._effect[#"hash_b6fb18d53b3ba8f"];
			break;
		}
		case 3:
		{
			fx_id = level._effect[#"hash_50a4de8d221c0d88"];
			break;
		}
	}
	foreach(s_fx in self.a_s_fx)
	{
		if(isdefined(s_fx.fx_plasma))
		{
			stopfx(localclientnum, s_fx.fx_plasma);
			s_fx.fx_plasma = undefined;
		}
	}
	if(isdefined(fx_id))
	{
		foreach(s_fx in self.a_s_fx)
		{
			s_fx.fx_plasma = playfx(localclientnum, fx_id, s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		}
	}
}

/*
	Name: function_61c6d401
	Namespace: zm_white
	Checksum: 0xC7EC3906
	Offset: 0x1260
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function function_61c6d401(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		self function_bf9d3071("rob_zm_white_crate_clear");
	}
	else
	{
		self function_5d482e78("rob_zm_white_crate_clear");
	}
}

/*
	Name: portal_map_magicbox_lights_init
	Namespace: zm_white
	Checksum: 0x90FB97B3
	Offset: 0x12F0
	Size: 0x178
	Parameters: 7
	Flags: Linked
*/
function portal_map_magicbox_lights_init(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	level.var_17199db2[0] = "tag_start_chest1";
	level.var_17199db2[1] = "tag_start_chest2";
	level.var_17199db2[2] = "tag_green_backyard_chest";
	level.var_17199db2[3] = "tag_yellow_backyard_chest";
	level.var_17199db2[4] = "tag_bunker1_chest";
	level.var_17199db2[5] = "tag_bunker2_chest";
	level.var_17199db2[6] = "tag_cul_de_sac_chest";
	foreach(var_e9739ac3 in level.var_17199db2)
	{
		function_86b85486(localclientnum, var_e9739ac3);
	}
}

/*
	Name: portal_map_start_chest1
	Namespace: zm_white
	Checksum: 0xA7F37A0D
	Offset: 0x1470
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_start_chest1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_start_chest1");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_start_chest1");
	}
}

/*
	Name: portal_map_start_chest2
	Namespace: zm_white
	Checksum: 0x717E491D
	Offset: 0x1510
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_start_chest2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_start_chest2");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_start_chest2");
	}
}

/*
	Name: portal_map_green_backyard_chest
	Namespace: zm_white
	Checksum: 0x79B97F62
	Offset: 0x15B0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_green_backyard_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_green_backyard_chest");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_green_backyard_chest");
	}
}

/*
	Name: portal_map_yellow_backyard_chest
	Namespace: zm_white
	Checksum: 0xAC745E33
	Offset: 0x1650
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_yellow_backyard_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_yellow_backyard_chest");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_yellow_backyard_chest");
	}
}

/*
	Name: portal_map_bunker1_chest
	Namespace: zm_white
	Checksum: 0xC451CE38
	Offset: 0x16F0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_bunker1_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_bunker1_chest");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_bunker1_chest");
	}
}

/*
	Name: portal_map_bunker2_chest
	Namespace: zm_white
	Checksum: 0x5316B182
	Offset: 0x1790
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_bunker2_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_bunker2_chest");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_bunker2_chest");
	}
}

/*
	Name: portal_map_cul_de_sac_chest
	Namespace: zm_white
	Checksum: 0x60D2818B
	Offset: 0x1830
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function portal_map_cul_de_sac_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		function_d901bcc9(localclientnum, "tag_cul_de_sac_chest");
	}
	else if(newval == 0)
	{
		function_86b85486(localclientnum, "tag_cul_de_sac_chest");
	}
}

/*
	Name: portal_map_fire_sale
	Namespace: zm_white
	Checksum: 0xCFEE8430
	Offset: 0x18D0
	Size: 0x28C
	Parameters: 7
	Flags: Linked
*/
function portal_map_fire_sale(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(!isdefined(level.var_8f14a19))
	{
		level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
	}
	if(newval == 1)
	{
		foreach(var_35f97c42 in level.var_8f14a19)
		{
			foreach(var_acb45e05 in level.var_17199db2)
			{
				var_35f97c42 util::waittill_dobj(localclientnum);
				var_35f97c42 showpart(localclientnum, var_acb45e05);
			}
		}
	}
	else if(newval == 0)
	{
		foreach(var_35f97c42 in level.var_8f14a19)
		{
			foreach(var_acb45e05 in level.var_17199db2)
			{
				var_35f97c42 util::waittill_dobj(localclientnum);
				var_35f97c42 hidepart(localclientnum, var_acb45e05);
			}
		}
	}
}

/*
	Name: function_d901bcc9
	Namespace: zm_white
	Checksum: 0xCA0C8A40
	Offset: 0x1B68
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function function_d901bcc9(localclientnum, tag)
{
	if(!isdefined(level.var_8f14a19))
	{
		level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
	}
	foreach(var_35f97c42 in level.var_8f14a19)
	{
		var_35f97c42 util::waittill_dobj(localclientnum);
		var_35f97c42 showpart(localclientnum, tag);
	}
}

/*
	Name: function_86b85486
	Namespace: zm_white
	Checksum: 0x8D51BD4D
	Offset: 0x1C60
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function function_86b85486(localclientnum, tag)
{
	if(!isdefined(level.var_8f14a19))
	{
		level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
	}
	foreach(var_35f97c42 in level.var_8f14a19)
	{
		var_35f97c42 util::waittill_dobj(localclientnum);
		var_35f97c42 hidepart(localclientnum, tag);
	}
}

/*
	Name: power_pbg_control
	Namespace: zm_white
	Checksum: 0x14CD79D7
	Offset: 0x1D58
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function power_pbg_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, var_1e231644)
{
	if(newval == 1)
	{
		setpbgactivebank(localclientnum, 4);
	}
	else
	{
		setpbgactivebank(localclientnum, 1);
	}
}

/*
	Name: setup_personality_character_exerts
	Namespace: zm_white
	Checksum: 0xF923D0ED
	Offset: 0x1DE8
	Size: 0x508
	Parameters: 0
	Flags: Linked
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[5][#"playerbreathinsound"] = "vox_plr_5_exert_sniper_hold";
	level.exert_sounds[6][#"playerbreathinsound"] = "vox_plr_6_exert_sniper_hold";
	level.exert_sounds[7][#"playerbreathinsound"] = "vox_plr_7_exert_sniper_hold";
	level.exert_sounds[8][#"playerbreathinsound"] = "vox_plr_8_exert_sniper_hold";
	level.exert_sounds[13][#"playerbreathinsound"] = "vox_plr_5_exert_sniper_hold";
	level.exert_sounds[14][#"playerbreathinsound"] = "vox_plr_6_exert_sniper_hold";
	level.exert_sounds[15][#"playerbreathinsound"] = "vox_plr_7_exert_sniper_hold";
	level.exert_sounds[16][#"playerbreathinsound"] = "vox_plr_8_exert_sniper_hold";
	level.exert_sounds[5][#"playerbreathoutsound"] = "vox_plr_5_exert_sniper_exhale";
	level.exert_sounds[6][#"playerbreathoutsound"] = "vox_plr_6_exert_sniper_exhale";
	level.exert_sounds[7][#"playerbreathoutsound"] = "vox_plr_7_exert_sniper_exhale";
	level.exert_sounds[8][#"playerbreathoutsound"] = "vox_plr_8_exert_sniper_exhale";
	level.exert_sounds[13][#"playerbreathoutsound"] = "vox_plr_5_exert_sniper_exhale";
	level.exert_sounds[14][#"playerbreathoutsound"] = "vox_plr_6_exert_sniper_exhale";
	level.exert_sounds[15][#"playerbreathoutsound"] = "vox_plr_7_exert_sniper_exhale";
	level.exert_sounds[16][#"playerbreathoutsound"] = "vox_plr_8_exert_sniper_exhale";
	level.exert_sounds[5][#"playerbreathgaspsound"] = "vox_plr_5_exert_sniper_gasp";
	level.exert_sounds[6][#"playerbreathgaspsound"] = "vox_plr_6_exert_sniper_gasp";
	level.exert_sounds[7][#"playerbreathgaspsound"] = "vox_plr_7_exert_sniper_gasp";
	level.exert_sounds[8][#"playerbreathgaspsound"] = "vox_plr_8_exert_sniper_gasp";
	level.exert_sounds[13][#"playerbreathgaspsound"] = "vox_plr_5_exert_sniper_gasp";
	level.exert_sounds[14][#"playerbreathgaspsound"] = "vox_plr_6_exert_sniper_gasp";
	level.exert_sounds[15][#"playerbreathgaspsound"] = "vox_plr_7_exert_sniper_gasp";
	level.exert_sounds[16][#"playerbreathgaspsound"] = "vox_plr_8_exert_sniper_gasp";
	level.exert_sounds[5][#"meleeswipesoundplayer"] = "vox_plr_5_exert_punch_give";
	level.exert_sounds[6][#"meleeswipesoundplayer"] = "vox_plr_6_exert_punch_give";
	level.exert_sounds[7][#"meleeswipesoundplayer"] = "vox_plr_7_exert_punch_give";
	level.exert_sounds[8][#"meleeswipesoundplayer"] = "vox_plr_8_exert_punch_give";
	level.exert_sounds[13][#"meleeswipesoundplayer"] = "vox_plr_5_exert_punch_give";
	level.exert_sounds[14][#"meleeswipesoundplayer"] = "vox_plr_6_exert_punch_give";
	level.exert_sounds[15][#"meleeswipesoundplayer"] = "vox_plr_7_exert_punch_give";
	level.exert_sounds[16][#"meleeswipesoundplayer"] = "vox_plr_8_exert_punch_give";
}

