// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_660bfc5cf7a0646b.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace cschashed-2\script_243db9cae90f57c9;

/*
	Name: main
	Namespace: cschashed-2\script_243db9cae90f57c9
	Checksum: 0xEAE1C030
	Offset: 0xA0
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	cschashed-2\script_660bfc5cf7a0646b::main(eventstruct);
	level.var_7a973c0e = createuimodel(getglobaluimodel(), "ZMHudGlobal.tcm");
	setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 0);
	callback::on_localplayer_spawned(&function_13bfe0d8);
}

/*
	Name: function_13bfe0d8
	Namespace: cschashed-2\script_243db9cae90f57c9
	Checksum: 0xF196BFDA
	Offset: 0x160
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_13bfe0d8(localclientnum)
{
	setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 4);
}

