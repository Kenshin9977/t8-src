// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace archetype_secondary_animations;

/*
	Name: main
	Namespace: archetype_secondary_animations
	Checksum: 0x4BFEB327
	Offset: 0x118
	Size: 0xCC
	Parameters: 0
	Flags: AutoExec
*/
autoexec function main()
{
	if(sessionmodeiszombiesgame() && getdvarint(#"splitscreen_playercount", 0) > 2)
	{
		return;
	}
	ai::add_archetype_spawn_function(#"human", &secondaryanimationsinit);
	ai::add_archetype_spawn_function(#"zombie", &secondaryanimationsinit);
	ai::add_ai_spawn_function(&on_entity_spawn);
}

/*
	Name: secondaryanimationsinit
	Namespace: archetype_secondary_animations
	Checksum: 0x8EF7547A
	Offset: 0x1F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
private function secondaryanimationsinit(localclientnum)
{
	if(!isdefined(level.__facialanimationslist))
	{
		buildandvalidatefacialanimationlist(localclientnum);
	}
	self callback::on_shutdown(&on_entity_shutdown);
	self thread secondaryfacialanimationthink(localclientnum);
}

/*
	Name: on_entity_spawn
	Namespace: archetype_secondary_animations
	Checksum: 0x81B369C3
	Offset: 0x268
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
private function on_entity_spawn(localclientnum)
{
	if(self hasdobj(localclientnum))
	{
		self clearanim(#"faces", 0);
	}
	self._currentfacestate = "inactive";
}

/*
	Name: on_entity_shutdown
	Namespace: archetype_secondary_animations
	Checksum: 0x8D625855
	Offset: 0x2D0
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
private function on_entity_shutdown(localclientnum)
{
	if(isdefined(self))
	{
		self notify(#"stopfacialthread");
		if(isdefined(self.facialdeathanimstarted) && self.facialdeathanimstarted)
		{
			return;
		}
		self applydeathanim(localclientnum);
		if(isdefined(self))
		{
			self.facialdeathanimstarted = 1;
		}
	}
}

/*
	Name: buildandvalidatefacialanimationlist
	Namespace: archetype_secondary_animations
	Checksum: 0x18E0371B
	Offset: 0x350
	Size: 0x748
	Parameters: 1
	Flags: Linked
*/
function buildandvalidatefacialanimationlist(localclientnum)
{
	/#
		assert(!isdefined(level.__facialanimationslist));
	#/
	level.__facialanimationslist = [];
	level.__facialanimationslist[#"human"] = [];
	level.__facialanimationslist[#"human"][#"combat"] = array(#"hash_183f1e41f0815236", #"hash_183f1d41f0815083", #"hash_183f1c41f0814ed0");
	level.__facialanimationslist[#"human"][#"combat_aim"] = array(#"hash_43f54fa273bd7e12", #"hash_43f54ea273bd7c5f", #"hash_43f54da273bd7aac");
	level.__facialanimationslist[#"human"][#"combat_shoot"] = array(#"hash_5972ddb71f356df0", #"hash_5972e0b71f357309", #"hash_5972dfb71f357156");
	level.__facialanimationslist[#"human"][#"death"] = array(#"hash_24e52cb860b2588e", #"hash_24e52bb860b256db", #"hash_24e52ab860b25528");
	level.__facialanimationslist[#"human"][#"melee"] = array(#"hash_6afc71f1a820b962");
	level.__facialanimationslist[#"human"][#"pain"] = array(#"hash_2d075a32eae3362e");
	level.__facialanimationslist[#"human"][#"animscripted"] = array(#"hash_183f1e41f0815236");
	level.__facialanimationslist[#"zombie"] = [];
	level.__facialanimationslist[#"zombie"][#"combat"] = array(#"hash_55f89591d55489ea");
	level.__facialanimationslist[#"zombie"][#"combat_aim"] = array(#"hash_55f89591d55489ea");
	level.__facialanimationslist[#"zombie"][#"combat_shoot"] = array(#"hash_55f89591d55489ea");
	level.__facialanimationslist[#"zombie"][#"death"] = array(#"hash_4fa8d53e5a60ccde");
	level.__facialanimationslist[#"zombie"][#"melee"] = array(#"hash_38fa4ee1acbf6be4", #"hash_38fa51e1acbf70fd");
	level.__facialanimationslist[#"zombie"][#"pain"] = array(#"hash_46e4e686c2e1085c");
	level.__facialanimationslist[#"zombie"][#"animscripted"] = array(#"hash_55f89591d55489ea");
	deathanims = [];
	foreach(animation in level.__facialanimationslist[#"human"][#"death"])
	{
		array::add(deathanims, animation);
	}
	foreach(animation in level.__facialanimationslist[#"zombie"][#"death"])
	{
		array::add(deathanims, animation);
	}
	foreach(deathanim in deathanims)
	{
		/#
			assert(!isanimlooping(localclientnum, deathanim), "" + deathanim + "");
		#/
	}
}

/*
	Name: getfacialanimoverride
	Namespace: archetype_secondary_animations
	Checksum: 0x53DBB957
	Offset: 0xAA0
	Size: 0x176
	Parameters: 1
	Flags: Linked, Private
*/
private function getfacialanimoverride(localclientnum)
{
	if(sessionmodeiscampaigngame())
	{
		primarydeltaanim = self getprimarydeltaanim();
		if(isdefined(primarydeltaanim))
		{
			primarydeltaanimlength = getanimlength(primarydeltaanim);
			notetracks = getnotetracksindelta(primarydeltaanim, 0, 1);
			foreach(notetrack in notetracks)
			{
				if(notetrack[1] == "facial_anim")
				{
					facialanim = notetrack[2];
					facialanimlength = getanimlength(facialanim);
					/#
					#/
					return facialanim;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_176c97f8
	Namespace: archetype_secondary_animations
	Checksum: 0x61A35605
	Offset: 0xC20
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
private function function_176c97f8(substate)
{
	if(!isdefined(substate))
	{
		return 0;
	}
	return substate == #"pain" || substate == #"hash_7f95d783fb40e726" || substate == #"hash_2dfc6883f8726e18" || substate == #"hash_29ce220830069fad" || substate == #"hash_38b6db4d481c96d6" || substate == #"hash_544567ec9ed768d5";
}

/*
	Name: function_f5dde44
	Namespace: archetype_secondary_animations
	Checksum: 0x44D21A55
	Offset: 0xCD0
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
private function function_f5dde44(substate)
{
	if(!isdefined(substate))
	{
		return 0;
	}
	return substate == #"melee" || substate == #"hash_23b1ff37b0280a42" || substate == #"hash_48dda7ed88efe32f";
}

/*
	Name: secondaryfacialanimationthink
	Namespace: archetype_secondary_animations
	Checksum: 0x279EB7AB
	Offset: 0xD38
	Size: 0x5B8
	Parameters: 1
	Flags: Linked, Private
*/
private function secondaryfacialanimationthink(localclientnum)
{
	if(!(isdefined(self.archetype) && (self.archetype == #"human" || self.archetype == #"zombie")))
	{
		/#
			assert(0, "");
		#/
		return;
	}
	self endon(#"death");
	self endon(#"stopfacialthread");
	self._currentfacestate = "inactive";
	while(isdefined(self.archetype))
	{
		if(self.archetype == #"human" && self clientfield::get("facial_dial"))
		{
			self._currentfacestate = "inactive";
			self clearcurrentfacialanim(localclientnum);
			wait(0.5);
			continue;
		}
		animoverride = self getfacialanimoverride(localclientnum);
		asmstatus = self asmgetstatus(localclientnum);
		forcenewanim = 0;
		switch(asmstatus)
		{
			case "asm_status_terminated":
			{
				return;
			}
			case "asm_status_inactive":
			{
				if(isdefined(animoverride))
				{
					scriptedanim = self getprimarydeltaanim();
					if(isdefined(scriptedanim) && (!isdefined(self._scriptedanim) || self._scriptedanim != scriptedanim))
					{
						self._scriptedanim = scriptedanim;
						forcenewanim = 1;
					}
					if(isdefined(animoverride) && animoverride !== self._currentfaceanim)
					{
						forcenewanim = 1;
					}
				}
				else if(self._currentfacestate !== "death")
				{
					self._currentfacestate = "inactive";
					self clearcurrentfacialanim(localclientnum);
				}
				wait(0.5);
				continue;
			}
		}
		closestplayer = arraygetclosest(self.origin, level.localplayers, getdvarint(#"ai_clientfacialculldist", 2000));
		if(!isdefined(closestplayer))
		{
			wait(0.5);
			continue;
		}
		if(!self hasdobj(localclientnum) || !self hasanimtree())
		{
			wait(0.5);
			continue;
		}
		currfacestate = self._currentfacestate;
		currentasmstate = self asmgetcurrentstate(localclientnum);
		if(self asmisterminating(localclientnum))
		{
			nextfacestate = "death";
		}
		else if(asmstatus == "asm_status_inactive")
		{
			nextfacestate = "animscripted";
		}
		else if(function_176c97f8(currentasmstate))
		{
			nextfacestate = "pain";
		}
		else if(function_f5dde44(currentasmstate))
		{
			nextfacestate = "melee";
		}
		else if(self asmisshootlayeractive(localclientnum))
		{
			nextfacestate = "combat_shoot";
		}
		else if(self asmisaimlayeractive(localclientnum))
		{
			nextfacestate = "combat_aim";
		}
		else
		{
			nextfacestate = "combat";
		}
		if(currfacestate == "inactive" || currfacestate != nextfacestate || forcenewanim)
		{
			/#
				assert(isdefined(level.__facialanimationslist[self.archetype][nextfacestate]));
			#/
			clearoncompletion = 0;
			animtoplay = array::random(level.__facialanimationslist[self.archetype][nextfacestate]);
			if(isdefined(animoverride))
			{
				animtoplay = animoverride;
				/#
					assert(nextfacestate != "" || !isanimlooping(localclientnum, animtoplay), "" + animtoplay + "");
				#/
			}
			applynewfaceanim(localclientnum, animtoplay, clearoncompletion);
			self._currentfacestate = nextfacestate;
		}
		if(self._currentfacestate == "death")
		{
			break;
		}
		wait(0.25);
	}
}

/*
	Name: applynewfaceanim
	Namespace: archetype_secondary_animations
	Checksum: 0x4042FF87
	Offset: 0x12F8
	Size: 0xFC
	Parameters: 3
	Flags: Linked, Private
*/
private function applynewfaceanim(localclientnum, animation, clearoncompletion = 0)
{
	clearcurrentfacialanim(localclientnum);
	if(isdefined(animation))
	{
		self._currentfaceanim = animation;
		if(self hasdobj(localclientnum) && self hasanimtree())
		{
			self setflaggedanimknob(#"ai_secondary_facial_anim", animation, 1, 0.1, 1);
			if(clearoncompletion)
			{
				wait(getanimlength(animation));
				clearcurrentfacialanim(localclientnum);
			}
		}
	}
}

/*
	Name: applydeathanim
	Namespace: archetype_secondary_animations
	Checksum: 0x32EA08D5
	Offset: 0x1400
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Private
*/
private function applydeathanim(localclientnum)
{
	if(getmigrationstatus(localclientnum))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	util::waitforclient(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(self._currentfacestate === "death")
	{
		return;
	}
	if(self hasdobj(localclientnum) && self hasanimtree())
	{
		if(isdefined(self) && isdefined(self.archetype) && isdefined(level.__facialanimationslist) && isdefined(level.__facialanimationslist[self.archetype]) && isdefined(level.__facialanimationslist[self.archetype][#"death"]))
		{
			animtoplay = array::random(level.__facialanimationslist[self.archetype][#"death"]);
			animoverride = self getfacialanimoverride(localclientnum);
			if(isdefined(animoverride))
			{
				animtoplay = animoverride;
			}
			applynewfaceanim(localclientnum, animtoplay);
		}
		self._currentfacestate = "death";
	}
}

/*
	Name: clearcurrentfacialanim
	Namespace: archetype_secondary_animations
	Checksum: 0x99952F62
	Offset: 0x1598
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
private function clearcurrentfacialanim(localclientnum)
{
	if(isdefined(self._currentfaceanim) && self hasdobj(localclientnum) && self hasanimtree())
	{
		self clearanim(self._currentfaceanim, 0.2);
	}
	self._currentfaceanim = undefined;
}

