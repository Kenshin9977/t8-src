// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace cschashed-3\script_c2cccc1cfe3a8a1;

/*
	Name: function_89f2df9
	Namespace: cschashed-3\script_c2cccc1cfe3a8a1
	Checksum: 0x23A41F6C
	Offset: 0x88
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_18932d2054c58cd0", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-3\script_c2cccc1cfe3a8a1
	Checksum: 0xF7BA9EE1
	Offset: 0xD8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register(#"hash_18932d2054c58cd0", "activated");
}

