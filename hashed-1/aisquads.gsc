// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace aisquads;

/*
	Name: function_89f2df9
	Namespace: aisquads
	Checksum: 0xC9C6F142
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"ai_squads", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: aisquads
	Checksum: 0xE67BFC17
	Offset: 0xF8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	level._squads = [];
	actorspawnerarray = getactorspawnerteamarray(#"axis");
	array::run_all(actorspawnerarray, &spawner::add_spawn_function, &squadmemberthink);
}

#namespace squad;

/*
	Name: __constructor
	Namespace: squad
	Checksum: 0x9C3729B9
	Offset: 0x170
	Size: 0x26
	Parameters: 0
	Flags: Linked, 8
*/
function __constructor()
{
	self.squadleader = 0;
	self.squadmembers = [];
	self.squadbreadcrumb = [];
}

/*
	Name: addsquadbreadcrumbs
	Namespace: squad
	Checksum: 0xC64824E6
	Offset: 0x1A0
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function addsquadbreadcrumbs(ai)
{
	/#
		assert(self.squadleader == ai);
	#/
	if(distance2dsquared(self.squadbreadcrumb, ai.origin) >= 9216)
	{
		/#
			recordcircle(ai.origin, 4, (0, 0, 1), "", ai);
		#/
		self.squadbreadcrumb = ai.origin;
	}
}

/*
	Name: getsquadbreadcrumb
	Namespace: squad
	Checksum: 0xA64E689E
	Offset: 0x248
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function getsquadbreadcrumb()
{
	return self.squadbreadcrumb;
}

/*
	Name: getleader
	Namespace: squad
	Checksum: 0xC47F015
	Offset: 0x260
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function getleader()
{
	return self.squadleader;
}

/*
	Name: getmembers
	Namespace: squad
	Checksum: 0xD12A356B
	Offset: 0x278
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function getmembers()
{
	return self.squadmembers;
}

/*
	Name: addaitosquad
	Namespace: squad
	Checksum: 0x55856AF
	Offset: 0x290
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function addaitosquad(ai)
{
	if(!isinarray(self.squadmembers, ai))
	{
		if(ai.archetype == #"robot")
		{
			ai ai::set_behavior_attribute("move_mode", "squadmember");
		}
		self.squadmembers[self.squadmembers.size] = ai;
	}
}

/*
	Name: removeaifromsqaud
	Namespace: squad
	Checksum: 0x864D5361
	Offset: 0x320
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function removeaifromsqaud(ai)
{
	if(isinarray(self.squadmembers, ai))
	{
		arrayremovevalue(self.squadmembers, ai, 0);
		if(self.squadleader === ai)
		{
			self.squadleader = undefined;
		}
	}
}

/*
	Name: think
	Namespace: squad
	Checksum: 0xFF993B77
	Offset: 0x388
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function think()
{
	if(isint(self.squadleader) && self.squadleader == 0 || !isdefined(self.squadleader))
	{
		if(self.squadmembers.size > 0)
		{
			self.squadleader = self.squadmembers[0];
			self.squadbreadcrumb = self.squadleader.origin;
		}
		else
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: __destructor
	Namespace: squad
	Checksum: 0x80F724D1
	Offset: 0x418
	Size: 0x4
	Parameters: 0
	Flags: Linked, 16, 128
*/
function __destructor()
{
}

#namespace aisquads;

/*
	Name: squad
	Namespace: aisquads
	Checksum: 0xF67D26F3
	Offset: 0x428
	Size: 0x1D6
	Parameters: 0
	Flags: AutoExec, Private, 128
*/
private autoexec function squad()
{
	classes.squad[0] = spawnstruct();
	classes.squad[0].__vtable[913321084] = &squad::__destructor;
	classes.squad[0].__vtable[2036831824] = &squad::think;
	classes.squad[0].__vtable[2096875884] = &squad::removeaifromsqaud;
	classes.squad[0].__vtable[433010487] = &squad::addaitosquad;
	classes.squad[0].__vtable[1186782976] = &squad::getmembers;
	classes.squad[0].__vtable[184246382] = &squad::getleader;
	classes.squad[0].__vtable[2060422215] = &squad::getsquadbreadcrumb;
	classes.squad[0].__vtable[1691788582] = &squad::addsquadbreadcrumbs;
	classes.squad[0].__vtable[674154906] = &squad::__constructor;
}

