// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-1\script_1edaf4333ed0bece;

/*
	Name: init
	Namespace: cschashed-1\script_1edaf4333ed0bece
	Checksum: 0xB04C3281
	Offset: 0x130
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "gear_box_spark", 24000, 1, "int", &function_3d076ada, 0, 0);
	clientfield::register("scriptmover", "flinger_impact_wood", 24000, 1, "int", &function_632b4139, 0, 0);
	clientfield::register("clientuimodel", "ZMInventoryPersonal.heat_pack", 1, 1, "int", undefined, 0, 0);
	level._effect[#"hash_5bea6497d336bbf"] = #"hash_299249c1ff22e1c2";
	level._effect[#"flinger_impact_wood"] = #"hash_7677e82b27eada6f";
	forcestreamxmodel("p8_zm_ora_crate_wood_01_tall_open_lid_dmg");
}

/*
	Name: function_3d076ada
	Namespace: cschashed-1\script_1edaf4333ed0bece
	Checksum: 0x40270E23
	Offset: 0x280
	Size: 0xBE
	Parameters: 7
	Flags: Linked
*/
function function_3d076ada(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"hash_5bea6497d336bbf"], self, "tag_generator");
	}
	else if(isdefined(self.var_91180673))
	{
		stopfx(localclientnum, self.var_91180673);
		self.var_91180673 = undefined;
	}
}

/*
	Name: function_632b4139
	Namespace: cschashed-1\script_1edaf4333ed0bece
	Checksum: 0xCCFE278C
	Offset: 0x348
	Size: 0x82
	Parameters: 7
	Flags: Linked
*/
function function_632b4139(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"flinger_impact_wood"], self, "tag_origin");
	}
}

