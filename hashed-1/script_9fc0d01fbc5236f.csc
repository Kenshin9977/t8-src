// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-2\script_9fc0d01fbc5236f;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_9fc0d01fbc5236f
	Checksum: 0x2BD2C8EE
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_435f2e0dff1c53c7", &init, undefined, undefined);
}

/*
	Name: init
	Namespace: cschashed-2\script_9fc0d01fbc5236f
	Checksum: 0xB0629EDB
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("zbarrier", "" + #"hash_7e15d8abc4d6c79a", 1, 1, "int", &function_32f95e3f, 0, 0);
}

/*
	Name: function_32f95e3f
	Namespace: cschashed-2\script_9fc0d01fbc5236f
	Checksum: 0x9583B5A3
	Offset: 0x160
	Size: 0x126
	Parameters: 7
	Flags: Linked
*/
function function_32f95e3f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		for(i = 0; i < self getnumzbarrierpieces(); i++)
		{
			var_a6b8d2c2 = self zbarriergetpiece(i);
			var_a6b8d2c2 function_bf9d3071("rob_zm_office_debris_clear");
		}
	}
	else
	{
		for(i = 0; i < self getnumzbarrierpieces(); i++)
		{
			var_a6b8d2c2 = self zbarriergetpiece(i);
			var_a6b8d2c2 function_5d482e78("rob_zm_office_debris_clear");
		}
	}
}

