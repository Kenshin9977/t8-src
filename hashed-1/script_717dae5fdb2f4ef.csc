// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-2\script_64ac23dbb2d7d587.csc;
#using scripts\core_common\blood.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace cschashed-2\script_717dae5fdb2f4ef;

/*
	Name: init_shared
	Namespace: cschashed-2\script_717dae5fdb2f4ef
	Checksum: 0x73642FB
	Offset: 0x130
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	clientfield::register("toplayer", "shock_rifle_shocked", 1, 1, "int", &shock_rifle_shocked, 0, 0);
	clientfield::register("toplayer", "shock_rifle_damage", 1, 1, "int", &shock_rifle_damage, 0, 0);
	clientfield::register("allplayers", "shock_rifle_sound", 1, 1, "int", &shock_rifle_sound, 0, 0);
}

/*
	Name: shock_rifle_shocked
	Namespace: cschashed-2\script_717dae5fdb2f4ef
	Checksum: 0x6BD0C252
	Offset: 0x218
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function shock_rifle_shocked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.playerIsShocked"), 1);
	}
	else
	{
		setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.playerIsShocked"), 0);
	}
}

/*
	Name: shock_rifle_damage
	Namespace: cschashed-2\script_717dae5fdb2f4ef
	Checksum: 0x48FADA4E
	Offset: 0x2F0
	Size: 0x76
	Parameters: 7
	Flags: Linked
*/
function shock_rifle_damage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		splatter = blood::getsplatter(localclientnum);
		splatter.shockrifle = 1;
	}
}

/*
	Name: shock_rifle_sound
	Namespace: cschashed-2\script_717dae5fdb2f4ef
	Checksum: 0xC2B0B69E
	Offset: 0x370
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function shock_rifle_sound(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		self playloopsound("wpn_shockrifle_electrocution");
	}
	else
	{
		self stopallloopsounds();
	}
}

