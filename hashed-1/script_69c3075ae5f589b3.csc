// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_624a704d0f6bf28d.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-2\script_69c3075ae5f589b3;

/*
	Name: preload
	Namespace: cschashed-2\script_69c3075ae5f589b3
	Checksum: 0x13CD30D3
	Offset: 0xC8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function preload()
{
	level._effect[#"hash_71c8e53319a84a5e"] = #"hash_75215ea3c21f31d3";
	level._effect[#"hash_6eab68fbca3daf17"] = #"hash_7cdf08df557a9b3f";
	init_clientfields();
}

/*
	Name: main
	Namespace: cschashed-2\script_69c3075ae5f589b3
	Checksum: 0x80F724D1
	Offset: 0x148
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function main()
{
}

/*
	Name: init_clientfields
	Namespace: cschashed-2\script_69c3075ae5f589b3
	Checksum: 0xDC24CF5E
	Offset: 0x158
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "soapstone_start_fx", 24000, 2, "int", &soapstone_fx, 0, 0);
}

/*
	Name: soapstone_fx
	Namespace: cschashed-2\script_69c3075ae5f589b3
	Checksum: 0x768D3FE5
	Offset: 0x1B0
	Size: 0x10A
	Parameters: 7
	Flags: Linked
*/
function soapstone_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.fx_glow))
	{
		stopfx(localclientnum, self.fx_glow);
		self.fx_glow = undefined;
	}
	if(newval == 1)
	{
		self.fx_glow = util::playfxontag(localclientnum, level._effect[#"hash_71c8e53319a84a5e"], self, "tag_origin");
	}
	else if(newval == 2)
	{
		self.fx_glow = util::playfxontag(localclientnum, level._effect[#"hash_6eab68fbca3daf17"], self, "tag_origin");
	}
}

