// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-1\script_3c362258ff800237.csc;
hashed-1\script_3d5821d793ed4c6.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-3\script_45657e86e8f90414;

/*
	Name: function_89f2df9
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0xE11F5AFB
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_281322718ac3cd88", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0xC6F92F2F
	Offset: 0xF8
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
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_64d77357e69aee75", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0x8A779047
	Offset: 0x160
	Size: 0x42
	Parameters: 2
	Flags: Private
*/
private function function_d1de6a85(localclientnum, a_params)
{
	level.var_e91491fb = (isdefined(a_params[0]) ? a_params[0] : "movement");
}

/*
	Name: function_9e7b3f4d
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0xFA366148
	Offset: 0x1B0
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(round_reset)
{
	level.var_e91491fb = undefined;
}

/*
	Name: is_active
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0x9040C5FB
	Offset: 0x1D0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	s_challenge = cschashed-1\script_3c362258ff800237::function_a36e8c38(#"hash_64d77357e69aee75");
	return isdefined(s_challenge);
}

/*
	Name: function_26f124d8
	Namespace: cschashed-3\script_45657e86e8f90414
	Checksum: 0x9DFFCC14
	Offset: 0x210
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_26f124d8()
{
	if(!isdefined(level.var_e91491fb))
	{
		return 1;
	}
	switch(level.var_e91491fb)
	{
		case "ads":
		{
			if(self isplayerads())
			{
				return 1;
			}
			return 0;
		}
		case "jump":
		{
			if(self isplayerjumping())
			{
				return 1;
			}
			return 0;
		}
		case "slide":
		{
			if(self isplayersliding())
			{
				return 1;
			}
			return 0;
		}
		case "hash_6c6c8f6b349b8751":
		{
			if(self isplayerjumping() || self isplayersliding())
			{
				return 1;
			}
			return 0;
		}
		case "crouch":
		{
			if(self getstance() === "crouch")
			{
				return 1;
			}
			return 0;
		}
		case "prone":
		{
			if(self getstance() === "prone")
			{
				return 1;
			}
			return 0;
		}
		case "movement":
		default:
		{
			v_velocity = self getvelocity();
			if(length(v_velocity) != 0)
			{
				return 1;
			}
			return 0;
		}
	}
	return 0;
}

