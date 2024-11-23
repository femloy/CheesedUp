mask_index = spr_haystack;
if sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup
{
	with obj_peasanto
	{
		if state == states.charge && place_meeting(x + hsp, y, other)
			other.sprite_index = spr_haystackburningup;
	}
	with obj_player
	{
		if (state == states.firemouth && (place_meeting(x + hsp, y, other) || place_meeting(x, y + 1, other))) || (state == states.fireass && place_meeting(x, y + 1, other))
			other.sprite_index = spr_haystackburningup;
	}
}
else if sprite_index == spr_haystackburningup
{
	if floor(image_index) == image_number - 1
		sprite_index = spr_haystackburning;
}
else if sprite_index == spr_haystackburning
{
	var burnout = true;
	with obj_haystack
	{
		if distance_to_object(other) <= 1 && sprite_index != spr_haystackburning
		{
			sprite_index = spr_haystackburningup;
			burnout = false;
		}
	}
	
	with instance_place(x, y - 1, obj_baddie)
	{
		if state != states.grabbed
			instance_destroy();
	}
	
	if !in_saveroom()
		add_saveroom();
	
	if burnout
	{
		if firetimer > 0 && !firetimeinf
			firetimer--;
		if firetimer <= 0 && !firetimeinf
		{
			sprite_index = spr_haystack;
			firetimer = 200;
		}
	}
	
	with obj_player
	{
		if state != states.fireass && state != states.knightpep
		&& place_meeting(x, y + 1, other)
		{
			if character == "V"
				scr_hurtplayer(id);
			else if scr_transformationcheck()
			{
				var _pindex = (object_index == obj_player1) ? 0 : 1;
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				
				if state != states.fireass or vsp >= 0
				{
					sound_play_3d("event:/sfx/pep/burn", x, y);
					if !fmod_event_instance_is_playing(global.snd_fireass)
						fmod_event_instance_play(global.snd_fireass);
				}
				
				state = states.fireass;
				vsp = -5;
				fireasslock = false;
				sprite_index = spr_fireass;
				image_index = 0;
				movespeed = hsp;
			}
		}
	}
}
if state == states.transition
{
	hsp = movespeed * dir;
	if check_solid(x + sign(hsp), y) && (!check_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y - 4))
		x_to = x;
	
	if (dir > 0 && x >= x_to) || (dir < 0 && x <= x_to)
	{
		x = x_to;
		hsp = 0;
		state = states.normal;
	}
}
