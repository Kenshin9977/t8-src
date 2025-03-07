// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\lui_shared.csc;

#namespace zm_arcade_timer;

/*
	Name: register
	Namespace: zm_arcade_timer
	Checksum: 0x2A58250A
	Offset: 0xD0
	Size: 0x70
	Parameters: 5
	Flags: None
*/
function register(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059)
{
	object = new var_b9aee0cd();
	[[ object ]]->__constructor();
	elem = object;
	[[ elem ]]->setup_clientfields(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059);
	return elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_arcade_timer
	Checksum: 0xA759B441
	Offset: 0x148
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_5c1bb138(uid)
{
	object = new var_b9aee0cd();
	[[ object ]]->__constructor();
	elem = object;
	[[ elem ]]->function_5c1bb138(uid);
	return elem;
}

/*
	Name: open
	Namespace: zm_arcade_timer
	Checksum: 0x6247FFF2
	Offset: 0x190
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: zm_arcade_timer
	Checksum: 0xC41C8C3F
	Offset: 0x1B8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_arcade_timer
	Checksum: 0xEDFB820
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_7954feaf
	Namespace: zm_arcade_timer
	Checksum: 0x40403259
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7954feaf(localclientnum, value)
{
	[[ self ]]->function_7954feaf(localclientnum, value);
}

/*
	Name: function_c48569e7
	Namespace: zm_arcade_timer
	Checksum: 0xC416F0F4
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c48569e7(localclientnum, value)
{
	[[ self ]]->function_c48569e7(localclientnum, value);
}

/*
	Name: function_21eb67aa
	Namespace: zm_arcade_timer
	Checksum: 0xFD822439
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_21eb67aa(localclientnum, value)
{
	[[ self ]]->function_21eb67aa(localclientnum, value);
}

/*
	Name: function_28ccc05d
	Namespace: zm_arcade_timer
	Checksum: 0xD3600D3C
	Offset: 0x298
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_28ccc05d(localclientnum, value)
{
	[[ self ]]->function_28ccc05d(localclientnum, value);
}

#namespace namespace_b9aee0cd;

/*
	Name: __constructor
	Namespace: namespace_b9aee0cd
	Checksum: 0x31D99A06
	Offset: 0x2C8
	Size: 0x14
	Parameters: 0
	Flags: 8
*/
function __constructor()
{
	namespace_6aaccc24::__constructor();
}

/*
	Name: setup_clientfields
	Namespace: namespace_b9aee0cd
	Checksum: 0x5FB7986
	Offset: 0x2E8
	Size: 0xE4
	Parameters: 5
	Flags: None
*/
function setup_clientfields(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059)
{
	namespace_6aaccc24::setup_clientfields(uid);
	namespace_6aaccc24::function_da693cbe("showzero", 1, 1, "int", var_8fd8bfaa);
	namespace_6aaccc24::function_da693cbe("seconds", 1, 6, "int", var_b1de907e);
	namespace_6aaccc24::function_da693cbe("minutes", 1, 4, "int", var_359a4d9a);
	namespace_6aaccc24::function_dcb34c80("string", "title", 1);
}

/*
	Name: function_5c1bb138
	Namespace: namespace_b9aee0cd
	Checksum: 0x27725EB9
	Offset: 0x3D8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_5c1bb138(uid)
{
	namespace_6aaccc24::function_5c1bb138(uid);
}

/*
	Name: function_fa582112
	Namespace: namespace_b9aee0cd
	Checksum: 0x6AB17A46
	Offset: 0x408
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_fa582112(localclientnum)
{
	namespace_6aaccc24::function_fa582112(localclientnum);
	[[ self ]]->function_d7d2fcce(localclientnum, "showzero", 0);
	[[ self ]]->function_d7d2fcce(localclientnum, "seconds", 0);
	[[ self ]]->function_d7d2fcce(localclientnum, "minutes", 0);
	[[ self ]]->function_d7d2fcce(localclientnum, "title", #"");
}

/*
	Name: open
	Namespace: namespace_b9aee0cd
	Checksum: 0x42D913AD
	Offset: 0x4B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function open(localclientnum)
{
	namespace_6aaccc24::open(localclientnum, #"zm_arcade_timer");
}

/*
	Name: function_7954feaf
	Namespace: namespace_b9aee0cd
	Checksum: 0x2D8946B8
	Offset: 0x4F0
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function function_7954feaf(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "showzero", value);
}

/*
	Name: function_c48569e7
	Namespace: namespace_b9aee0cd
	Checksum: 0x5AC68377
	Offset: 0x528
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function function_c48569e7(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "seconds", value);
}

/*
	Name: function_21eb67aa
	Namespace: namespace_b9aee0cd
	Checksum: 0x8EE5E467
	Offset: 0x560
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function function_21eb67aa(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "minutes", value);
}

/*
	Name: function_28ccc05d
	Namespace: namespace_b9aee0cd
	Checksum: 0xA6E6A9E0
	Offset: 0x598
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function function_28ccc05d(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "title", value);
}

/*
	Name: __destructor
	Namespace: namespace_b9aee0cd
	Checksum: 0x14004975
	Offset: 0x5D0
	Size: 0x14
	Parameters: 0
	Flags: 16, 128
*/
function __destructor()
{
	namespace_6aaccc24::__destructor();
}

#namespace zm_arcade_timer;

/*
	Name: function_b9aee0cd
	Namespace: zm_arcade_timer
	Checksum: 0xC025AD09
	Offset: 0x5F0
	Size: 0x416
	Parameters: 0
	Flags: AutoExec, Private, 128
*/
private autoexec function function_b9aee0cd()
{
	classes.var_b9aee0cd[0] = spawnstruct();
	classes.var_b9aee0cd[0].__vtable[1833276934] = &namespace_6aaccc24::function_92ba69fa;
	classes.var_b9aee0cd[0].__vtable[674038578] = &namespace_6aaccc24::function_d7d2fcce;
	classes.var_b9aee0cd[0].__vtable[1516492343] = &namespace_6aaccc24::close;
	classes.var_b9aee0cd[0].__vtable[632663907] = &namespace_6aaccc24::is_open;
	classes.var_b9aee0cd[0].__vtable[250899321] = &namespace_6aaccc24::open;
	classes.var_b9aee0cd[0].__vtable[94887662] = &namespace_6aaccc24::function_fa582112;
	classes.var_b9aee0cd[0].__vtable[1545318712] = &namespace_6aaccc24::function_5c1bb138;
	classes.var_b9aee0cd[0].__vtable[592229248] = &namespace_6aaccc24::function_dcb34c80;
	classes.var_b9aee0cd[0].__vtable[630637378] = &namespace_6aaccc24::function_da693cbe;
	classes.var_b9aee0cd[0].__vtable[1855416484] = &namespace_6aaccc24::setup_clientfields;
	classes.var_b9aee0cd[0].__vtable[674154906] = &namespace_6aaccc24::__constructor;
	classes.var_b9aee0cd[0].__vtable[913321084] = &namespace_b9aee0cd::__destructor;
	classes.var_b9aee0cd[0].__vtable[684507229] = &namespace_b9aee0cd::function_28ccc05d;
	classes.var_b9aee0cd[0].__vtable[569075626] = &namespace_b9aee0cd::function_21eb67aa;
	classes.var_b9aee0cd[0].__vtable[997889561] = &namespace_b9aee0cd::function_c48569e7;
	classes.var_b9aee0cd[0].__vtable[2035613359] = &namespace_b9aee0cd::function_7954feaf;
	classes.var_b9aee0cd[0].__vtable[250899321] = &namespace_b9aee0cd::open;
	classes.var_b9aee0cd[0].__vtable[94887662] = &namespace_b9aee0cd::function_fa582112;
	classes.var_b9aee0cd[0].__vtable[1545318712] = &namespace_b9aee0cd::function_5c1bb138;
	classes.var_b9aee0cd[0].__vtable[1855416484] = &namespace_b9aee0cd::setup_clientfields;
	classes.var_b9aee0cd[0].__vtable[674154906] = &namespace_b9aee0cd::__constructor;
}

