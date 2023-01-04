// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-2\ai_interface.gsc;
#using hashed-3\zombiebehavior.gsc;

#namespace namespace_c61045a2;

/*
	Name: registercatalystinterfaceattributes
	Namespace: namespace_c61045a2
	Checksum: 0x63D2DE71
	Offset: 0x88
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function registercatalystinterfaceattributes()
{
	ai::registermatchedinterface(#"catalyst", #"gravity", "normal", array("low", "normal"), &zombiebehavior::function_db26137a);}

