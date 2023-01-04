// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-3\script_20422991283c1b8.csc;
hashed-2\script_387ae8d7955ac404.csc;
hashed-2\script_442a4e554bcd7c3b.csc;
hashed-1\script_4b4a4b9186e38fd6.csc;
hashed-1\script_4c875fef517e2061.csc;
hashed-1\script_6fdaa897ed596805.csc;
hashed-2\script_763e5f4b26b4d8ce.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace cschashed-1\script_7d5f2f51e8a5443d;

/*
	Name: preload
	Namespace: cschashed-1\script_7d5f2f51e8a5443d
	Checksum: 0xD8ECAD75
	Offset: 0xD8
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function preload()
{
	cschashed-2\script_442a4e554bcd7c3b::preload();
	cschashed-2\script_763e5f4b26b4d8ce::preload();
	cschashed-3\script_20422991283c1b8::preload();
	cschashed-1\script_4b4a4b9186e38fd6::preload();
	cschashed-1\script_6fdaa897ed596805::preload();
	cschashed-2\script_387ae8d7955ac404::preload();
	clientfield::register("toplayer", "" + #"hash_668f474410d5c1d0", 24000, 1, "int", &clear_hud, 0, 0);
}

/*
	Name: clear_hud
	Namespace: cschashed-1\script_7d5f2f51e8a5443d
	Checksum: 0x71D1A945
	Offset: 0x1A0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function clear_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self zm::function_92f0c63(localclientnum);
	self cschashed-1\script_4c875fef517e2061::function_25410869(localclientnum);
}

