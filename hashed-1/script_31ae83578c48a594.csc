// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-1\script_3c362258ff800237.csc;
hashed-1\script_4c875fef517e2061.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm.csc;

#namespace cschashed-2\script_31ae83578c48a594;

/*
	Name: function_89f2df9
	Namespace: cschashed-2\script_31ae83578c48a594
	Checksum: 0xF7B74A4
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_6eed28033e443596", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-2\script_31ae83578c48a594
	Checksum: 0x60F54E8E
	Offset: 0xD0
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
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_5d3b4424c6d47835", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: cschashed-2\script_31ae83578c48a594
	Checksum: 0x2FA80FF9
	Offset: 0x138
	Size: 0x2C
	Parameters: 2
	Flags: Private
*/
private function function_d1de6a85(local_client_num, params)
{
	level thread function_40349f7c();
}

/*
	Name: function_40349f7c
	Namespace: cschashed-2\script_31ae83578c48a594
	Checksum: 0xB04260E7
	Offset: 0x170
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function function_40349f7c(localclientnum)
{
	level endon(#"hash_38932f8deb28b470", #"end_game");
	wait(12);
	level.var_dc60105c = 1;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player cschashed-1\script_4c875fef517e2061::function_25410869(localclientnum);
			}
		}
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: cschashed-2\script_31ae83578c48a594
	Checksum: 0xF81C5BDC
	Offset: 0x320
	Size: 0x18A
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(local_client_num)
{
	level notify(#"hash_38932f8deb28b470");
	level.var_dc60105c = undefined;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player cschashed-1\script_4c875fef517e2061::function_25410869(localclientnum);
			}
		}
	}
}

