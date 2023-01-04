// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using script_14d4cc4687ff9afd;
#using script_2fcb47e3735a6edd;
#using script_5c6694d7aa0f1490;
#using script_5e177698fdcdbe2c;
#using hashed-1\zm_sq.gsc;
#using script_72eca4c9e2aea110;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm\zm_orange_challenges.gsc;
#using scripts\zm\zm_orange_zones.gsc;
#using scripts\zm_common\zm_devgui.gsc;

#namespace namespace_c3bb1e21;

/*
	Name: init
	Namespace: namespace_c3bb1e21
	Checksum: 0x60DA2A13
	Offset: 0xD0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function init()
{
	/#
		level thread devgui();
	#/
}

/*
	Name: jump_to
	Namespace: namespace_c3bb1e21
	Checksum: 0x58721BFF
	Offset: 0xF8
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
private function jump_to(str_dest)
{
	/#
		s_dest = struct::get(str_dest);
		self setorigin(s_dest.origin);
		self setplayerangles(s_dest.angles);
	#/
}

/*
	Name: devgui
	Namespace: namespace_c3bb1e21
	Checksum: 0x591A5E3
	Offset: 0x170
	Size: 0x8A8
	Parameters: 0
	Flags: Private
*/
private function devgui()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		while(true)
		{
			waitframe(1);
			str_command = getdvarstring(#"hash_8ba12660bfba5e4", "");
			switch(str_command)
			{
				case "hash_78bca375c84177d4":
				{
					getplayers()[0] jump_to("");
					break;
				}
				case "hash_18769c2b6ae60247":
				{
					level thread cschashed-2\script_70e92046734b4a71::function_80a9077f();
					break;
				}
				case "hash_24668a82eef6ed20":
				{
					level thread cschashed-3\script_f459be361894751::function_79946aff();
					break;
				}
				case "hash_5aeb6018289cc278":
				{
					cschashed-3\script_20422991283c1b8::lava_control();
					break;
				}
				case "hash_75c01ef1f8005214":
				{
					iprintln("");
					level flag::set(#"hash_6dcc421d5fbf8d22");
					break;
				}
				case "hash_7db70cb23b9d2739":
				{
					iprintln("");
					level flag::clear(#"hash_6dcc421d5fbf8d22");
					break;
				}
				case "hash_58843c67593e2cfe":
				{
					namespace_86eed980::function_e4b04738();
					break;
				}
				case "test_last_stand":				{
					zm_devgui::zombie_devgui_open_sesame();
					cschashed-2\script_70e92046734b4a71::function_80a9077f();
					namespace_17555f14::function_3b77181c(1);
					if(level flag::get(#"hash_6f7fd3d4d070db87") == 0)
					{
						exploder::exploder("");
						level.var_9cc989a5 delete();
						level flag::set(#"hash_6f7fd3d4d070db87");
					}
					cschashed-3\script_20422991283c1b8::function_405f867d();
					break;
				}
				case "hash_1ff4cd3ce63b00f9":
				{
					cschashed-1\script_4f00f8c9cdfa5084::function_61511fcf(0);
					cschashed-1\script_4f00f8c9cdfa5084::function_61511fcf(1);
					cschashed-1\script_4f00f8c9cdfa5084::function_61511fcf(2);
					break;
				}
				case "hash_3c6c8aaf444d0e1a":
				{
					level flag::set(#"hash_98e32feb5b8ac79");
					break;
				}
				case "hash_4f92a974297244f1":
				{
					if(!isdefined(level.var_969fe3f1))
					{
						level.var_969fe3f1 = 0;
					}
					level.var_969fe3f1 = !level.var_969fe3f1;
					break;
				}
				case "hash_78366ec4a1968af6":
				{
					foreach(item in level.var_50e4c504)
					{
						item show();
					}
					break;
				}
				case "play_portal":				{
					level thread cschashed-2\script_387ae8d7955ac404::function_d096f18f();
					break;
				}
				case "hash_86a620951049404":
				{
					cschashed-3\script_20422991283c1b8::function_fe36418c();
					break;
				}
				case "move_pap_boathouse":				{
					cschashed-3\script_f459be361894751::function_ccc079bc("");
					break;
				}
				case "move_pap_beach":				{
					cschashed-3\script_f459be361894751::function_ccc079bc("");
					break;
				}
				case "move_pap_ship":				{
					cschashed-3\script_f459be361894751::function_ccc079bc("");
					break;
				}
				case "move_pap_lagoon":				{
					cschashed-3\script_f459be361894751::function_ccc079bc("");
					break;
				}
				case "hash_7bfd0d4950600d9a":
				{
					cschashed-3\script_f459be361894751::function_ccc079bc("");
					break;
				}
				case "hash_5175915502a19219":
				{
					zm_devgui::zombie_devgui_open_sesame();
					cschashed-2\script_70e92046734b4a71::function_80a9077f();
					namespace_17555f14::function_3b77181c(1);
					level thread namespace_ee206246::function_f2dd8601(#"hash_5e9262eb6796af0a", 1);
					break;
				}
				case "hash_2918cc0fd8ab72cd":
				{
					level thread cschashed-3\script_f459be361894751::function_eaaea036();
					break;
				}
				case "hash_3da3831f62e16b2c":
				{
					level thread cschashed-3\script_f459be361894751::function_96ef31b7();
					break;
				}
				case "test_hell":				{
					cschashed-3\script_20422991283c1b8::test_hell();
					break;
				}
			}
			setdvar(#"hash_8ba12660bfba5e4", "");
		}
	#/
}

