// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace cschashed-1\script_7c6ab9a5c535a4eb;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_7c6ab9a5c535a4eb
	Checksum: 0xA564E144
	Offset: 0x88
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_39376ab9d627e38a", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-1\script_7c6ab9a5c535a4eb
	Checksum: 0xAA395C41
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
	bgb::register(#"hash_39376ab9d627e38a", "activated");
}

