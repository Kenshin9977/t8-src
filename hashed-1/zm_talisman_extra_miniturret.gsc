// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace gsczm_talisman_extra_miniturret;

/*
	Name: function_89f2df9
	Namespace: gsczm_talisman_extra_miniturret
	Checksum: 0x426260BB
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_2ccfcd0e93300991", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: gsczm_talisman_extra_miniturret
	Checksum: 0x6BA77BE2
	Offset: 0x128
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_talisman::function_88a60d36("talisman_extra_miniturret", &activate_talisman);
}

/*
	Name: activate_talisman
	Namespace: gsczm_talisman_extra_miniturret
	Checksum: 0xAB73ABA4
	Offset: 0x160
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function activate_talisman()
{
	self.var_bd8a5474 = 1;
}

