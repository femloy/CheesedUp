function scr_player_crouch()
{
	move = key_left + key_right;
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = move * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	movespeed = 4;
	mask_index = spr_crouchmask;
	turning = false;
	if (!grounded && !key_jump)
	{
		jumpAnim = false;
		state = states.crouchjump;
		movespeed = 4;
		crouchAnim = true;
		image_index = 0;
	}
	if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
	{
		state = states.normal;
		movespeed = 0;
		crouchAnim = true;
		jumpAnim = true;
		image_index = 0;
		mask_index = spr_player_mask;
	}
	if (crouchAnim == 0)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_crouch;
			else
				sprite_index = spr_shotgunduck;
		}
		if (move != 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_crawl;
			else
				sprite_index = spr_shotguncrawl;
		}
	}
	if (crouchAnim == 1)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_couchstart;
			else
				sprite_index = spr_shotgungoduck;
			if (floor(image_index) == (image_number - 1))
				crouchAnim = false;
		}
	}
	if (move != 0)
	{
		xscale = move;
		crouchAnim = false;
	}
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_fmod_soundeffect(jumpsnd, x, y);
		vsp = -8;
		state = states.crouchjump;
		movespeed = 4;
		image_index = 0;
		crouchAnim = true;
		jumpAnim = true;
	}
	if (key_down && scr_slope() && !(place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y, obj_platform)))
	{
		var slope = instance_place(x, y + 1, IT_FINAL ? obj_afom_ballslope : obj_slope);
		if slope
		{
			movespeed = 14;
			with slope
				other.xscale = -sign(image_xscale);
			state = states.tumble;
			sprite_index = spr_tumblestart;
		}
	}
	if character == "V"
	{
		scr_vigi_shoot();
		scr_vigi_throw();
	}
	image_speed = 0.45;
}
