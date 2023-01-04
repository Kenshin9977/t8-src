// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-1\behaviortreenetworkutility.gsc;
#using hashed-1\animationstatenetwork_91.gsc;
#using hashed-2\blackboard.gsc;
#using hashed-3\aiutility_428.gsc;
#using hashed-3\animationstatenetworkutility.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace zm_behavior_utility;

/*
	Name: setupattackproperties
	Namespace: zm_behavior_utility
	Checksum: 0x1C1AF0ED
	Offset: 0xD0
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function setupattackproperties()
{
	self val::reset(#"hash_62fca810699077f3", "ignoreall");
	self.meleeattackdist = 64;
}

/*
	Name: enteredplayablearea
	Namespace: zm_behavior_utility
	Checksum: 0x3D489227
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function enteredplayablearea()
{
	self zm_spawner::zombie_complete_emerging_into_playable_area();
	self.pushable = 1;
	self setupattackproperties();
}

