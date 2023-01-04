// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_61a734c95edc17aa;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace cschashed-1\script_4bb2b830876c4ad9;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_4bb2b830876c4ad9
	Checksum: 0x8244F3BE
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_177ea318753f5418", &__init__, undefined, #"bgb");
}

/*
	Name: __init__
	Namespace: cschashed-1\script_4bb2b830876c4ad9
	Checksum: 0x11E3193A
	Offset: 0x108
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register(#"hash_177ea318753f5418", "activated", 1, undefined, undefined, &validation, &activation);
	cschashed-1\script_3d4e88c949caf53e::function_9d4db403(#"hash_177ea318753f5418", 5);
	cschashed-1\script_3d4e88c949caf53e::function_430d063b(#"hash_177ea318753f5418");
	cschashed-1\script_3d4e88c949caf53e::function_a1194b9a(#"hash_177ea318753f5418");
	cschashed-1\script_3d4e88c949caf53e::function_4de6c08a(#"hash_177ea318753f5418");
}

/*
	Name: activation
	Namespace: cschashed-1\script_4bb2b830876c4ad9
	Checksum: 0x527DA651
	Offset: 0x210
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function activation()
{
	self zm_score::minus_to_player_score(500);
	self thread bgb::function_c6cd71d5("bonus_points_player_shared");
}

/*
	Name: validation
	Namespace: cschashed-1\script_4bb2b830876c4ad9
	Checksum: 0x12CD187A
	Offset: 0x258
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function validation()
{
	if(self zm_score::can_player_purchase(500) && self bgb::function_9d8118f5())
	{
		return 1;
	}
	return 0;
}

