// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_624a704d0f6bf28d.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-1\script_6fdaa897ed596805;

/*
	Name: preload
	Namespace: cschashed-1\script_6fdaa897ed596805
	Checksum: 0xFAF84FC3
	Offset: 0x108
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function preload()
{
	level._effect[#"hash_1dee7be0bae904ec"] = #"hash_59977c4c851916e0";
	level._effect[#"hash_1549a7f7c4a3d66e"] = #"hash_1a06427eff8dfe13";
	level._effect[#"hash_1e2cc2b2aae8672a"] = #"hash_c25bcbc2422f364";
	level._effect[#"hash_430c8a8704e0d2af"] = #"hash_4847c0d5a4c9cd6";
	init_clientfields();
}

/*
	Name: main
	Namespace: cschashed-1\script_6fdaa897ed596805
	Checksum: 0x80F724D1
	Offset: 0x1E8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function main()
{
}

/*
	Name: init_clientfields
	Namespace: cschashed-1\script_6fdaa897ed596805
	Checksum: 0x26B8E379
	Offset: 0x1F8
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	cschashed-2\script_624a704d0f6bf28d::function_d8383812(#"sc_pap_beach", 24000, "sc_pap_beach", 400, level._effect[#"hash_1dee7be0bae904ec"], level._effect[#"hash_1549a7f7c4a3d66e"], undefined, undefined, 1);
	cschashed-2\script_624a704d0f6bf28d::function_d8383812(#"sc_pap_boathouse", 24000, "sc_pap_boathouse", 400, level._effect[#"hash_1dee7be0bae904ec"], level._effect[#"hash_1549a7f7c4a3d66e"], undefined, undefined, 1);
	cschashed-2\script_624a704d0f6bf28d::function_d8383812(#"sc_pap_ship", 24000, "sc_pap_ship", 400, level._effect[#"hash_1dee7be0bae904ec"], level._effect[#"hash_1549a7f7c4a3d66e"], undefined, undefined, 1);
	cschashed-2\script_624a704d0f6bf28d::function_d8383812(#"sc_pap_lagoon", 24000, "sc_pap_lagoon", 400, level._effect[#"hash_1dee7be0bae904ec"], level._effect[#"hash_1549a7f7c4a3d66e"], undefined, undefined, 1);
	cschashed-2\script_624a704d0f6bf28d::function_d8383812(#"sc_pap_island", 24000, "sc_pap_island", 400, level._effect[#"hash_1dee7be0bae904ec"], level._effect[#"hash_1549a7f7c4a3d66e"], undefined, undefined, 1);
	clientfield::register("scriptmover", "" + #"hash_411947cf11cffb69", 24000, 1, "int", &pap_explosion, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_249c83f6060ea7ba", 24000, 1, "int", &function_e183e043, 0, 0);
}

/*
	Name: pap_explosion
	Namespace: cschashed-1\script_6fdaa897ed596805
	Checksum: 0x8AF0FC12
	Offset: 0x4C0
	Size: 0x82
	Parameters: 7
	Flags: Linked
*/
function pap_explosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(newval)
	{
		self.fx_explosion = util::playfxontag(localclientnum, level._effect[#"pap_explosion"], self, "tag_origin");	}
}

/*
	Name: function_e183e043
	Namespace: cschashed-1\script_6fdaa897ed596805
	Checksum: 0x3772DA23
	Offset: 0x550
	Size: 0x82
	Parameters: 7
	Flags: Linked
*/
function function_e183e043(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(newval)
	{
		self.fx_fire = util::playfxontag(localclientnum, level._effect[#"hash_430c8a8704e0d2af"], self, "tag_origin");
	}
}

