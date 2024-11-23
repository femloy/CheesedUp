hsp = spd * image_xscale;
if (check_solid(x + sign(hsp), y))
	instance_destroy();
scr_collide();
if (playerid != noone)
{
	with (playerid)
	{
		if (state != states.skateboardnoise)
			other.playerid = noone;
		else
		{
			x = other.x;
			y = other.y;
			hsp = 0;
			vsp = 0;
		}
	}
}
sound_instance_move(snd, x, y);
