if (player != -1)
{
	with (player)
	{
		hsp = 0;
		vsp = 0;
	}
}

if cooldown > 0 && !(place_meeting(x, y, obj_player) && cooldown <= 1)
	cooldown--;
