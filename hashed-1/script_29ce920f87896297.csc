// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-3\script_ac6a30f1991e105.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-2\script_29ce920f87896297;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_29ce920f87896297
	Checksum: 0xD02EBC30
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"blight_father", &__init__, undefined, undefined);
}

/*
	Name: precache
	Namespace: cschashed-2\script_29ce920f87896297
	Checksum: 0x8DD4106B
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
autoexec function precache()
{
	ai::add_archetype_spawn_function(#"blight_father", &function_859ccb1e);
}

/*
	Name: __init__
	Namespace: cschashed-2\script_29ce920f87896297
	Checksum: 0x80F724D1
	Offset: 0x118
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
}

/*
	Name: function_859ccb1e
	Namespace: cschashed-2\script_29ce920f87896297
	Checksum: 0x2988A9B8
	Offset: 0x128
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
private function function_859ccb1e(localclientnum)
{
	fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
	self mapshaderconstant(localclientnum, 0, "scriptVector2", 1, 0, 0, 1);
}

