// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace cschashed-2\script_142fb8ad4f0a43f;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_142fb8ad4f0a43f
	Checksum: 0x2DAA04BD
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_7c80df83e002a4d6", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-2\script_142fb8ad4f0a43f
	Checksum: 0xB32AF224
	Offset: 0xD0
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
	bgb::register(#"hash_7c80df83e002a4d6", "time");
}

