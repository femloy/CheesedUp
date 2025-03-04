function scr_player_slipbanan()
{
	hsp = xscale * movespeed;
	if (grounded)
		movespeed = Approach(movespeed, 0, 0.5);
	if (floor(image_index) == (image_number - 1) && sprite_index != spr_rockethitwall)
		image_speed = 0;
	else
		image_speed = 0.35;
	if (sprite_index == spr_slipbanan2)
	{
		scr_player_addslopemomentum(0.25, 0.75);
		if (!grounded)
		{
			sound_play_3d("event:/sfx/pep/slip", x, y);
			sprite_index = spr_slipbanan1;
			image_index = 3;
		}
	}
	if (grounded && vsp > -1 && sprite_index != spr_slipbanan2 && !place_meeting(x, y + 1, obj_destructibles))
	{
		if (sprite_index == spr_rockethitwall)
		{
			sound_play_3d("event:/sfx/pep/slipend", x, y);
			sprite_index = spr_slipbanan2;
			image_index = 0;
			image_speed = 0.35;
		}
		else
		{
			sound_play_3d("event:/sfx/pep/slipbump", x, y);
			vsp = -6;
			movespeed = Approach(movespeed, 0, 3);
			sprite_index = spr_rockethitwall;
			instance_create(x, y + 43, obj_bangeffect);
		}
	}
	if (sprite_index == spr_slipbanan2)
	{
		if (floor(image_index) == (image_number - 1) && abs(hsp) <= 2)
		{
			state = states.normal;
			if isgustavo
				state = states.ratmount;
		}
	}
	if (scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && scr_preventbump())
	{
		sound_play_3d("event:/sfx/pep/slipbump", x, y);
		if (sprite_index == spr_slipbanan1)
			movespeed = Approach(movespeed, 0, 3);
		sprite_index = spr_rockethitwall;
		instance_create(x + 30, y, obj_bangeffect);
		xscale *= -1;
		scr_sleep(1);
	}
	if (sprite_index != spr_slipbanan2 && scr_solid_player(x, y))
	{
		state = states.crouch;
		if isgustavo
			state = states.ratmountcrouch;
	}
}
