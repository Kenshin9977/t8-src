// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-3\gib.gsc;
#using hashed-2\destructserverutils.gsc;
#using hashed-2\globallogic_player.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;

#namespace globallogic_actor;

/*
	Name: callback_actorspawned
	Namespace: globallogic_actor
	Checksum: 0x49FB347C
	Offset: 0xB0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function callback_actorspawned(spawner)
{
	self thread spawner::spawn_think(spawner);
	bb::function_d85a26a1(self, spawner);
}

/*
	Name: callback_actorcloned
	Namespace: globallogic_actor
	Checksum: 0x4180384F
	Offset: 0xF8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function callback_actorcloned(original)
{
	destructserverutils::copydestructstate(original, self);
	gibserverutils::copygibstate(original, self);
}

