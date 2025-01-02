function scr_player_rupertjump()
{
	SS_CODE_START;
	
	static blue_aft = 0;
	if (sprite_index != spr_player_skatespin && floor(image_index) >= image_number - 1)
	{
		image_index = 0;
		switch (sprite_index)
		{
			case spr_player_skatejumpstart:
				sprite_index = spr_player_skatejump;
				break;
			case spr_player_skatedoublejumpstart:
				sprite_index = spr_player_skatedoublejump;
				break;
			case spr_player_skatewalljumpstart:
				sprite_index = spr_player_skatewalljump;
				break;
		}
	}
	if (key_jump && !grounded && doublejump == 0)
	{
		jumpstop = true;
		doublejump = 1;
		vsp = -14;
		image_index = 0;
		sprite_index = spr_player_skatedoublejumpstart;
		with (instance_create(x, y, obj_highjumpcloud2))
			copy_player_scale(other);
		scr_fmod_soundeffect(jumpsnd, x, y);
	}
	if (vsp >= 10 || sprite_index == spr_player_skatespin || ((doublejump || sprite_index == spr_player_skatewalljump || sprite_index == spr_player_skatewalljumpstart) && vsp >= 1))
	{
		jumpstop = true;
		if (sprite_index != spr_player_skatespin)
		{
			flash = true;
			sprite_index = spr_player_skatespin;
		}
		vsp += 0.5;
		vsp = min(vsp, 40);
		//if (!instance_exists(groundpoundEffect))
		//	groundpoundEffect = instance_create(x, y, 472, 
		//	{
		//		playerID: id
		//	});
		if !instance_exists(superslameffectid)
			with (instance_create(x, y + vsp, obj_superslameffect))
			{
				playerid = other.object_index;
				other.superslameffectid = id;
			}
		//create_particle(x, y, part.groundpoundeffect);
		//if (vsp > 17 && !instance_exists(obj_piledrivereffect))
		//	instance_create(x, y, obj_piledrivereffect, 
		//	{
		//		playerID: id
		//	});
		blue_aft++;
		if (blue_aft >= 6)
		{
			create_afterimage(x, y, sprite_index, image_index); // Might need to be adjusted
			blue_aft = 0;
		}
		image_speed = clamp(floor(abs(vsp) / 20) * 0.5, 0, 0.5) + 0.4;
	}
	else
		image_speed = 0.35;
	hsp = movespeed;
	move = key_left + key_right;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (move != 0)
		movespeed = Approach(movespeed, move * 8, 0.65);
	else
		movespeed = Approach(movespeed, 0, 0.65);
	if (check_solid(x + sign(hsp), y) || check_slope(x + sign(hsp), y))
	{
		if (key_jump2 && move != 0 && move == sign(hsp))
		{
			vsp = 0;
			image_index = 0;
			sprite_index = spr_player_skatewallrun;
			state = states.removed_state;
			xscale = sign(hsp);
		}
		else
			movespeed = 0;
	}
	if (grounded && vsp > 0)
	{
		doublejump = false;
		if (sprite_index == spr_player_skatespin && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_ratblock))
		{
			if (check_slope(x, y))
			{
				movespeed = 11;
				xscale = -slope_direction();
				with (instance_create(x, y, obj_jumpdust))
					copy_player_scale(other);
				state = states.removed_state;
			}
			else
			{
				//scr_sound(sound_maximumspeedland); LOY DO THIS
				image_index = 0;
				movespeed = 0;
				state = states.removed_state;
				jumpAnim = 1;
				jumpstop = 0;
				with (obj_baddie)
				{
					if (bbox_in_camera(view_camera[0]) && grounded)
					{
						vsp = -7;
						hsp = 0;
					}
				}
				shake_camera(10, 30 / room_speed);
				combo = 0;
				bounce = 0;
				instance_create(x, y, obj_landcloud);
				freefallstart = 0;
				image_index = 0;
				sprite_index = spr_player_skatecrouch;
				flash = true;
			}
		}
		else if (sprite_index != spr_player_skatespin)
		{
			if (check_slope(x, y + 1))
			{
				movespeed = 8;
				xscale = -slope_direction();
				with (instance_create(x, y, obj_jumpdust))
					copy_player_scale(other);
				state = states.removed_state;
			}
			else
			{
				state = states.removed_state;
				if (sign(hsp) != 0)
					xscale = sign(hsp);
				movespeed = abs(movespeed);
				hsp = xscale * movespeed;
			}
		}
	}
	
	SS_CODE_END;
}