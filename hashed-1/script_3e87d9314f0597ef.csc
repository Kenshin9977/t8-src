// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-1\script_3e87d9314f0597ef;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_3e87d9314f0597ef
	Checksum: 0x4C20C84F
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_145b120e873ea191", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-1\script_3e87d9314f0597ef
	Checksum: 0x19971E06
	Offset: 0x148
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	clientfield::register("scriptmover", "random_vapor_altar_available", 1, 1, "int", &function_df8a8908, 0, 0);
	level._effect[#"random_vapor_altar_available"] = "zombie/fx_powerup_on_green_zmb";
}

/*
	Name: function_df8a8908
	Namespace: cschashed-1\script_3e87d9314f0597ef
	Checksum: 0xB478B3A
	Offset: 0x1C8
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_df8a8908(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		if(!isdefined(self.var_476bef54))
		{
			self.var_476bef54 = util::playfxontag(localclientnum, level._effect[#"random_vapor_altar_available"], self, "tag_origin");
		}
	}
	else if(isdefined(self.var_476bef54))
	{
		stopfx(localclientnum, self.var_476bef54);
	}
}

