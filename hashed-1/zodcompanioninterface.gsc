// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-3\archetype_zod_companion.gsc;
#using hashed-2\ai_interface.gsc;

#namespace zodcompanioninterface;

/*
	Name: registerzodcompanioninterfaceattributes
	Namespace: zodcompanioninterface
	Checksum: 0xE3A4E9BF
	Offset: 0x78
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function registerzodcompanioninterfaceattributes()
{
	ai::registermatchedinterface(#"zod_companion", #"sprint", 0, array(1, 0));
}

