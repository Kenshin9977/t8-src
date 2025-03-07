// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-1\behaviortreenetworkutility.gsc;
#using hashed-3\aiutility_428.gsc;

#namespace archetype_human_exposed;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetype_human_exposed
	Checksum: 0x90261007
	Offset: 0x158
	Size: 0x2A4
	Parameters: 0
	Flags: AutoExec
*/
autoexec function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&hascloseenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("hasCloseEnemy", &hascloseenemy);
	/#
		assert(isscriptfunctionptr(&nocloseenemyservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("noCloseEnemyService", &nocloseenemyservice);
	/#
		assert(isscriptfunctionptr(&tryreacquireservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("tryReacquireService", &tryreacquireservice);
	/#
		assert(isscriptfunctionptr(&preparetoreacttoenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("prepareToReactToEnemy", &preparetoreacttoenemy);
	/#
		assert(isscriptfunctionptr(&resetreactiontoenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("resetReactionToEnemy", &resetreactiontoenemy);
	/#
		assert(isscriptfunctionptr(&exposedsetdesiredstancetostand));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedSetDesiredStanceToStand", &exposedsetdesiredstancetostand);
	/#
		assert(isscriptfunctionptr(&setpathmovedelayedrandom));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("setPathMoveDelayedRandom", &setpathmovedelayedrandom);
}

/*
	Name: preparetoreacttoenemy
	Namespace: archetype_human_exposed
	Checksum: 0x3D6D4FE3
	Offset: 0x408
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
private function preparetoreacttoenemy(behaviortreeentity)
{
	behaviortreeentity.newenemyreaction = 0;
	behaviortreeentity.malfunctionreaction = 0;
	behaviortreeentity pathmode("move delayed", 1, 3);
}

/*
	Name: resetreactiontoenemy
	Namespace: archetype_human_exposed
	Checksum: 0x598CA360
	Offset: 0x460
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
private function resetreactiontoenemy(behaviortreeentity)
{
	behaviortreeentity.newenemyreaction = 0;
	behaviortreeentity.malfunctionreaction = 0;
}

/*
	Name: nocloseenemyservice
	Namespace: archetype_human_exposed
	Checksum: 0xEEBA6ED1
	Offset: 0x490
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
private function nocloseenemyservice(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.enemy) && aiutility::hascloseenemytomelee(behaviortreeentity))
	{
		behaviortreeentity clearpath();
		return 1;
	}
	return 0;
}

/*
	Name: hascloseenemy
	Namespace: archetype_human_exposed
	Checksum: 0x94708625
	Offset: 0x4F0
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
private function hascloseenemy(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.enemy))
	{
		return 0;
	}
	if(distancesquared(behaviortreeentity.origin, behaviortreeentity.enemy.origin) < 22500)
	{
		return 1;
	}
	return 0;
}

/*
	Name: setpathmovedelayedrandom
	Namespace: archetype_human_exposed
	Checksum: 0x4752F635
	Offset: 0x558
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
private function setpathmovedelayedrandom(behaviortreeentity, asmstatename)
{
	behaviortreeentity pathmode("move delayed", 0, randomfloatrange(1, 3));
}

/*
	Name: exposedsetdesiredstancetostand
	Namespace: archetype_human_exposed
	Checksum: 0xB4F269A4
	Offset: 0x5B0
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
private function exposedsetdesiredstancetostand(behaviortreeentity, asmstatename)
{
	aiutility::keepclaimnode(behaviortreeentity);
	currentstance = behaviortreeentity getblackboardattribute("_stance");
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
}

/*
	Name: tryreacquireservice
	Namespace: archetype_human_exposed
	Checksum: 0xD3EF4B47
	Offset: 0x638
	Size: 0x2BA
	Parameters: 1
	Flags: Linked, Private
*/
private function tryreacquireservice(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.reacquire_state))
	{
		behaviortreeentity.reacquire_state = 0;
	}
	if(!isdefined(behaviortreeentity.enemy))
	{
		behaviortreeentity.reacquire_state = 0;
		return 0;
	}
	if(behaviortreeentity haspath())
	{
		behaviortreeentity.reacquire_state = 0;
		return 0;
	}
	if(behaviortreeentity seerecently(behaviortreeentity.enemy, 4))
	{
		behaviortreeentity.reacquire_state = 0;
		return 0;
	}
	dirtoenemy = vectornormalize(behaviortreeentity.enemy.origin - behaviortreeentity.origin);
	forward = anglestoforward(behaviortreeentity.angles);
	if(vectordot(dirtoenemy, forward) < 0.5)
	{
		behaviortreeentity.reacquire_state = 0;
		return 0;
	}
	switch(behaviortreeentity.reacquire_state)
	{
		case 0:
		case 1:
		case 2:
		{
			step_size = 32 + behaviortreeentity.reacquire_state * 32;
			reacquirepos = behaviortreeentity reacquirestep(step_size);
			break;
		}
		case 4:
		{
			if(!behaviortreeentity cansee(behaviortreeentity.enemy) || !behaviortreeentity canshootenemy())
			{
				behaviortreeentity flagenemyunattackable();
			}
			break;
		}
		default:
		{
			if(behaviortreeentity.reacquire_state > 15)
			{
				behaviortreeentity.reacquire_state = 0;
				return 0;
			}
			break;
		}
	}
	if(isvec(reacquirepos))
	{
		behaviortreeentity function_a57c34b7(reacquirepos);
		return 1;
	}
	behaviortreeentity.reacquire_state++;
	return 0;
}

