if image_index > 9
	mask_index = spr_masknull;

with instance_nearest(x, y, obj_ratblock)
{
	if place_meeting(x, y, other)
	{
		event_perform(ev_alarm, 0);
		other.mask_index = spr_masknull;
	}
}

with obj_player
{
	if distance_to_object(other) <= 50 && !other.hurtplayer
	{
		if key_jump2
		{
			vsp = -20;
			if state == states.normal || state == states.jump
			{
				sprite_index = spr_playerV_superjump;
				state = states.jump;
			}
			image_index = 0;
			jumpAnim = true;
			jumpstop = true;
			other.hurtplayer = true;
		}
	}
}