/*
	Name: createsquad
	Namespace: aisquads
	Checksum: 0x7E557816
	Offset: 0x608
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
private function createsquad(squadname)
{
	object = new squad();
	[[ object ]]->__constructor();
	level._squads[squadname] = object;
	return level._squads[squadname];
}

/*
	Name: removesquad
	Namespace: aisquads
	Checksum: 0xDF15700B
	Offset: 0x650
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
private function removesquad(squadname)
{
	if(isdefined(level._squads) && isdefined(level._squads[squadname]))
	{
		level._squads[squadname] = undefined;
	}
}

/*
	Name: getsquad
	Namespace: aisquads
	Checksum: 0xD20C7723
	Offset: 0x6A0
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
private function getsquad(squadname)
{
	return level._squads[squadname];
}

/*
	Name: thinksquad
	Namespace: aisquads
	Checksum: 0xE0E8DDF7
	Offset: 0x6C8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
private function thinksquad(squadname)
{
	while(true)
	{
		if([[ level._squads[squadname] ]]->think())
		{
			wait(0.5);
		}
		else
		{
			removesquad(squadname);
			break;
		}
	}
}

/*
	Name: squadmemberdeath
	Namespace: aisquads
	Checksum: 0x11A3634C
	Offset: 0x730
	Size: 0x60
	Parameters: 0
	Flags: Linked, Private
*/
private function squadmemberdeath()
{
	self waittill(#"death");
	if(isdefined(self.squadname) && isdefined(level._squads[self.squadname]))
	{
		[[ level._squads[self.squadname] ]]->removeaifromsqaud(self);
	}
}

/*
	Name: squadmemberthink
	Namespace: aisquads
	Checksum: 0xF4938FB4
	Offset: 0x798
	Size: 0x416
	Parameters: 0
	Flags: Linked, Private
*/
private function squadmemberthink()
{
	self endon(#"death");
	if(!isdefined(self.script_aisquadname))
	{
		return;
	}
	wait(0.5);
	self.squadname = self.script_aisquadname;
	if(isdefined(self.squadname))
	{
		if(!isdefined(level._squads[self.squadname]))
		{
			squad = createsquad(self.squadname);
			newsquadcreated = 1;
		}
		else
		{
			squad = getsquad(self.squadname);
		}
		[[ squad ]]->addaitosquad(self);
		self thread squadmemberdeath();
		if(isdefined(newsquadcreated) && newsquadcreated)
		{
			level thread thinksquad(self.squadname);
		}
		while(true)
		{
			squadleader = [[ level._squads[self.squadname] ]]->getleader();
			if(isdefined(squadleader) && (!(isint(squadleader) && squadleader == 0)))
			{
				if(squadleader == self)
				{
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					/#
						recordcircle(self.origin, 300, (1, 0.5, 0), "", self);
					#/
					if(isdefined(self.enemy))
					{
						self setgoal(self.enemy);
					}
					[[ squad ]]->addsquadbreadcrumbs(self);
				}
				else
				{
					/#
						recordline(self.origin, squadleader.origin, (0, 1, 0), "", self);
					#/
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					followposition = [[ squad ]]->getsquadbreadcrumb();
					followdistsq = distance2dsquared(self.goalpos, followposition);
					if(isdefined(squadleader.enemy))
					{
						if(!isdefined(self.enemy) || (isdefined(self.enemy) && self.enemy != squadleader.enemy))
						{
							self setentitytarget(squadleader.enemy, 1);
						}
					}
					if(isdefined(self.goalpos) && followdistsq >= 256)
					{
						if(followdistsq >= 22500)
						{
							self ai::set_behavior_attribute("sprint", 1);
						}
						else
						{
							self ai::set_behavior_attribute("sprint", 0);
						}
						self setgoal(followposition, 1);
					}
				}
			}
			wait(1);
		}
	}
}

/*
	Name: isfollowingsquadleader
	Namespace: aisquads
	Checksum: 0x7502FFB3
	Offset: 0xBB8
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function isfollowingsquadleader(ai)
{
	if(ai ai::get_behavior_attribute("move_mode") != "squadmember")
	{
		return 0;
	}
	squadmember = issquadmember(ai);
	currentsquadleader = getsquadleader(ai);
	isaisquadleader = isdefined(currentsquadleader) && currentsquadleader == ai;
	if(squadmember && !isaisquadleader)
	{
		return 1;
	}
	return 0;
}

/*
	Name: issquadmember
	Namespace: aisquads
	Checksum: 0x589CDE66
	Offset: 0xC80
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function issquadmember(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			return isinarray([[ squad ]]->getmembers(), ai);
		}
	}
	return 0;
}

/*
	Name: issquadleader
	Namespace: aisquads
	Checksum: 0xB93BEC5D
	Offset: 0xCF0
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function issquadleader(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			squadleader = [[ squad ]]->getleader();
			return isdefined(squadleader) && squadleader == ai;
		}
	}
	return 0;
}

/*
	Name: getsquadleader
	Namespace: aisquads
	Checksum: 0x2DAE9864
	Offset: 0xD70
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function getsquadleader(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			return [[ squad ]]->getleader();
		}
	}
	return undefined;
}

