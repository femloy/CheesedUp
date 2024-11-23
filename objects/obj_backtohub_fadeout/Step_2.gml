if fadein
{
	fadealpha = Approach(fadealpha, 1, 0.03);
	if fadealpha >= 1
	{
		if !instance_exists(obj_player1)
		{
			
		}
		else
		{
			fadein = false;
			pos_player = false;
			
			with obj_player
			{
				targetRoom = backtohubroom;
				scr_room_goto(backtohubroom);
			}
		}
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.03);
	if fadealpha <= 0
		instance_destroy();
}
