function scr_player_crouchslide()
{
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	
	move = key_left + key_right;
	if (movespeed >= 0 && grounded)
		movespeed -= 0.2;
	if (!key_jump2 && !jumpstop && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = true;
	}
	
	if ((can_jump && input_buffer_jump > 0) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	&& IT_crouchslide_jumpdive()
	{
		jumpstop = false;
		input_buffer_jump = 0;
		sprite_index = spr_player_jumpdive1;
		image_index = 0;
		vsp = IT_jumpspeed();
		with (instance_create(x, y, obj_superdashcloud))
		{
			copy_player_scale(other);
			other.dashcloudid = id;
		}
	}
	if (grounded && (sprite_index == spr_player_jumpdive1 || sprite_index == spr_player_jumpdive2) && vsp > 0)
	{
		sprite_index = spr_crouchslip;
		jumpstop = false;
	}
	if (sprite_index == spr_player_jumpdive1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_jumpdive2;
	
	mask_index = spr_crouchmask;
	if ((grounded && key_attack) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	&& !CHAR_POGONOISE
	{
		movespeed = 8;
		state = states.mach2;
		image_index = 0;
		sprite_index = spr_rollgetup;
	}
	if (((movespeed <= 5 || ((scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1))) && !check_slope(x + sign(hsp), y)) || movespeed <= 0)
		state = states.crouch;
	if ((scr_solid(x + 1, y) && xscale == 1) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)))
		state = states.crouch;
	if ((scr_solid(x - 1, y) && xscale == -1) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)))
		state = states.crouch;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_slidecloud))
			copy_player_scale(other);
	}
	image_speed = movespeed / 24;
}
