// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_1b4af057274ffcd0;
#using script_261ab6f031d07a15;
#using hashed-2\planner.gsc;
#using script_37e409875b3ab3b6;
#using hashed-2\plannergenericcommander.gsc;
#using hashed-2\planner_commander.gsc;
#using hashed-1\planner_squad_utility.gsc;
#using hashed-2\blackboard.gsc;
#using script_55cdac8f3eaa44cd;
#using hashed-3\planner_commander_utility.gsc;
#using script_770268ef1e664da9;
#using script_c5bc2e592d581d0;

#namespace namespace_4932f496;

/*
	Name: _createcommanderplanner
	Namespace: namespace_4932f496
	Checksum: 0x734D6668
	Offset: 0x118
	Size: 0x32
	Parameters: 1
	Flags: Private
*/
private function _createcommanderplanner(team)
{
	planner = plannerutility::createplannerfromasset("zm_commander.ai_htn");
	return planner;
}

/*
	Name: _createsquadplanner
	Namespace: namespace_4932f496
	Checksum: 0x9BF35A47
	Offset: 0x158
	Size: 0x32
	Parameters: 1
	Flags: Private
*/
private function _createsquadplanner(team)
{
	planner = plannerutility::createplannerfromasset("zm_squad.ai_htn");
	return planner;
}

/*
	Name: createcommander
	Namespace: namespace_4932f496
	Checksum: 0xC0F18A4F
	Offset: 0x198
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function createcommander()
{
	team = #"allies";
	commander = plannercommanderutility::createcommander(team, _createcommanderplanner(team), _createsquadplanner(team));
	plannergenericcommander::commanderdaemons(commander);
	plannercommanderutility::adddaemon(commander, "daemonZmBlockers");
	plannercommanderutility::adddaemon(commander, "daemonZmWallBuys");
	plannergenericcommander::commanderutilityevaluators(commander);
}

