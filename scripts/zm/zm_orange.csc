// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-3\script_1611421ee9b880d3.csc;
hashed-2\script_18a4de9276bfbc6d.csc;
hashed-3\script_1964b042d2f814f9.csc;
hashed-1\script_1de1583a62cc580f.csc;
hashed-1\script_1edaf4333ed0bece.csc;
hashed-3\script_23037fdea02db280.csc;
hashed-2\script_29ccb18ac19d72ef.csc;
hashed-1\script_2c454d63a96d2d0b.csc;
hashed-3\script_31055dfc068c1e62.csc;
hashed-3\script_3619535866efa23a.csc;
hashed-3\script_3762ce8163e304e6.csc;
hashed-1\script_3a10f19f96036e97.csc;
hashed-1\script_3c362258ff800237.csc;
hashed-3\script_4716533215778f7f.csc;
hashed-1\script_4f00f8c9cdfa5084.csc;
hashed-3\script_520360b6c44baa8b.csc;
hashed-1\script_5fb8da2731850d9e.csc;
hashed-2\script_613cf9c83fcec4a7.csc;
hashed-3\script_67051bc8c81031aa.csc;
hashed-2\script_69c3075ae5f589b3.csc;
hashed-2\script_709bf7c56eb65adf.csc;
hashed-2\script_70e92046734b4a71.csc;
hashed-2\script_76b36ed1b7a51ed2.csc;
hashed-2\script_784bc1aee23dbf1f.csc;
hashed-3\script_7958032999970f05.csc;
hashed-1\script_7d5f2f51e8a5443d.csc;
hashed-2\script_84f5590d2ac48f8.csc;
hashed-3\script_f459be361894751.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm\zm_orange_challenges.csc;
#using scripts\zm\zm_orange_fx.csc;
#using scripts\zm\zm_orange_sound.csc;
#using scripts\zm\zm_orange_ww_quest.csc;
#using scripts\zm_common\callbacks.csc;
#using scripts\zm_common\load.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_audio.csc;
#using scripts\zm_common\zm_magicbox.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace zm_orange;

