// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-1\script_3c362258ff800237.csc;
hashed-1\script_3d5821d793ed4c6.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\util.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace cschashed-3\script_1793e0dffb81a6c8;

/*
	Name: function_89f2df9
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0xDCE5876C
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_4ef9c479ac8da304", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0xFAE2A981
	Offset: 0x150
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function __init__()
{
	if(!cschashed-1\script_3c362258ff800237::function_b47f6aba())
	{
		return;
	}
	clientfield::register("zbarrier", "" + #"hash_100f180bf5d2a517", 14000, 1, "int", &function_b245db69, 0, 0);
	level._effect[#"hash_1d15a2dad558ac8c"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
	level._effect[#"hash_1d15a5dad558b1a5"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_28d1b9857e2ca681", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0x4FB3E590
	Offset: 0x258
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
private function function_d1de6a85(localclientnum, a_params)
{
}

/*
	Name: function_9e7b3f4d
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0x90276D0F
	Offset: 0x278
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(localclientnum)
{
}

/*
	Name: is_active
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0x3BFD374D
	Offset: 0x290
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = cschashed-1\script_3c362258ff800237::function_a36e8c38(#"hash_28d1b9857e2ca681");
	return isdefined(challenge);
}

/*
	Name: function_b245db69
	Namespace: cschashed-3\script_1793e0dffb81a6c8
	Checksum: 0x20F9042F
	Offset: 0x2D0
	Size: 0x224
	Parameters: 7
	Flags: Private
*/
private function function_b245db69(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		if(isdefined(self.var_18f8b30b))
		{
			self.var_18f8b30b delete();
		}
		if(isdefined(self.var_3b071bba))
		{
			deletefx(localclientnum, self.var_3b071bba);
			self.var_3b071bba = undefined;
		}
		if(zm_utility::function_166646a6() == 1)
		{
			self.var_18f8b30b = util::spawn_model(localclientnum, "tag_origin", self.origin, self.angles);
			self.var_3b071bba = util::playfxontag(localclientnum, level._effect[#"hash_1d15a2dad558ac8c"], self.var_18f8b30b, "tag_origin");
		}
		else
		{
			self.var_18f8b30b = util::spawn_model(localclientnum, "tag_origin", self.origin, self.angles);
			self.var_3b071bba = util::playfxontag(localclientnum, level._effect[#"hash_1d15a5dad558b1a5"], self.var_18f8b30b, "tag_origin");
		}
	}
	else if(isdefined(self.var_3b071bba))
	{
		deletefx(localclientnum, self.var_3b071bba);
		self.var_3b071bba = undefined;
	}
	if(isdefined(self.var_18f8b30b))
	{
		self.var_18f8b30b delete();
	}
}

