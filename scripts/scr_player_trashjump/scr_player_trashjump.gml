function scr_player_trashjump()
{
	image_speed = 0.35;
	hsp = movespeed;
	move = key_left + key_right;
	if (move != 0)
		movespeed = Approach(movespeed, move * 6, 0.5);
	else
		movespeed = Approach(movespeed, 0, 0.25);
	if (scr_noise_machcancel_grab())
	{
		image_speed = 0.35;
		exit;
	}
	
	if (vsp > 0 && sprite_index == spr_player_trashjump)
	{
		sprite_index = spr_player_trashjump2;
		image_index = 0;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
		sprite_index = spr_player_trashfall;
	if (vsp < 0 && sprite_index != spr_player_trashjump)
		sprite_index = spr_player_trashjump;
	if (character == "N")
		sprite_index = spr_playerN_trash;
	
	if (grounded && vsp > 0)
	{
		if character != "N"
		{
			create_transformation_tip(lang_get_value("trashrolltip"), "trashroll");
			var slope = check_slope(x, y + 1, true);
			if slope
			{
				xscale = -sign(slope.image_xscale);
				scale_xs = 1;
			}
			movespeed = abs(movespeed);
			dir = xscale;
			movespeed = 8;
			state = states.trashroll;
		}
		else
			state = states.normal;
		
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust);
	}
}
