// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-2\ai_interface.gsc;
#using hashed-3\aiutility_428.gsc;

#namespace humanrpginterface;

/*
	Name: registerhumanrpginterfaceattributes
	Namespace: humanrpginterface
	Checksum: 0xD25DEC26
	Offset: 0x78
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function registerhumanrpginterfaceattributes()
{
	ai::registermatchedinterface(#"human_rpg", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
	ai::registermatchedinterface(#"human_rpg", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
	ai::registermatchedinterface(#"human_rpg", #"coveridleonly", 0, array(1, 0));
	ai::registermatchedinterface(#"human_rpg", #"sprint", 0, array(1, 0));
	ai::registermatchedinterface(#"human_rpg", #"patrol", 0, array(1, 0));
}

