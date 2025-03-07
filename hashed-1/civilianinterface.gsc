// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-2\ai_interface.gsc;
#using hashed-2\archetype_civilian.gsc;
#using hashed-3\aiutility_428.gsc;

#namespace civilianinterface;

/*
	Name: registercivilianinterfaceattributes
	Namespace: civilianinterface
	Checksum: 0x68503044
	Offset: 0xA0
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function registercivilianinterfaceattributes()
{
	ai::registermatchedinterface(#"civilian", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
	ai::registermatchedinterface(#"civilian", #"hash_78e762abc4fbf1de", "calm", array("calm", "panic", "riot", "run"));
	ai::registermatchedinterface(#"civilian", #"auto_escape", 1, array(1, 0));
	ai::registermatchedinterface(#"civilian", #"auto_wander", 1, array(1, 0));
	ai::registermatchedinterface(#"civilian", #"usegrenades", 1, array(1, 0));
	ai::registerentityinterface(#"civilian", #"follow", undefined, &archetypecivilian::function_49d80e54);
}

