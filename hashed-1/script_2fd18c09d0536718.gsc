// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ba429aee;

/*
	Name: function_89f2df9
	Namespace: namespace_ba429aee
	Checksum: 0x7E4B9B3D
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_22ac53d66b75dfae", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ba429aee
	Checksum: 0x82DB74A1
	Offset: 0xC8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!cschashed-1\script_3c362258ff800237::function_b47f6aba())
	{
		return;
	}
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_16444bcd852f0a0b", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_ba429aee
	Checksum: 0x8CE822B5
	Offset: 0x130
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
private function function_d1de6a85(var_ff22cb62)
{
	self.var_ff22cb62 = cschashed-1\script_3c362258ff800237::function_5769f26a(var_ff22cb62);
	self.var_6a7521e3 = 0;
	self thread function_53627246();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_ba429aee
	Checksum: 0x37885646
	Offset: 0x188
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
private function function_9e7b3f4d(round_reset)
{
	cschashed-1\script_3d5821d793ed4c6::function_f3dbeda7();
	foreach(s_portal in level.var_63fca02d)
	{
		s_portal.var_5b12474a = undefined;
	}
	if(!round_reset)
	{
		if(self.var_6a7521e3 < self.var_ff22cb62)
		{
			cschashed-1\script_3c362258ff800237::fail(#"hash_6a1df2dbfb66a948");
		}
	}
}

/*
	Name: function_53627246
	Namespace: namespace_ba429aee
	Checksum: 0x4B0C130E
	Offset: 0x258
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
private function function_53627246()
{
	level endon(#"hash_7646638df88a3656", #"end_game");
	cschashed-1\script_3d5821d793ed4c6::function_2976fa44(self.var_ff22cb62);
	cschashed-1\script_3d5821d793ed4c6::function_dace284(self.var_6a7521e3);
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"portal_used");
		if(!(isdefined(var_be17187b.s_portal.var_5b12474a) && var_be17187b.s_portal.var_5b12474a))
		{
			var_be17187b.s_portal.var_5b12474a = 1;
			self.var_6a7521e3++;
			cschashed-1\script_3d5821d793ed4c6::function_dace284(self.var_6a7521e3);
		}
		if(self.var_6a7521e3 == self.var_ff22cb62)
		{
			cschashed-1\script_3d5821d793ed4c6::function_7d32b7d0(1);
			break;
		}
	}
}

