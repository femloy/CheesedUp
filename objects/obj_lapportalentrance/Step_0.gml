if (active)
{
	with (obj_player)
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
		visible = false;
	}
}
if floor(image_index) == image_number - 1
{
	switch sprite_index
	{
		case spr_appear:
			if !(SUGARY_SPIRE && sugary)
				sound_play_3d("event:/sfx/misc/secretexit", x, y);
			sprite_index = spr_spit;
			break;
		
		case spr_spit:
			sprite_index = spr_disappear;
			with obj_player
			{
				state = states.normal;
				if isgustavo
					state = states.ratmount;
				visible = true;
			}
			active = false;
			break;
		
		case spr_disappear:
			with obj_lap2visual
				event_user(0);
			instance_create_unique(0, 0, obj_lap2visual);
			instance_destroy();
			break;
	}
	if REMIX or (SUGARY_SPIRE && sugary)
		image_index = 0;
}
