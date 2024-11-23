function scr_player_machroll()
{
	if character == "S"
		scr_snick_roll();
	else
		state_player_machroll();
}
function state_player_machroll()
{
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = xscale * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	mach2 = 100;
	machslideAnim = true;
	move = key_right + key_left;
	
	// bump
	if (scr_solid(x + xscale, y) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		sound_play_3d(sfx_bumpwall, x, y);
		
		hsp = 0;
		image_speed = 0.35;
		flash = false;
		combo = 0;
		state = states.bump;
		hsp = -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10 * xscale, y + 10, obj_bumpeffect);
		mask_index = spr_player_mask;
		if (scr_solid(x, y))
		{
			var ty = try_solid(0, 1, obj_solid, 32);
			if (ty != -1)
				y += ty;
		}
	}
	
	static cloud_time = 0;
	if ((++cloud_time >= sprite_get_number(spr_cloudeffect) / 0.5) && grounded)
	{
		cloud_time = 0;
		create_particle(x, y + 43, part.cloudeffect);
	}
	image_speed = 0.8;
	
	if !CHAR_POGONOISE
	{
		if (sprite_index == spr_playerV_divekickstart && floor(image_index) == (image_number - 1))
			sprite_index = spr_playerV_divekick;
		if (grounded && sprite_index != spr_playerV_divekickstart)
			sprite_index = !skateboarding ? spr_machroll : spr_clowncrouch;
		else if (sprite_index != spr_dive && !skateboarding)
		{
			sprite_index = spr_dive;
			vsp = 10;
		}
		if (scr_slope())
			movespeed += 0.1;
		if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
		{
			image_index = 0;
			if (grounded)
				sprite_index = spr_rollgetup;
			if (movespeed < 12 || skateboarding == 1)
			{
				if (!grounded)
					sprite_index = spr_mach;
				state = states.mach2;
			}
			else
			{
				if (!grounded)
					sprite_index = spr_mach4;
				state = states.mach3;
			}
		}
		if (skateboarding && movespeed < 12)
			movespeed += 0.5;
	}
	else
	{
		if ((!key_down || !grounded) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
		{
			image_index = 0;
			state = states.mach3;
			sprite_index = spr_playerN_jetpackboost;
		}
	}
}
