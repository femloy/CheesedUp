function scr_player_trashroll()
{
	image_speed = 0.35;
	hsp = xscale * movespeed;
	if (gravesurfingjumpbuffer > 0)
		gravesurfingjumpbuffer--;
	if ((scr_slope() && hsp != 0) && movespeed < 14)
		scr_player_addslopemomentum(0.25, 0.25);
	movespeed = max(3, movespeed);
	if (sprite_index != spr_playercorpsestart && sprite_index != spr_playercorpsesurf)
	{
		if (sprite_index != spr_player_trashjump && sprite_index != spr_player_trashjump2 && sprite_index != spr_player_trashfall)
			sprite_index = spr_player_trashslide;
		else
		{
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
				sprite_index = spr_player_trashfall;
			if (vsp > 0 && sprite_index == spr_player_trashjump)
			{
				sprite_index = spr_player_trashjump2;
				image_index = 0;
			}
			if (grounded && vsp > 0)
			{
				sprite_index = spr_player_trashslide;
				image_speed = 0.35;
			}
		}
	}
	else
	{
		image_speed = 0.35;
		if (sprite_index == spr_playercorpsestart && floor(image_index) == (image_number - 1))
			sprite_index = spr_playercorpsesurf;
	}
	if (!instance_exists(obj_slidecloud) && grounded)
	{
		if (!place_meeting(x, y + 1, obj_current))
		{
			with (instance_create(x, y, obj_slidecloud))
				copy_player_scale(other);
		}
	}
	if (input_buffer_jump > 0 && gravesurfingjumpbuffer <= 15)
	{
		input_buffer_jump = 0;
		dir = xscale;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		jumpstop = false;
		vsp = IT_jumpspeed();
		
		particle_set_scale(part.jumpdust, REMIX ? xscale : 1, 1);
		create_particle(x, y, part.jumpdust);
	}
	if ((check_solid(x + xscale, y) || place_meeting(x + xscale, y, obj_ghostwall)) && scr_preventbump()) || place_meeting(x, y, obj_timedgate)
	{
		image_index = 0;
		sprite_index = spr_bump;
		state = states.bump;
		hsp = -xscale * 3;
		vsp = -3;
	}
}