/*
	Name: opt_in
	Namespace: zm_orange
	Checksum: 0x4FBF7D9A
	Offset: 0x4D8
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
	Namespace: zm_orange
	Checksum: 0xB2D20871
	Offset: 0x508
	Size: 0x3FC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	full_screen_movie::register("full_screen_movie");
	clientfield::register("actor", "sndActorUnderwater", 28000, 1, "int", &sndactorunderwater, 0, 1);
	level.setupcustomcharacterexerts = &setup_personality_character_exerts;
	level._effect[#"headshot"] = "_t6/impacts/fx_flesh_hit";
	level._effect[#"headshot_nochunks"] = "_t6/misc/fx_zombie_bloodsplat";
	level._effect[#"bloodspurt"] = "_t6/misc/fx_zombie_bloodspurt";
	level._effect[#"animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
	level._effect[#"animscript_gibtrail_fx"] = "_t6/trail/fx_trail_blood_streak";
	level thread zm_orange_fx::init();
	level._uses_default_wallbuy_fx = 1;
	level._uses_sticky_grenades = 1;
	level._uses_taser_knuckles = 1;
	level.var_d0ab70a2 = #"hash_544f128e274c84e0";
	level.var_4016a739 = vectorscale((0, 1, 0), 90);
	level namespace_86eed980::init();
	level cschashed-3\script_4716533215778f7f::preload();
	level cschashed-1\script_4f00f8c9cdfa5084::init();
	level cschashed-2\script_18a4de9276bfbc6d::init();
	level cschashed-3\script_1964b042d2f814f9::preload();
	level cschashed-1\script_1edaf4333ed0bece::init();
	level cschashed-2\script_70e92046734b4a71::init();
	level cschashed-2\script_613cf9c83fcec4a7::init();
	level cschashed-1\script_7d5f2f51e8a5443d::preload();
	level cschashed-2\script_69c3075ae5f589b3::preload();
	level cschashed-3\script_f459be361894751::init();
	level cschashed-3\script_520360b6c44baa8b::init();
	level zm_orange_ww_quest::init();
	level thread namespace_e7aed809::main();
	level cschashed-3\script_7958032999970f05::preload();
	level cschashed-2\script_29ccb18ac19d72ef::preload();
	load::main();
	level thread setup_personality_character_exerts();
	level thread namespace_86eed980::main();
	level thread cschashed-3\script_520360b6c44baa8b::main();
	exploder::exploder("lgt_vending_mulekick_on");
	util::waitforclient(0);
	level thread function_b8da6f44();
	level thread function_72f1cddb();
}

/*
	Name: function_b8da6f44
	Namespace: zm_orange
	Checksum: 0x22A05EEB
	Offset: 0x910
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_b8da6f44()
{
	level._effect[#"hash_2bba72fdcc5508b5"] = #"hash_1e8cb303d3103833";
	level._effect[#"chest_light_closed"] = #"hash_602f075818a2fb2e";
	level._effect[#"hash_19f4dd97cbb87594"] = #"hash_2f7533f7f5b59f7c";
	level._effect[#"hash_246062f68a34e289"] = #"hash_61b9b9ada5bb46b1";
	level._effect[#"hash_73c11d9bf55cbb6"] = #"hash_71e5e40c76a09b21";
	level._effect[#"hash_5239f7431d4c72ca"] = #"hash_200de2be21c77806";
	level._effect[#"hash_b6e7f724af1ad5b"] = #"hash_6e05ede771d9fb16";
}

/*
	Name: function_72f1cddb
	Namespace: zm_orange
	Checksum: 0x1FFD80
	Offset: 0xA70
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_72f1cddb()
{
	zm_utility::function_beed5764("rob_zm_eyes_red", #"zm_ai/fx8_zombie_eye_glow_red");
}

/*
	Name: setup_personality_character_exerts
	Namespace: zm_orange
	Checksum: 0x4FD2633
	Offset: 0xAA8
	Size: 0x288
	Parameters: 0
	Flags: Linked
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[17][#"playerbreathinsound"] = "vox_stuh_exert_sniper_hold";
	level.exert_sounds[18][#"playerbreathinsound"] = "vox_mist_exert_sniper_hold";
	level.exert_sounds[19][#"playerbreathinsound"] = "vox_marl_exert_sniper_hold";
	level.exert_sounds[20][#"playerbreathinsound"] = "vox_russ_exert_sniper_hold";
	level.exert_sounds[17][#"playerbreathoutsound"] = "vox_stuh_exert_sniper_exhale";
	level.exert_sounds[18][#"playerbreathoutsound"] = "vox_mist_exert_sniper_exhale";
	level.exert_sounds[19][#"playerbreathoutsound"] = "vox_marl_exert_sniper_exhale";
	level.exert_sounds[20][#"playerbreathoutsound"] = "vox_russ_exert_sniper_exhale";
	level.exert_sounds[17][#"playerbreathgaspsound"] = "vox_stuh_exert_sniper_gasp";
	level.exert_sounds[18][#"playerbreathgaspsound"] = "vox_mist_exert_sniper_gasp";
	level.exert_sounds[19][#"playerbreathgaspsound"] = "vox_marl_exert_sniper_gasp";
	level.exert_sounds[20][#"playerbreathgaspsound"] = "vox_russ_exert_sniper_gasp";
	level.exert_sounds[17][#"meleeswipesoundplayer"] = "vox_stuh_exert_punch_give";
	level.exert_sounds[18][#"meleeswipesoundplayer"] = "vox_mist_exert_punch_give";
	level.exert_sounds[19][#"meleeswipesoundplayer"] = "vox_marl_exert_punch_give";
	level.exert_sounds[20][#"meleeswipesoundplayer"] = "vox_russ_exert_punch_give";
}

/*
	Name: sndactorunderwater
	Namespace: zm_orange
	Checksum: 0xDA93B0C8
	Offset: 0xD38
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function sndactorunderwater(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		self setsoundentcontext("water", "under");
	}
	else
	{
		self setsoundentcontext("water", "over");
	}
}

