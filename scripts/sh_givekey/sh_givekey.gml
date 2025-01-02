function sh_givekey()
{
	if !WC_debug
		return WC_NODEBUG;
	
	if global.key_inv > 0
	{
		global.key_inv = 0;
		return "Removed key";
	}
	else
	{
		global.key_inv = 1;
		sound_play("event:/sfx/misc/collecttoppin");
	}
}
function meta_givekey()
{
	return {
		description: "gives or takes a key from the player",
	}
}
