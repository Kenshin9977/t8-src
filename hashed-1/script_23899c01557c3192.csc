// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_127edb82eabcb791.csc;
hashed-3\script_3487c470617b596f.csc;
#using script_6f708b088707e166;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\oob.csc;
#using scripts\core_common\renderoverridebundle.csc;

#namespace cschashed-3\script_23899c01557c3192;

/*
	Name: main
	Namespace: cschashed-3\script_23899c01557c3192
	Checksum: 0x1AF65440
	Offset: 0xB8
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_13777bae::function_46e95cc7();
	namespace_13777bae::function_fa03fc55();
	level.ct_firebreak_multi_kill = ct_firebreak_multi_kill::register("ct_firebreak_multi_kill");
	cschashed-3\script_3487c470617b596f::init();
}

