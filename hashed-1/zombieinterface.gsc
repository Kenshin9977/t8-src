// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-2\ai_interface.gsc;
#using hashed-3\zombiebehavior.gsc;

#namespace zombieinterface;

/*
	Name: registerzombieinterfaceattributes
	Namespace: zombieinterface
	Checksum: 0xEAF3C195
	Offset: 0x88
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function registerzombieinterfaceattributes()
{
	ai::registermatchedinterface(#"zombie", #"can_juke", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"suicidal_behavior", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"spark_behavior", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"use_attackable", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"gravity", "normal", array("low", "normal"), &zombiebehavior::function_db26137a);
}

