// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-2\script_35e940bfe99f96cd;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_35e940bfe99f96cd
	Checksum: 0x538CB13A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"nosferatu", &__init__, undefined, undefined);}

/*
	Name: precache
	Namespace: cschashed-2\script_35e940bfe99f96cd
	Checksum: 0x80F724D1
	Offset: 0x108
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
autoexec function precache()
{
}

/*
	Name: __init__
	Namespace: cschashed-2\script_35e940bfe99f96cd
	Checksum: 0xFB74A1F0
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	clientfield::register("actor", "nfrtu_leap_melee_rumb", 8000, 1, "counter", &function_5b1f1713, 0, 0);
}

/*
	Name: function_5b1f1713
	Namespace: cschashed-2\script_35e940bfe99f96cd
	Checksum: 0x3919CD08
	Offset: 0x170
	Size: 0x15C
	Parameters: 7
	Flags: Linked
*/
function function_5b1f1713(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	e_player = function_5c10bd79(localclientnum);
	n_dist = distancesquared(self.origin, e_player.origin);
	var_56cb57e3 = 200 * 200;
	n_scale = var_56cb57e3 - n_dist / var_56cb57e3;
	n_scale = n_scale * 0.75;
	if(n_scale > 0.01)
	{
		earthquake(localclientnum, n_scale, 0.1, self.origin, n_dist);
		if(n_scale >= 0.5)
		{
			function_36e4ebd4(localclientnum, "damage_heavy");
		}
		else
		{
			function_36e4ebd4(localclientnum, "damage_light");
		}
	}
}

