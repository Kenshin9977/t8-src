// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_11ad1b0c8864ba5c;
#using hashed-2\ai_interface.gsc;

#namespace namespace_6ecedca5;

/*
	Name: registerwerewolfinterfaceattributes
	Namespace: namespace_6ecedca5
	Checksum: 0x1E64ECBC
	Offset: 0x78
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function registerwerewolfinterfaceattributes()
{
	ai::registermatchedinterface(#"werewolf", #"patrol", 0, array(1, 0), &cschashed-3\script_3599c70c9d1abde8::function_2341cdf0);
	ai::registermatchedinterface(#"werewolf", #"summon_wolves", 0, array(1, 0), &cschashed-3\script_3599c70c9d1abde8::function_2c67c3e1);
}

