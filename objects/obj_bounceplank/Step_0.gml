with (obj_player)
{
	if (place_meeting(x, y + 1, other) && vsp > 0)
	{
		jumpstop = true;
		vsp = -14;
	}
}
