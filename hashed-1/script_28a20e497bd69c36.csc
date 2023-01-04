// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-1\script_1e34fbb210f87b6f.csc;
hashed-2\script_84f5590d2ac48f8.csc;
hashed-3\script_d116a14142e2250.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-2\script_28a20e497bd69c36;

/*
	Name: init
	Namespace: cschashed-2\script_28a20e497bd69c36
	Checksum: 0x3842B028
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	full_screen_movie::register("full_screen_movie");
	callback::on_localplayer_spawned(&on_localplayer_spawned);
}

/*
	Name: on_localplayer_spawned
	Namespace: cschashed-2\script_28a20e497bd69c36
	Checksum: 0xCB5F3ECE
	Offset: 0xF8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function on_localplayer_spawned()
{
	e_player = self;
	e_player function_12a6f77e();
}

