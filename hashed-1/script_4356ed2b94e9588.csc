// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace cschashed-3\script_4356ed2b94e9588;

/*
	Name: function_89f2df9
	Namespace: cschashed-3\script_4356ed2b94e9588
	Checksum: 0x329851B1
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_74496e1b656c6651", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-3\script_4356ed2b94e9588
	Checksum: 0x163AEE0B
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
	bgb::register(#"hash_74496e1b656c6651", "time");
}

