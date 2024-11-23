switch (state)
{
	case states.normal:
		with (obj_player)
		{
			if (other.state != states.walk && state == states.normal && vsp > 0 && key_up && place_meeting(x, y + 1, other))
			{
				state = states.actor;
				hsp = 0;
				vsp = 0;
				sprite_index = spr_idle;
				with (other)
				{
					playerid = other.id;
					playerxoffset = other.x - x;
					state = states.walk;
					if (check_solid(x + (dir * 32), y))
						dir *= -1;
				}
			}
		}
		break;
	case states.walk:
		x += (dir * 5);
		playerid.x = x + playerxoffset;
		playerid.hsp = 0;
		playerid.vsp = 0;
		if (check_solid(x + dir, y))
		{
			with (playerid)
				state = states.normal;
			state = states.normal;
			shake_camera(5, 5 / room_speed);
			dir *= -1;
		}
		break;
}
