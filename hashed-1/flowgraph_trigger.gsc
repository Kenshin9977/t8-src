// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using hashed-3\flowgraph.gsc;

#namespace flowgraph_trigger;

/*
	Name: ontriggerentered
	Namespace: flowgraph_trigger
	Checksum: 0x3DAB4C11
	Offset: 0x70
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function ontriggerentered(x, e_trigger)
{
	e_trigger endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = e_trigger waittill(#"trigger");
		self flowgraph::kick(array(1, waitresult.activator));
	}
}

