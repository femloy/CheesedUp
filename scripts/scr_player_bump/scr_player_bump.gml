function scr_player_bump()
{
	if sprite_index != spr_wallsplat && sprite_index != spr_lonegustavo_wallsplat
	{
		movespeed = 0;
		mach2 = 0;
		var _gus = sprite_index == spr_ratmount_bump || sprite_index == spr_lonegustavobump;
		start_running = true;
		alarm[4] = 14;
		
		if grounded && vsp > 0
			hsp = 0;
		
		var can_end = true;
		if sprite_index == spr_tumbleend
		{
			can_end = !place_meeting(x, y, obj_pepgoblin_kickhitbox);
			if IT_old_ball_transfo()
				can_end |= grounded;
			else if floor(image_index) >= 3 && !grounded
				image_index = 3;	
		}
		
		if sprite_index == spr_tumbleend && !can_end
			image_speed = 0;
		else
			image_speed = 0.35;
		
		if sprite_index == spr_rockethitwall && grounded && vsp > 0
			image_index = image_number - 1;
		
		if floor(image_index) == image_number - 1 && sprite_index != spr_player_catched && sprite_index != spr_boxxedpep_air && !_gus
		{
			if !skateboarding
			{
				if sprite_index != spr_rockethitwall || (grounded && vsp > 0)
					state = states.normal;
			}
			else
				state = states.mach2;
		}
		
		if grounded && vsp > 0 && _gus
			state = states.ratmount;
		
		if sprite_index != spr_player_catched && sprite_index != spr_boxxedpep_air && sprite_index != spr_rockethitwall && sprite_index != spr_tumbleend && sprite_index != spr_hitwall && !_gus && sprite_index != spr_mach && sprite_index != spr_mach4
			sprite_index = !skateboarding ? spr_bump : spr_clownbump;
	}
	else
	{
		movespeed = 0;
		hsp = 0;
		vsp = 0;
		if floor(image_index) == image_number - 1
			state = states.normal;
		image_speed = 0.35;
	}
	if state == states.normal && isgustavo
		state = states.ratmount;
}
