// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_bc25dada;

/*
	Name: function_89f2df9
	Namespace: namespace_bc25dada
	Checksum: 0x2BEFB5DA
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_4d627d417c74336d", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bc25dada
	Checksum: 0xA8E3F864
	Offset: 0xF0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function __init__()
{
	if(!cschashed-1\script_3c362258ff800237::function_b47f6aba())
	{
		return;
	}
	cschashed-1\script_3c362258ff800237::register_challenge(#"distance_traveled", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_bc25dada
	Checksum: 0x7D34BC55
	Offset: 0x158
	Size: 0x18E
	Parameters: 1
	Flags: Private
*/
private function function_d1de6a85(var_38282db8)
{
	var_38282db8 = cschashed-1\script_3c362258ff800237::function_5769f26a(var_38282db8);
	foreach(player in getplayers())
	{
		player thread function_ed4d5d4(var_38282db8);
	}
	level.var_4220f02a = array(getweapon(#"launcher_standard_t8"), getweapon(#"hash_138efe2bb30be63c"), getweapon(#"hash_138f012bb30beb55"), getweapon(#"hash_46ad37ce8122812e"), getweapon(#"hash_138f002bb30be9a2"), getweapon(#"hash_3a8348f19a7e7629"));
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_bc25dada
	Checksum: 0x9FE3FEF9
	Offset: 0x2F0
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(round_reset)
{
	level.var_4220f02a = undefined;
}

/*
	Name: is_active
	Namespace: namespace_bc25dada
	Checksum: 0x78DBB6E7
	Offset: 0x310
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = cschashed-1\script_3c362258ff800237::function_a36e8c38(#"distance_traveled");
	return isdefined(challenge);
}

/*
	Name: function_ed4d5d4
	Namespace: namespace_bc25dada
	Checksum: 0x6E3F831A
	Offset: 0x350
	Size: 0x248
	Parameters: 1
	Flags: None
*/
function function_ed4d5d4(var_38282db8)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"end_game", #"hash_43a461e5c99d52a0");
	n_distance_traveled = 0;
	self cschashed-1\script_3d5821d793ed4c6::function_2190356a(int(n_distance_traveled), 1);
	self cschashed-1\script_3d5821d793ed4c6::function_c2cd0cba(var_38282db8);
	wait(12);
	var_31409e15 = self.origin;
	while(true)
	{
		var_abf38d09 = distance(self.origin, var_31409e15) * 0.0254;
		if(isalive(self))
		{
			if(self function_e7985d50())
			{
				while(self function_e7985d50())
				{
					var_31409e15 = self.origin;
					waitframe(1);
				}
			}
			else
			{
				var_d114080c = var_d114080c + var_abf38d09;
			}
		}
		if(var_d114080c < var_38282db8)
		{
			self cschashed-1\script_3d5821d793ed4c6::function_2190356a(int(n_distance_traveled), 1);
			self cschashed-1\script_3d5821d793ed4c6::function_c2cd0cba(var_38282db8);
		}
		else
		{
			self cschashed-1\script_3d5821d793ed4c6::function_2190356a(var_38282db8);
			self cschashed-1\script_3d5821d793ed4c6::function_c2cd0cba(var_38282db8);
			cschashed-1\script_3c362258ff800237::fail(#"hash_1ab078fa9460e7c9", array(self));
			level notify(#"hash_43a461e5c99d52a0");
			return;
		}
		var_31409e15 = self.origin;
		waitframe(1);
	}
}

/*
	Name: function_e7985d50
	Namespace: namespace_bc25dada
	Checksum: 0x6B2D3A17
	Offset: 0x5A0
	Size: 0x140
	Parameters: 0
	Flags: None
*/
function function_e7985d50()
{
	if(isdefined(self.var_16735873) && self.var_16735873 || self util::function_88c74107() || (isdefined(self.var_ffe2c4d7) && self.var_ffe2c4d7) || (isdefined(self.var_25c3de32) && self.var_25c3de32))
	{
		return 1;
	}
	w_weapon = self getcurrentweapon();
	w_weapon = zm_weapons::get_base_weapon(w_weapon);
	var_f77522bb = self getnormalizedmovement();
	if(isarray(level.var_4220f02a) && self isfiring() && isinarray(level.var_4220f02a, w_weapon) && var_f77522bb == (0, 0, 0))
	{
		return 1;
	}
	return 0;
}

