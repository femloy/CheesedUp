live_auto_call;

// stacked popups
with obj_popupscreen
{
	if self.id != other.id && other.depth > depth
		exit;
}

if state != 2
{
	t = Approach(t, 1, 0.07);
	if t >= 1
		state = 1;
	bg_alpha = Approach(bg_alpha, 1, 0.2);
}

if state == 1
{
	scr_menu_getinput();
	switch type
	{
		default:
			if key_jump
			{
				sound_play("event:/modded/sfx/diagclose");
				state = 2;
			}
			break;
		
		// Reconnecting
		case 0:
			if callback_buffer <= 0 && is_method(on_open)
			{
				on_open();
				on_open = noone;
			}
			if !instance_exists(obj_netclient) or !obj_netclient.disconnected
			{
				sound_play("event:/modded/sfx/diagclose");
				state = 2;
			}
			break;
	}
}

if state == 2
{
	t = Approach(t, 0, 0.1);
	if t <= 0
		instance_destroy();
	bg_alpha = Approach(bg_alpha, 0, 0.2);
}
