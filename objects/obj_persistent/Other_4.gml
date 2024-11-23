/// @description mostly modifiers
live_auto_call;
ensure_order;

shell_force_off = false;
if shell_force_off
{
	global.showcollisions = false;
	with obj_shell
	{
		WC_showcollisions = false;
		WC_showinvisible = 0;
	}
}

// panic backgrounds
if instance_exists(obj_parallax)
{
	if global.panic && room != custom_lvl_room
	    event_user(1);
}
else
	exit;

// modifiers
pre_player_modifiers();
