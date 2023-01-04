// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

#namespace remote_missile_target_lockon;

/*
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0x5426BA08
	Offset: 0xF8
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function register(uid)
{
	object = new var_24ac3512();
	[[ object ]]->__constructor();
	elem = object;
	[[ elem ]]->setup_clientfields(uid);
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_target_lockon
	Checksum: 0x3D099F08
	Offset: 0x140
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, persistent = 0)
{
	[[ self ]]->open(player, persistent);
}

/*
	Name: close
	Namespace: remote_missile_target_lockon
	Checksum: 0x80509D40
	Offset: 0x180
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: remote_missile_target_lockon
	Checksum: 0xEFDEC9CD
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3b7b386a
	Namespace: remote_missile_target_lockon
	Checksum: 0x8EE83BC6
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_3b7b386a(player, value)
{
	[[ self ]]->function_3b7b386a(player, value);
}

/*
	Name: function_2ecbc83c
	Namespace: remote_missile_target_lockon
	Checksum: 0xE63D3D36
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_2ecbc83c(player, value)
{
	[[ self ]]->function_2ecbc83c(player, value);
}

/*
	Name: function_505f092a
	Namespace: remote_missile_target_lockon
	Checksum: 0xC3390F80
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_505f092a(player, value)
{
	[[ self ]]->function_505f092a(player, value);
}

/*
	Name: function_b9d6aaa7
	Namespace: remote_missile_target_lockon
	Checksum: 0xB64F83FF
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_b9d6aaa7(player, value)
{
	[[ self ]]->function_b9d6aaa7(player, value);
}

#namespace namespace_24ac3512;

/*
	Name: __constructor
	Namespace: namespace_24ac3512
	Checksum: 0xD290F05B
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: Linked, 8
*/
function __constructor()
{
	namespace_6aaccc24::__constructor();
}

/*
	Name: setup_clientfields
	Namespace: namespace_24ac3512
	Checksum: 0x2C552A0C
	Offset: 0x2B0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function setup_clientfields(uid)
{
	namespace_6aaccc24::setup_clientfields(uid);
	namespace_6aaccc24::function_da693cbe("clientnum", 1, 7, "int");
	namespace_6aaccc24::function_da693cbe("target_locked", 1, 1, "int");
	namespace_6aaccc24::function_da693cbe("isHawkTag", 13000, 1, "int");
	namespace_6aaccc24::function_da693cbe("killed", 13000, 1, "int");
}

/*
	Name: open
	Namespace: namespace_24ac3512
	Checksum: 0x2D4AD92F
	Offset: 0x380
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function open(player, persistent = 0)
{
	namespace_6aaccc24::function_8b8089ba(player, "remote_missile_target_lockon", persistent);
}

/*
	Name: close
	Namespace: namespace_24ac3512
	Checksum: 0x20F4DD30
	Offset: 0x3D0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	namespace_6aaccc24::function_a68f6e20(player);
}

/*
	Name: function_3b7b386a
	Namespace: namespace_24ac3512
	Checksum: 0x6AF702C4
	Offset: 0x400
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_3b7b386a(player, value)
{
	player clientfield::function_9bf78ef8(self.var_47e79fc, "clientnum", value);
}

/*
	Name: function_2ecbc83c
	Namespace: namespace_24ac3512
	Checksum: 0x3B243AA6
	Offset: 0x448
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_2ecbc83c(player, value)
{
	player clientfield::function_9bf78ef8(self.var_47e79fc, "target_locked", value);
}

/*
	Name: function_505f092a
	Namespace: namespace_24ac3512
	Checksum: 0x66559755
	Offset: 0x490
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_505f092a(player, value)
{
	player clientfield::function_9bf78ef8(self.var_47e79fc, "isHawkTag", value);
}

/*
	Name: function_b9d6aaa7
	Namespace: namespace_24ac3512
	Checksum: 0x892D7DE5
	Offset: 0x4D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_b9d6aaa7(player, value)
{
	player clientfield::function_9bf78ef8(self.var_47e79fc, "killed", value);
}

/*
	Name: __destructor
	Namespace: namespace_24ac3512
	Checksum: 0x6CAF8E6C
	Offset: 0x520
	Size: 0x14
	Parameters: 0
	Flags: Linked, 16, 128
*/
function __destructor()
{
	namespace_6aaccc24::__destructor();
}

#namespace remote_missile_target_lockon;

/*
	Name: function_24ac3512
	Namespace: remote_missile_target_lockon
	Checksum: 0xEF188D72
	Offset: 0x540
	Size: 0x386
	Parameters: 0
	Flags: AutoExec, Private, 128
*/
private autoexec function function_24ac3512()
{
	classes.var_24ac3512[0] = spawnstruct();
	classes.var_24ac3512[0].__vtable[1500549600] = &namespace_6aaccc24::function_a68f6e20;
	classes.var_24ac3512[0].__vtable[2080182502] = &namespace_6aaccc24::function_7bfd10e6;
	classes.var_24ac3512[0].__vtable[1954510406] = &namespace_6aaccc24::function_8b8089ba;
	classes.var_24ac3512[0].__vtable[702532567] = &namespace_6aaccc24::function_d6203429;
	classes.var_24ac3512[0].__vtable[1329274013] = &namespace_6aaccc24::function_b0c4e363;
	classes.var_24ac3512[0].__vtable[592229248] = &namespace_6aaccc24::function_dcb34c80;
	classes.var_24ac3512[0].__vtable[630637378] = &namespace_6aaccc24::function_da693cbe;
	classes.var_24ac3512[0].__vtable[1855416484] = &namespace_6aaccc24::setup_clientfields;
	classes.var_24ac3512[0].__vtable[674154906] = &namespace_6aaccc24::__constructor;
	classes.var_24ac3512[0].__vtable[913321084] = &namespace_24ac3512::__destructor;
	classes.var_24ac3512[0].__vtable[1177113945] = &namespace_24ac3512::function_b9d6aaa7;
	classes.var_24ac3512[0].__vtable[1348405546] = &namespace_24ac3512::function_505f092a;
	classes.var_24ac3512[0].__vtable[785107004] = &namespace_24ac3512::function_2ecbc83c;
	classes.var_24ac3512[0].__vtable[997931114] = &namespace_24ac3512::function_3b7b386a;
	classes.var_24ac3512[0].__vtable[1516492343] = &namespace_24ac3512::close;
	classes.var_24ac3512[0].__vtable[250899321] = &namespace_24ac3512::open;
	classes.var_24ac3512[0].__vtable[1855416484] = &namespace_24ac3512::setup_clientfields;
	classes.var_24ac3512[0].__vtable[674154906] = &namespace_24ac3512::__constructor;
}

