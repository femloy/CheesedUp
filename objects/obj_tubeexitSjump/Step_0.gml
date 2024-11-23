if (state == states.tube)
{
	if (floor(image_index) >= 6)
	{
		with (playerid)
		{
			visible = true;
			sprite_index = spr_superspringplayer;
			state = states.Sjump;
			vsp = -10;
			if (check_solid(x, y))
			{
				while (check_solid(x, y))
					y--;
			}
			var p = (object_index == obj_player1) ? 0 : 1;
			GamepadSetVibration(p, 1, 1, 0.9);
		}
	}
	with (playerid)
	{
		if (!place_meeting(x, y, other.id))
		{
			with (other)
			{
				GamepadSetVibration(0, 1, 1, 0.65);
				playerid = -1;
				state = states.normal;
			}
		}
	}
}
