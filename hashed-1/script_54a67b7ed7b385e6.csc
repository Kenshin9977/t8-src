// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_442f1042340e6bf1.csc;
hashed-2\script_624a704d0f6bf28d.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-2\script_54a67b7ed7b385e6;

/*
	Name: init
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0x7547320B
	Offset: 0xC0
	Size: 0x374
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level._effect[#"hash_4d9406530777d95"] = #"hash_643bd3983b610945";
	level._effect[#"hash_169b53a5e4572fdc"] = #"hash_10fc174d8f84f900";
	level._effect[#"clue_fx"] = #"zombie/fx_ritual_glow_relic_zod_zmb";	level._effect[#"hash_7b35aca6ba425fdc"] = #"hash_73a1b4258b95cb4a";
	level._effect[#"hash_3547af665773df36"] = #"hash_4174a5c725649d80";
	level._effect[#"hash_619321730ebe1b49"] = #"hash_1a14ad689ef08a0d";
	level._effect[#"hash_e24c17449fcb2f6"] = #"hash_24fc9882ede4f23c";
	level._effect[#"hash_39f5cccf6d3254d0"] = #"hash_39d7ae4b883e7e75";
	var_a066b028 = struct::get_array(#"hash_396f65af88a25e7d");
	foreach(var_d6524d4e in var_a066b028)
	{
		cschashed-2\script_624a704d0f6bf28d::function_d8383812(s_chest.script_noteworthy, 1, s_chest.script_noteworthy, 400, level._effect[#"hash_4d9406530777d95"], level._effect[#"hash_169b53a5e4572fdc"]);
	}
	clientfield::register("scriptmover", "" + #"clue_fx", 1, 1, "int", &clue_fx, 0, 0);	clientfield::register("scriptmover", "" + #"despawn_fx", 1, 1, "int", &despawn_fx, 0, 0);	clientfield::register("scriptmover", "" + #"hash_1c8f8a5e03b36070", 1, 1, "int", &function_65b179f4, 0, 0);
}

/*
	Name: function_65b179f4
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0x681A09EC
	Offset: 0x440
	Size: 0x192
	Parameters: 7
	Flags: Linked
*/
function function_65b179f4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(self.model)
	{
		case "hash_3f1a1b12f956a381":
		{
			util::playfxontag(localclientnum, level._effect[#"hash_619321730ebe1b49"], self, "tag_origin");
			break;
		}
		case "hash_33896cd3e525552b":
		{
			util::playfxontag(localclientnum, level._effect[#"hash_3547af665773df36"], self, "tag_origin");
			break;
		}
		case "hash_5c6262e324d23668":
		{
			util::playfxontag(localclientnum, level._effect[#"hash_e24c17449fcb2f6"], self, "tag_origin");
			break;
		}
		case "hash_63663ddb971b5932":
		{
			util::playfxontag(localclientnum, level._effect[#"hash_39f5cccf6d3254d0"], self, "tag_origin");
			break;
		}
	}
}

/*
	Name: despawn_fx
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0x5F8A1D69
	Offset: 0x5E0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function despawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		self callback::on_shutdown(&function_3ad76adb);
	}
}

/*
	Name: function_3ad76adb
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0x6FA5406
	Offset: 0x658
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_3ad76adb(localclientnum)
{
	if(isdefined(self))
	{
		playfx(localclientnum, level._effect[#"despawn_fx"], self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));	}
}

/*
	Name: clue_fx
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0xC30B594B
	Offset: 0x6F0
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function clue_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval == 1)
	{
		self.var_eabea138 = playfx(localclientnum, level._effect[#"clue_fx"], self.origin - vectorscale((0, 0, 1), 6));		self callback::on_shutdown(&function_e3bb737c);
	}
}

/*
	Name: function_e3bb737c
	Namespace: cschashed-2\script_54a67b7ed7b385e6
	Checksum: 0xE92A376E
	Offset: 0x7B8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_e3bb737c(localclientnum)
{
	if(isdefined(self.var_eabea138))
	{
		killfx(localclientnum, self.var_eabea138);
	}
}

