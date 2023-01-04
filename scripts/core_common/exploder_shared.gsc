// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;

#namespace exploder;

/*
	Name: function_89f2df9
	Namespace: exploder
	Checksum: 0xC88494B1
	Offset: 0x178
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"exploder", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: exploder
	Checksum: 0xE3291FAF
	Offset: 0x1C8
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	level._client_exploders = [];
	level._client_exploder_ids = [];
}

/*
	Name: __main__
	Namespace: exploder
	Checksum: 0x8F723A1D
	Offset: 0x1F0
	Size: 0xF08
	Parameters: 0
	Flags: Linked
*/
function __main__()
{
	level.exploders = [];
	ents = getentarray("script_brushmodel", "classname");
	smodels = getentarray("script_model", "classname");
	for(i = 0; i < smodels.size; i++)
	{
		ents[ents.size] = smodels[i];
	}
	for(i = 0; i < ents.size; i++)
	{
		if(isdefined(ents[i].script_prefab_exploder))
		{
			ents[i].script_exploder = ents[i].script_prefab_exploder;
		}
		if(isdefined(ents[i].script_exploder))
		{
			if(ents[i].script_exploder < 10000)
			{
				level.exploders[ents[i].script_exploder] = 1;
			}
			if(ents[i].model == "fx" && (!isdefined(ents[i].targetname) || ents[i].targetname != "exploderchunk"))
			{
				ents[i] hide();
				continue;
			}
			if(isdefined(ents[i].targetname) && ents[i].targetname == "exploder")
			{
				ents[i] hide();
				ents[i] notsolid();
				if(isdefined(ents[i].script_disconnectpaths))
				{
					ents[i] connectpaths();
				}
				continue;
			}
			if(isdefined(ents[i].targetname) && ents[i].targetname == "exploderchunk")
			{
				ents[i] hide();
				ents[i] notsolid();
				if(isdefined(ents[i].spawnflags) && ents[i].spawnflags & 1 == 1)
				{
					ents[i] connectpaths();
				}
			}
		}
	}
	script_exploders = [];
	potentialexploders = getentarray("script_brushmodel", "classname");
	for(i = 0; i < potentialexploders.size; i++)
	{
		if(isdefined(potentialexploders[i].script_prefab_exploder))
		{
			potentialexploders[i].script_exploder = potentialexploders[i].script_prefab_exploder;
		}
		if(isdefined(potentialexploders[i].script_exploder))
		{
			script_exploders[script_exploders.size] = potentialexploders[i];
		}
	}
	/#
		println("" + potentialexploders.size);
	#/
	potentialexploders = getentarray("script_model", "classname");
	for(i = 0; i < potentialexploders.size; i++)
	{
		if(isdefined(potentialexploders[i].script_prefab_exploder))
		{
			potentialexploders[i].script_exploder = potentialexploders[i].script_prefab_exploder;
		}
		if(isdefined(potentialexploders[i].script_exploder))
		{
			script_exploders[script_exploders.size] = potentialexploders[i];
		}
	}
	/#
		println("" + potentialexploders.size);
	#/
	potentialexploders = getentarray("item_health", "classname");
	for(i = 0; i < potentialexploders.size; i++)
	{
		if(isdefined(potentialexploders[i].script_prefab_exploder))
		{
			potentialexploders[i].script_exploder = potentialexploders[i].script_prefab_exploder;
		}
		if(isdefined(potentialexploders[i].script_exploder))
		{
			script_exploders[script_exploders.size] = potentialexploders[i];
		}
	}
	/#
		println("" + potentialexploders.size);
	#/
	if(!isdefined(level.createfxent))
	{
		level.createfxent = [];
	}
	acceptabletargetnames = [];
	acceptabletargetnames[#"hash_7a9dcee99d931917"] = 1;
	acceptabletargetnames[#"exploderchunk"] = 1;
	acceptabletargetnames[#"exploder"] = 1;
	for(i = 0; i < script_exploders.size; i++)
	{
		exploder = script_exploders[i];
		ent = createexploder(exploder.script_fxid);
		ent.v = [];
		ent.v[#"origin"] = exploder.origin;
		ent.v[#"angles"] = exploder.angles;
		ent.v[#"delay"] = exploder.script_delay;
		ent.v[#"firefx"] = exploder.script_firefx;
		ent.v[#"firefxdelay"] = exploder.script_firefxdelay;
		ent.v[#"firefxsound"] = exploder.script_firefxsound;
		ent.v[#"firefxtimeout"] = exploder.script_firefxtimeout;
		ent.v[#"earthquake"] = exploder.script_earthquake;
		ent.v[#"damage"] = exploder.script_damage;
		ent.v[#"damage_radius"] = exploder.script_radius;
		ent.v[#"soundalias"] = exploder.script_soundalias;
		ent.v[#"repeat"] = exploder.script_repeat;
		ent.v[#"delay_min"] = exploder.script_delay_min;
		ent.v[#"delay_max"] = exploder.script_delay_max;
		ent.v[#"target"] = exploder.target;
		ent.v[#"ender"] = exploder.script_ender;
		ent.v[#"type"] = "exploder";
		if(!isdefined(exploder.script_fxid))
		{
			ent.v[#"fxid"] = "No FX";
		}
		else
		{
			ent.v[#"fxid"] = exploder.script_fxid;
		}
		ent.v[#"exploder"] = exploder.script_exploder;
		/#
			assert(isdefined(exploder.script_exploder), "" + exploder.origin + "");
		#/
		if(!isdefined(ent.v[#"delay"]))
		{
			ent.v[#"delay"] = 0;
		}
		if(isdefined(exploder.target))
		{
			e_target = getent(ent.v[#"target"], "targetname");
			if(!isdefined(e_target))
			{
				e_target = struct::get(ent.v[#"target"], "targetname");
			}
			org = e_target.origin;
			ent.v[#"angles"] = vectortoangles(org - ent.v[#"origin"]);
		}
		if(exploder.classname == "script_brushmodel" || isdefined(exploder.model))
		{
			ent.model = exploder;
			ent.model.disconnect_paths = exploder.script_disconnectpaths;
		}
		if(isdefined(exploder.targetname) && isdefined(acceptabletargetnames[exploder.targetname]))
		{
			ent.v[#"exploder_type"] = exploder.targetname;
			continue;
		}
		ent.v[#"exploder_type"] = "normal";
	}
	level.createfxexploders = [];
	for(i = 0; i < level.createfxent.size; i++)
	{
		ent = level.createfxent[i];
		if(ent.v[#"type"] != "exploder")
		{
			continue;
		}
		ent.v[#"exploder_id"] = getexploderid(ent);
		if(!isdefined(level.createfxexploders[ent.v[#"exploder"]]))
		{
			level.createfxexploders[ent.v[#"exploder"]] = [];
		}
		level.createfxexploders[ent.v[#"exploder"]][level.createfxexploders[ent.v[#"exploder"]].size] = ent;
	}
	level.radiantexploders = [];
	reportexploderids();
	foreach(trig in trigger::get_all())
	{
		if(isdefined(trig.script_prefab_exploder))
		{
			trig.script_exploder = trig.script_prefab_exploder;
		}
		if(isdefined(trig.script_exploder))
		{
			level thread exploder_trigger(trig, trig.script_exploder);
		}
		if(isdefined(trig.script_exploder_radiant))
		{
			level thread exploder_trigger(trig, trig.script_exploder_radiant);
		}
		if(isdefined(trig.script_stop_exploder))
		{
			level trigger::add_function(trig, undefined, &stop_exploder, trig.script_stop_exploder);
		}
		if(isdefined(trig.script_stop_exploder_radiant))
		{
			level trigger::add_function(trig, undefined, &stop_exploder, trig.script_stop_exploder_radiant);
		}
	}
}

/*
	Name: exploder_before_load
	Namespace: exploder
	Checksum: 0xA8EEB3A1
	Offset: 0x1100
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function exploder_before_load(num)
{
	waittillframeend();
	waittillframeend();
	exploder(num);
}

/*
	Name: exploder
	Namespace: exploder
	Checksum: 0xDBF6BD1
	Offset: 0x1130
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function exploder(exploder_id)
{
	if(isint(exploder_id))
	{
		activate_exploder(exploder_id);
	}
	else
	{
		activate_radiant_exploder(exploder_id);
	}
}

/*
	Name: exploder_stop
	Namespace: exploder
	Checksum: 0x3A6C060
	Offset: 0x1190
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function exploder_stop(num)
{
	stop_exploder(num);
}

/*
	Name: exploder_sound
	Namespace: exploder
	Checksum: 0x1966E8B1
	Offset: 0x11C0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function exploder_sound()
{
	if(isdefined(self.script_delay))
	{
		wait(self.script_delay);
	}
	self playsound(level.scr_sound[self.script_sound]);
}

/*
	Name: cannon_effect
	Namespace: exploder
	Checksum: 0xFA663B5F
	Offset: 0x1208
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function cannon_effect()
{
	if(isdefined(self.v[#"repeat"]))
	{
		for(i = 0; i < self.v[#"repeat"]; i++)
		{
			playfx(level._effect[self.v[#"fxid"]], self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
			self exploder_delay();
		}
		return;
	}
	self exploder_delay();
	if(isdefined(self.looper))
	{
		self.looper delete();
	}
	self.looper = spawnfx(fx::get(self.v[#"fxid"]), self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
	triggerfx(self.looper);
	exploder_playsound();
}

/*
	Name: fire_effect
	Namespace: exploder
	Checksum: 0x2BA2A3FB
	Offset: 0x13F8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function fire_effect()
{
	forward = self.v[#"forward"];
	up = self.v[#"up"];
	firefxsound = self.v[#"firefxsound"];
	origin = self.v[#"origin"];
	firefx = self.v[#"firefx"];
	ender = self.v[#"ender"];
	if(!isdefined(ender))
	{
		ender = "createfx_effectStopper";
	}
	firefxdelay = 0.5;
	if(isdefined(self.v[#"firefxdelay"]))
	{
		firefxdelay = self.v[#"firefxdelay"];
	}
	self exploder_delay();
	if(isdefined(firefxsound))
	{
		level thread sound::loop_fx_sound(firefxsound, origin, ender);
	}
	playfx(level._effect[firefx], self.v[#"origin"], forward, up);
}

/*
	Name: sound_effect
	Namespace: exploder
	Checksum: 0xE57DE6CB
	Offset: 0x15A8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function sound_effect()
{
	self effect_soundalias();
}

/*
	Name: effect_soundalias
	Namespace: exploder
	Checksum: 0x3964884B
	Offset: 0x15D0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function effect_soundalias()
{
	origin = self.v[#"origin"];
	alias = self.v[#"soundalias"];
	self exploder_delay();
	sound::play_in_space(alias, origin);
}

/*
	Name: trail_effect
	Namespace: exploder
	Checksum: 0xC3D3410A
	Offset: 0x1650
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function trail_effect()
{
	self exploder_delay();
	if(!isdefined(self.v[#"trailfxtag"]))
	{
		self.v[#"trailfxtag"] = "tag_origin";
	}
	temp_ent = undefined;
	if(self.v[#"trailfxtag"] == "tag_origin")
	{
		playfxontag(level._effect[self.v[#"trailfx"]], self.model, self.v[#"trailfxtag"]);
	}
	else
	{
		temp_ent = spawn("script_model", self.model.origin);
		temp_ent.targetname = "exploder_fx";
		temp_ent setmodel(#"tag_origin");
		temp_ent linkto(self.model, self.v[#"trailfxtag"]);
		playfxontag(level._effect[self.v[#"trailfx"]], temp_ent, "tag_origin");
	}
	if(isdefined(self.v[#"trailfxsound"]))
	{
		if(!isdefined(temp_ent))
		{
			self.model playloopsound(self.v[#"trailfxsound"]);
		}
		else
		{
			temp_ent playloopsound(self.v[#"trailfxsound"]);
		}
	}
	if(isdefined(self.v[#"ender"]) && isdefined(temp_ent))
	{
		level thread trail_effect_ender(temp_ent, self.v[#"ender"]);
	}
	if(!isdefined(self.v[#"trailfxtimeout"]))
	{
		return;
	}
	wait(self.v[#"trailfxtimeout"]);
	if(isdefined(temp_ent))
	{
		temp_ent delete();
	}
}

/*
	Name: trail_effect_ender
	Namespace: exploder
	Checksum: 0x4D4CC989
	Offset: 0x1968
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function trail_effect_ender(ent, ender)
{
	ent endon(#"death");
	self waittill(ender);
	ent delete();
}

/*
	Name: exploder_delay
	Namespace: exploder
	Checksum: 0xC5FAC756
	Offset: 0x19C0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function exploder_delay()
{
	if(!isdefined(self.v[#"delay"]))
	{
		self.v[#"delay"] = 0;
	}
	min_delay = self.v[#"delay"];
	max_delay = self.v[#"delay"] + 0.001;
	if(isdefined(self.v[#"delay_min"]))
	{
		min_delay = self.v[#"delay_min"];
	}
	if(isdefined(self.v[#"delay_max"]))
	{
		max_delay = self.v[#"delay_max"];
	}
	if(min_delay > 0)
	{
		wait(randomfloatrange(min_delay, max_delay));
	}
}

/*
	Name: exploder_playsound
	Namespace: exploder
	Checksum: 0x7C0E9823
	Offset: 0x1AE8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function exploder_playsound()
{
	if(!isdefined(self.v[#"soundalias"]) || self.v[#"soundalias"] == "nil")
	{
		return;
	}
	sound::play_in_space(self.v[#"soundalias"], self.v[#"origin"]);
}

/*
	Name: brush_delete
	Namespace: exploder
	Checksum: 0x3FB32636
	Offset: 0x1B80
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function brush_delete()
{
	num = self.v[#"exploder"];
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	else
	{
		wait(0.05);
	}
	if(!isdefined(self.model))
	{
		return;
	}
	/#
		assert(isdefined(self.model));
	#/
	if(!isdefined(self.v[#"fxid"]) || self.v[#"fxid"] == "No FX")
	{
		self.v[#"exploder"] = undefined;
	}
	waittillframeend();
	self.model delete();
}

/*
	Name: brush_show
	Namespace: exploder
	Checksum: 0x96BD1AF9
	Offset: 0x1CA0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function brush_show()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	/#
		assert(isdefined(self.model));
	#/
	self.model show();
	self.model solid();
}

/*
	Name: brush_throw
	Namespace: exploder
	Checksum: 0x5F8BBD6C
	Offset: 0x1D38
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function brush_throw()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	ent = undefined;
	if(isdefined(self.v[#"target"]))
	{
		ent = getent(self.v[#"target"], "targetname");
	}
	if(!isdefined(ent))
	{
		self.model delete();
		return;
	}
	self.model show();
	startorg = self.v[#"origin"];
	startang = self.v[#"angles"];
	org = ent.origin;
	temp_vec = org - self.v[#"origin"];
	x = temp_vec[0];
	y = temp_vec[1];
	z = temp_vec[2];
	self.model rotatevelocity((x, y, z), 12);
	self.model movegravity((x, y, z), 12);
	self.v[#"exploder"] = undefined;
	wait(6);
	self.model delete();
}

/*
	Name: exploder_trigger
	Namespace: exploder
	Checksum: 0xEB09E76A
	Offset: 0x1F68
	Size: 0x102
	Parameters: 2
	Flags: Linked
*/
function exploder_trigger(trigger, script_value)
{
	trigger endon(#"death");
	level endon("killexplodertridgers" + script_value);
	trigger trigger::wait_till();
	if(isdefined(trigger.script_chance) && randomfloat(1) > trigger.script_chance)
	{
		if(isdefined(trigger.script_delay))
		{
			wait(trigger.script_delay);
		}
		else
		{
			wait(4);
		}
		level thread exploder_trigger(trigger, script_value);
		return;
	}
	exploder(script_value);
	level notify("killexplodertridgers" + script_value);
}

/*
	Name: reportexploderids
	Namespace: exploder
	Checksum: 0x16EA9D15
	Offset: 0x2078
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function reportexploderids()
{
	/#
		if(!isdefined(level._exploder_ids))
		{
			return;
		}
		println("");
		foreach(k, v in level._exploder_ids)
		{
			println(k + "" + v);
		}
	#/
}

/*
	Name: getexploderid
	Namespace: exploder
	Checksum: 0x96255B55
	Offset: 0x2138
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function getexploderid(ent)
{
	if(!isdefined(level._exploder_ids))
	{
		level._exploder_ids = [];
		level._exploder_id = 1;
	}
	if(!isdefined(level._exploder_ids[ent.v[#"exploder"]]))
	{
		level._exploder_ids[ent.v[#"exploder"]] = level._exploder_id;
		level._exploder_id++;
	}
	return level._exploder_ids[ent.v[#"exploder"]];
}

/*
	Name: createexploder
	Namespace: exploder
	Checksum: 0xACDED1C9
	Offset: 0x2218
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function createexploder(fxid)
{
	ent = fx::create_effect("exploder", fxid);
	ent.v[#"delay"] = 0;
	ent.v[#"exploder"] = 1;
	ent.v[#"exploder_type"] = "normal";
	return ent;
}

/*
	Name: activate_exploder
	Namespace: exploder
	Checksum: 0x2C2245E2
	Offset: 0x22B8
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function activate_exploder(num)
{
	num = int(num);
	level notify("exploder" + num);
	client_send = 1;
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			if(client_send && isdefined(level.createfxexploders[num][i].v[#"exploder_server"]))
			{
				client_send = 0;
			}
			level.createfxexploders[num][i] activate_individual_exploder(num);
		}
	}
	if(level.clientscripts)
	{
		if(client_send == 1)
		{
			activate_exploder_on_clients(num);
		}
	}
}

/*
	Name: activate_radiant_exploder
	Namespace: exploder
	Checksum: 0x8069BA95
	Offset: 0x23E8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function activate_radiant_exploder(string)
{
	level notify("exploder" + string);
	if(isdefined(level.var_13a6af33))
	{
		[[level.var_13a6af33]](string);
	}
	activateclientradiantexploder(string);
}

/*
	Name: activate_individual_exploder
	Namespace: exploder
	Checksum: 0x828B52C9
	Offset: 0x2450
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function activate_individual_exploder(num)
{
	level notify("exploder" + self.v[#"exploder"]);
	if(!level.clientscripts || !isdefined(level._exploder_ids[int(self.v[#"exploder"])]) || isdefined(self.v[#"exploder_server"]))
	{
		/#
			println("" + self.v[#"exploder"] + "");
		#/
		if(isdefined(self.v[#"firefx"]))
		{
			self thread fire_effect();
		}
		if(isdefined(self.v[#"fxid"]) && self.v[#"fxid"] != "No FX")
		{
			self thread cannon_effect();
		}
		else if(isdefined(self.v[#"soundalias"]))
		{
			self thread sound_effect();
		}
		if(isdefined(self.v[#"earthquake"]))
		{
			self thread earthquake();
		}
		if(isdefined(self.v[#"rumble"]))
		{
			self thread rumble();
		}
	}
	if(isdefined(self.v[#"trailfx"]))
	{
		self thread trail_effect();
	}
	if(isdefined(self.v[#"damage"]))
	{
		self thread exploder_damage();
	}
	if(self.v[#"exploder_type"] == "exploder")
	{
		self thread brush_show();
	}
	else if(self.v[#"exploder_type"] == "exploderchunk" || self.v[#"exploder_type"] == "exploderchunk visible")
	{
		self thread brush_throw();
	}
	else
	{
		self thread brush_delete();
	}
}

/*
	Name: activate_exploder_on_clients
	Namespace: exploder
	Checksum: 0x98C8AFDA
	Offset: 0x2760
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function activate_exploder_on_clients(num)
{
	if(!isdefined(level._exploder_ids[num]))
	{
		return;
	}
	if(!isdefined(level._client_exploders[num]))
	{
		level._client_exploders[num] = 1;
	}
	if(!isdefined(level._client_exploder_ids[num]))
	{
		level._client_exploder_ids[num] = 1;
	}
	activateclientexploder(level._exploder_ids[num]);
}

/*
	Name: stop_exploder
	Namespace: exploder
	Checksum: 0x120858CB
	Offset: 0x2808
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function stop_exploder(num)
{
	if(level.clientscripts)
	{
		delete_exploder_on_clients(num);
	}
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			if(!isdefined(level.createfxexploders[num][i].looper))
			{
				continue;
			}
			level.createfxexploders[num][i].looper delete();
		}
	}
}

/*
	Name: delete_exploder_on_clients
	Namespace: exploder
	Checksum: 0x50C85243
	Offset: 0x28D8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function delete_exploder_on_clients(exploder_id)
{
	if(isstring(exploder_id))
	{
		deactivateclientradiantexploder(exploder_id);
		return;
	}
	if(!isdefined(level._exploder_ids[exploder_id]))
	{
		return;
	}
	if(!isdefined(level._client_exploders[exploder_id]))
	{
		return;
	}
	level._client_exploders[exploder_id] = undefined;
	level._client_exploder_ids[exploder_id] = undefined;
	deactivateclientexploder(level._exploder_ids[exploder_id]);
}

/*
	Name: kill_exploder
	Namespace: exploder
	Checksum: 0xBE19FEF0
	Offset: 0x2990
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function kill_exploder(exploder_string)
{
	if(isstring(exploder_string))
	{
		killclientradiantexploder(exploder_string);
		return;
	}
	/#
		assertmsg("");
	#/
}

/*
	Name: exploder_damage
	Namespace: exploder
	Checksum: 0x73E351D3
	Offset: 0x29F8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function exploder_damage()
{
	if(isdefined(self.v[#"delay"]))
	{
		delay = self.v[#"delay"];
	}
	else
	{
		delay = 0;
	}
	if(isdefined(self.v[#"damage_radius"]))
	{
		radius = self.v[#"damage_radius"];
	}
	else
	{
		radius = 128;
	}
	damage = self.v[#"damage"];
	origin = self.v[#"origin"];
	wait(delay);
	self.model radiusdamage(origin, radius, damage, damage / 3);
}

/*
	Name: earthquake
	Namespace: exploder
	Checksum: 0x586C51F8
	Offset: 0x2B20
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function earthquake()
{
	earthquake_name = self.v[#"earthquake"];
	/#
		assert(isdefined(level.earthquake) && isdefined(level.earthquake[earthquake_name]), "" + earthquake_name + "");
	#/
	self exploder_delay();
	eq = level.earthquake[earthquake_name];
	earthquake(eq[#"magnitude"], eq[#"duration"], self.v[#"origin"], eq[#"radius"]);
}

/*
	Name: rumble
	Namespace: exploder
	Checksum: 0xE0242E82
	Offset: 0x2C40
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function rumble()
{
	self exploder_delay();
	a_players = getplayers();
	if(isdefined(self.v[#"damage_radius"]))
	{
		n_rumble_threshold_squared = self.v[#"damage_radius"] * self.v[#"damage_radius"];
	}
	else
	{
		/#
			println("" + self.v[#"exploder"] + "");
		#/
		n_rumble_threshold_squared = 16384;
	}
	for(i = 0; i < a_players.size; i++)
	{
		n_player_dist_squared = distancesquared(a_players[i].origin, self.v[#"origin"]);
		if(n_player_dist_squared < n_rumble_threshold_squared)
		{
			a_players[i] playrumbleonentity(self.v[#"rumble"]);
		}
	}
}

/*
	Name: stop_after_duration
	Namespace: exploder
	Checksum: 0x3629AF0F
	Offset: 0x2DD8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function stop_after_duration(name, duration)
{
	wait(duration);
	stop_exploder(name);
}

/*
	Name: exploder_duration
	Namespace: exploder
	Checksum: 0x79A14A35
	Offset: 0x2E10
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function exploder_duration(name, duration)
{
	if(!(isdefined(duration) && duration))
	{
		return;
	}
	exploder(name);
	level thread stop_after_duration(name, duration);
}

