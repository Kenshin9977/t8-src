// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-1\script_5a012bbb9342dbdf;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_5a012bbb9342dbdf
	Checksum: 0x2375DF0
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_3997833cc3034f0", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-1\script_5a012bbb9342dbdf
	Checksum: 0x377DCECC
	Offset: 0xC0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
private function __init__()
{
	ai::add_ai_spawn_function(&function_f3a051c6);
}

/*
	Name: function_f3a051c6
	Namespace: cschashed-1\script_5a012bbb9342dbdf
	Checksum: 0xFCBDAB69
	Offset: 0xF0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
private function function_f3a051c6(localclientnum)
{
}

