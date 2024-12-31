function scr_player_ladder()
{
	suplexmove = false;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	turning = false;
	jumpstop = false;
	movespeed = 0;
	hsp = 0;
	
	if (key_up && hooked == 0)
	{
		sprite_index = spr_laddermove;
		vsp = IT_ladder_up_speed(); // -6
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, part.cloudeffect, 0);
			steppybuffer = 12;
			sound_play_3d(stepsnd, x, y);
		}
		image_speed = 0.35;
	}
	else if (key_down && hooked == 0)
	{
		sprite_index = spr_ladderdown;
		vsp = IT_ladder_down_speed();
		image_speed = 0.35;
	}
	else
	{
		sprite_index = spr_Ladder;
		vsp = 0;
	}
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	
	if !place_meeting(x, y, obj_ladder) && !place_meeting(x, y, obj_stairs)
	{
		landAnim = false;
		jumpAnim = false;
		state = states.normal;
		image_index = 0;
		
		if !hooked && vsp < 0
		{
			var _y = 1;
			while !scr_solid(x, y + _y)
			{
				_y++;
				if _y > 32
				{
					_y = 0;
					break;
				}
			}
			y += _y - 1;
		}
		vsp = 0;
		hooked = false;
	}
	
	if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		hooked = false;
		sprite_index = spr_jump;
		ladderbuffer = 20;
		if (place_meeting(x, y, obj_hookup))
			ladderbuffer = 30;
		jumpAnim = true;
		state = states.jump;
		vsp = IT_jumpspeed();
		image_index = 0;
	}
	if (key_down && grounded && !place_meeting(x, y, obj_platform))
	{
		state = states.normal;
		image_index = 0;
	}
}
