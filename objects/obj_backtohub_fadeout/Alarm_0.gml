if !instance_exists(obj_player1)
	alarm[0] = 1;
else
{
	if reset
	{
		global.levelreset = false;
		scr_playerreset(true);
	}
	
	pos_player = true;
	with obj_player
	{
		x = backtohubstartx;
		y = backtohubstarty - (540 * 2);
		state = states.backtohub;
		sprite_index = spr_slipbanan1;
		image_index = 10;
	}
}
