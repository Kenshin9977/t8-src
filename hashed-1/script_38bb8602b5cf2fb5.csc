// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace cschashed-2\script_38bb8602b5cf2fb5;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_38bb8602b5cf2fb5
	Checksum: 0x81D58EB3
	Offset: 0x88
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_465c22731c18755c", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-2\script_38bb8602b5cf2fb5
	Checksum: 0x630B7279
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
	bgb::register(#"hash_465c22731c18755c", "activated");
}

