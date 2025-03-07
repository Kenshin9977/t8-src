// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_6ce38ab036223e6e;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm_stats.gsc;

#namespace cschashed-2\script_660bfc5cf7a0646b;

/*
	Name: main
	Namespace: cschashed-2\script_660bfc5cf7a0646b
	Checksum: 0xC3C5CA36
	Offset: 0xC0
	Size: 0xDC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &namespace_a28acff3::round_start;
	if(!level flag::exists(#"hash_33037f6188bd285f"))
	{
		level flag::init(#"hash_33037f6188bd285f", 1);
	}
}

/*
	Name: onprecachegametype
	Namespace: cschashed-2\script_660bfc5cf7a0646b
	Checksum: 0xB38914A1
	Offset: 0x1A8
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: cschashed-2\script_660bfc5cf7a0646b
	Checksum: 0x53F3CEB2
	Offset: 0x1D0
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
}

