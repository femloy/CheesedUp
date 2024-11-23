with (other)
{
	if (state != states.trashroll && state != states.trashjump && state != states.cheeseball && state != states.chainsaw)
	{
		notification_push(notifs.slipbanan, []);
		sound_play_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		other.drop = true;
		vsp = -11;
		if (state == states.machcancel or character == "S" or movespeed < 0)
		{
			if (movespeed != 0)
				xscale = sign(movespeed);
			else if (move != 0)
				xscale = move;
			movespeed = abs(movespeed);
		}
		movespeed = min(movespeed + 2, 14);
		hsp = movespeed * xscale;
		image_index = 0;
		state = states.slipbanan;
	}
	instance_destroy(other);
}
