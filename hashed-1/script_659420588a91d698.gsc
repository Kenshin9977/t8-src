// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_d920a65;

/*
	Name: function_89f2df9
	Namespace: namespace_d920a65
	Checksum: 0xA1E1572A
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_7fb45fd668e2069a", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_d920a65
	Checksum: 0xFACCDED7
	Offset: 0x158
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
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_1b6ebc56a697d63d", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d920a65
	Checksum: 0x628ED64E
	Offset: 0x1C0
	Size: 0x248
	Parameters: 0
	Flags: Private
*/
private function function_d1de6a85()
{
	if(util::function_53bbf9d2() == "zm_office")
	{
		elevator1 = getent("elevator1", "targetname");
		elevator2 = getent("elevator2", "targetname");
		elevator1.cost = 0;
		elevator2.cost = 0;
		trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
		trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
		trigger1 sethintstring(level.var_31560d97, elevator1.cost);
		trigger2 sethintstring(level.var_31560d97, elevator2.cost);
	}
	str_targetname = "trials_shoot_from_location";
	level.var_7f31a12d = getentarray(str_targetname, "targetname");
	/#
		assert(level.var_7f31a12d.size, "");
	#/
	callback::function_33f0ddd3(&function_33f0ddd3);
	foreach(player in getplayers())
	{
		player thread function_3658663();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d920a65
	Checksum: 0x57685273
	Offset: 0x410
	Size: 0x202
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(round_reset)
{
	callback::function_824d206(&function_33f0ddd3);
	if(util::function_53bbf9d2() == "zm_office")
	{
		elevator1 = getent("elevator1", "targetname");
		elevator2 = getent("elevator2", "targetname");
		elevator1.cost = 500;
		elevator2.cost = 500;
		trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
		trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
		trigger1 sethintstring(level.var_31560d97, elevator1.cost);
		trigger2 sethintstring(level.var_31560d97, elevator2.cost);
	}
	foreach(player in getplayers())
	{
		player thread cschashed-1\script_3d5821d793ed4c6::function_dc0859e();
	}
	level.var_7f31a12d = undefined;
}

/*
	Name: function_3658663
	Namespace: namespace_d920a65
	Checksum: 0x271FC3F
	Offset: 0x620
	Size: 0x146
	Parameters: 0
	Flags: Private
*/
private function function_3658663()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	var_407eb07 = 0;
	while(true)
	{
		var_f2b6fe6e = 0;
		foreach(var_3953f2a9 in level.var_7f31a12d)
		{
			if(self istouching(var_3953f2a9))
			{
				var_f2b6fe6e = 1;
				break;
			}
		}
		if(var_f2b6fe6e && var_407eb07)
		{
			self cschashed-1\script_3d5821d793ed4c6::function_dc0859e();
			var_407eb07 = 0;
		}
		else if(!var_f2b6fe6e && !var_407eb07)
		{
			self cschashed-1\script_3d5821d793ed4c6::function_bf710271();
			var_407eb07 = 1;
		}
		waitframe(1);
	}
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_d920a65
	Checksum: 0xFBD008C1
	Offset: 0x770
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
private function function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		var_f2b6fe6e = 0;
		foreach(var_3953f2a9 in level.var_7f31a12d)
		{
			if(self istouching(var_3953f2a9))
			{
				var_f2b6fe6e = 1;
				break;
			}
		}
		if(!var_f2b6fe6e && !cschashed-2\script_709bf7c56eb65adf::function_2ff6913(s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
		}
	}
}

