// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-3\script_40114edfb27a2dd9.csc;
#using scripts\core_common\system_shared.csc;

#namespace hud;

/*
	Name: function_89f2df9
	Namespace: hud
	Checksum: 0x1C8456E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hud", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: hud
	Checksum: 0x2312E110
	Offset: 0xD8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	scavenger_icon::register("scavenger_pickup");
}

