// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_14f4a3c583c77d4b;
#using hashed-3\behaviorstatemachine.gsc;
#using script_24d618f824d9516a;
#using script_2c5daa95f8fec03c;
#using hashed-2\archetype_mocomps_utility.gsc;
#using hashed-3\gib.gsc;
#using hashed-3\aiutility.gsc;
#using hashed-1\behaviortreenetworkutility.gsc;
#using hashed-1\zombie_utility.gsc;
#using hashed-2\destructserverutils.gsc;
#using hashed-2\aiutility.gsc;
#using hashed-1\animationstatenetwork.gsc;
#using hashed-1\animationstatenetwork_91.gsc;
#using hashed-2\blackboard.gsc;
#using hashed-2\status_effect.gsc;
#using hashed-2\ai_interface.gsc;
#using hashed-3\aiutility_428.gsc;
#using hashed-2\as_debug.gsc;
#using hashed-1\blackboard_136.gsc;
#using hashed-3\animationstatenetworkutility.gsc;
#using hashed-3\zm_cleanup.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace cschashed-2\script_36e38dfef83cf452;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x34AFB20D
	Offset: 0x248
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_7385ea584dca4997", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x93985552
	Offset: 0x298
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	spawner::add_archetype_spawn_function(#"ghost", &function_cc3e52ff);
	spawner::add_archetype_spawn_function(#"ghost", &function_fe6a9772);
	namespace_6e19570f::function_fd76c3b();
}

/*
	Name: __main__
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x80F724D1
	Offset: 0x318
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function __main__()
{
}

/*
	Name: function_cc3e52ff
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x47A8FD4F
	Offset: 0x328
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_cc3e52ff()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_f093c843;
}

/*
	Name: function_f093c843
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0xD353F921
	Offset: 0x380
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
private function function_f093c843(entity)
{
	entity.__blackboard = undefined;
	entity function_cc3e52ff();
}

/*
	Name: function_fe6a9772
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x141D032E
	Offset: 0x3B8
	Size: 0x122
	Parameters: 0
	Flags: Linked, Private
*/
private function function_fe6a9772()
{
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	if(!isdefined(self.zombie_arms_position))
	{
		if(randomint(2) == 0)
		{
			self.zombie_arms_position = "up";
		}
		else
		{
			self.zombie_arms_position = "down";
		}
	}
	self.zombie_move_speed = "walk";
	self.variant_type = randomint(level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position]);
	self.zombie_think_done = 1;
	self setavoidancemask("avoid none");
	self collidewithactors(0);
	self setplayercollision(0);
	self.var_ccefa6dd = 1;
}

/*
	Name: function_cea6c2e0
	Namespace: cschashed-2\script_36e38dfef83cf452
	Checksum: 0x7EB0B731
	Offset: 0x4E8
	Size: 0x7C
	Parameters: 4
	Flags: Linked
*/
function function_cea6c2e0(entity, attribute, oldvalue, value)
{
	if(value === 1)
	{
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	}
	else
	{
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	}
}

