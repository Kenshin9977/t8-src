// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace cschashed-1\script_6c9ef96253ac7e85;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_6c9ef96253ac7e85
	Checksum: 0x3B7CBD66
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_2a62a00449e2e702", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-1\script_6c9ef96253ac7e85
	Checksum: 0xCC2ACA5E
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("small_ammo");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("small_ammo");
	}
}

