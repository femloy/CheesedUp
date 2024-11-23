var _block = id;
with (obj_player)
{
	if (state != states.dead && place_meeting(x, y + 1, _block))
	{
		jumpstop = true;
		suplexmove = false;
		grounded = false;
		if (state == states.machslide)
			state = states.jump;
		if (state == states.normal || state == states.freefall)
			state = states.jump;
		if (state == states.climbwall)
			state = states.mach2;
		
		vsp = -11;
		_block.image_index = 0;
		_block.image_speed = 0.35;
	}
}
