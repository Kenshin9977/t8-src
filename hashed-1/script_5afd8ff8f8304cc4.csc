// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
hashed-1\script_3c362258ff800237.csc;
#using scripts\core_common\system_shared.csc;

#namespace cschashed-1\script_5afd8ff8f8304cc4;

/*
	Name: function_89f2df9
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0x60D9E7B5
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
autoexec function function_89f2df9()
{
	system::register(#"hash_7ceb08aa364e4596", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0x52F15B95
	Offset: 0xC0
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
	cschashed-1\script_3c362258ff800237::register_challenge(#"hash_250115340b2e27a5", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0x103696EB
	Offset: 0x128
	Size: 0x2E
	Parameters: 2
	Flags: Private
*/
private function function_d1de6a85(local_client_num, params)
{
	level.var_7db2b064 = &function_ecc5a0b9;
}

/*
	Name: function_9e7b3f4d
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0x5FF4ECBD
	Offset: 0x160
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
private function function_9e7b3f4d(local_client_num)
{
	level.var_7db2b064 = undefined;
}

/*
	Name: is_active
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0x81DB9F97
	Offset: 0x180
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = cschashed-1\script_3c362258ff800237::function_a36e8c38(#"hash_250115340b2e27a5");
	return isdefined(challenge);
}

/*
	Name: function_ecc5a0b9
	Namespace: cschashed-1\script_5afd8ff8f8304cc4
	Checksum: 0xE515960F
	Offset: 0x1C0
	Size: 0x44
	Parameters: 3
	Flags: Private
*/
private function function_ecc5a0b9(local_client_num, player, damage)
{
	if(int(damage) <= 1)
	{
		return 1;
	}
	return 0;
}

