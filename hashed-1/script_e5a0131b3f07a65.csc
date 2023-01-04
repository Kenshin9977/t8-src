// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_660bfc5cf7a0646b.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace cschashed-3\script_e5a0131b3f07a65;

/*
	Name: main
	Namespace: cschashed-3\script_e5a0131b3f07a65
	Checksum: 0x6D458533
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
	Namespace: cschashed-3\script_e5a0131b3f07a65
	Checksum: 0xBF72667D
	Offset: 0x160
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_13bfe0d8(localclientnum)
{
	setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 1);
}

