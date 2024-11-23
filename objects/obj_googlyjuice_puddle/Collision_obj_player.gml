SS_CODE_START;

with other
{
	if grounded && (movespeed < 16 or instance_exists(obj_ghostcollectibles))
	{
		sound_play_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		vsp = -11;
		movespeed = abs(movespeed);
		//if movespeed < 14
		//	movespeed += 2;
		hsp = movespeed * xscale;
		image_index = 0;
		state = states.slipbanan;
		instance_destroy(other);
	}
}

SS_CODE_END;
