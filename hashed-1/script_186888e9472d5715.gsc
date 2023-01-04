// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;

#namespace cschashed-3\script_7775dce934ff5da9;

/*
	Name: function_89f2df9
	Namespace: cschashed-3\script_7775dce934ff5da9
	Checksum: 0x813CEADE
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_731ab037ad2e053c", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-3\script_7775dce934ff5da9
	Checksum: 0x49D19151
	Offset: 0xD0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	spawner::add_archetype_spawn_function(#"zombie", &function_c381536b);
	/#
		zm_devgui::function_c7dd7a17("", "");
	#/
}

/*
	Name: __main__
	Namespace: cschashed-3\script_7775dce934ff5da9
	Checksum: 0x80F724D1
	Offset: 0x138
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function __main__()
{
}

/*
	Name: function_c381536b
	Namespace: cschashed-3\script_7775dce934ff5da9
	Checksum: 0xD593BED8
	Offset: 0x148
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
private function function_c381536b()
{
	if(isdefined(self.entity_type) && self.entity_type == #"mannequin")
	{
		self.var_80d367d8 = 1;
	}
}

