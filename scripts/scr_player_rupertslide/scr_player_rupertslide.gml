function scr_player_rupertslide()
{
	SS_CODE_START;
	
	momemtum = false;
	hsp = xscale * movespeed;
	move = key_left + key_right;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (key_jump && grounded)
	{
		vsp = -10;
		instance_create(x, y, obj_highjumpcloud2);
		scr_fmod_soundeffect(jumpsnd, x, y);
		sprite_index = spr_player_skatedoublejumpstart;
		image_index = 0;
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
		state = states.rupertjump;
		movespeed = hsp;
	}
	if (grounded && movespeed < 14)
		scr_player_addslopemomentum(0.25, 0);
	if ((sprite_index != spr_player_skatedoublejumpstart && sprite_index != spr_player_skatedoublejump) || (grounded && vsp > 0))
		sprite_index = spr_player_skatewalk;
	if (floor(image_index) >= image_number - 1 && sprite_index == spr_player_skatedoublejumpstart)
	{
		image_index = 0;
		sprite_index = spr_player_skatedoublejump;
	}
	if (!grounded && vsp >= 10)
	{
		movespeed = hsp;
		state = states.rupertjump;
		flash = true;
		momemtum = true;
		sprite_index = spr_player_skatespin;
	}
	if (check_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_ratblock) && !place_meeting(x + sign(hsp), y, obj_metalblock))
	{
		if (!grounded)
		{
			vsp = 0;
			image_index = 0;
			sprite_index = spr_player_skatewallrun;
			state = states.rupertstick;
			xscale = sign(hsp);
		}
		else
		{
			sound_play_3d(sfx_bumpwall, x, y);
			sprite_index = spr_player_skatefall;
			state = states.rupertjump;
			vsp = -4;
			xscale = -sign(hsp);
			movespeed = xscale * 5;
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
		}
	}
	image_speed = 0.5;
	
	SS_CODE_END;
}