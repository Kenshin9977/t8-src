// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace zm_bgb_danger_closest;

/*
	Name: function_89f2df9
	Namespace: zm_bgb_danger_closest
	Checksum: 0x87ACCD1
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"zm_bgb_danger_closest", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: zm_bgb_danger_closest
	Checksum: 0xE539887
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
	bgb::register(#"zm_bgb_danger_closest", "time");
}

