// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace gsczm_talisman_shield_durability_legendary;

/*
	Name: function_89f2df9
	Namespace: gsczm_talisman_shield_durability_legendary
	Checksum: 0x674D945F
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_299133b3121f19aa", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: gsczm_talisman_shield_durability_legendary
	Checksum: 0x9FA9FCF3
	Offset: 0x120
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_talisman::function_88a60d36("talisman_shield_durability_legendary", &activate_talisman);
}

/*
	Name: activate_talisman
	Namespace: gsczm_talisman_shield_durability_legendary
	Checksum: 0x211392B1
	Offset: 0x158
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function activate_talisman()
{
	self.var_9c2026aa = 0.33;
}

