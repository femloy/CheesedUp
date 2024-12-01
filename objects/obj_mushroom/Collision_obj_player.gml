if (!other.cutscene && sprite_index != spr_bounce && other.state != states.gotoplayer)
{
	other.jumpstop = true;
	with (other)
	{
		suplexmove = false;
		grounded = false;
		if (state == states.machslide)
			state = states.jump;
		if (state == states.normal || state == states.freefall)
			state = states.jump;
		if (state == states.climbwall)
			state = states.mach2;
	}
	if (sprite_index != spr_bounce || image_index > 5)
		sound_play_3d("event:/sfx/misc/mushroombounce", x, y);
	sprite_index = spr_bounce;
	if (other.state == states.jump || other.state == states.normal)
	{
		other.sprite_index = other.spr_machfreefall;
		other.image_index = 0;
	}
	image_index = 0;
	other.noisewalljump = 0;
	if SUGARY_SPIRE && sugary
		other.vsp = -21;
	else
		other.vsp = -14;
	other.jumpstop = true;
	if (other.isgustavo && other.state != states.ratmountskid && other.state != states.mach3)
	{
		if (other.ratmount_movespeed < 12)
		{
			other.sprite_index = other.spr_ratmount_mushroombounce;
			if (!other.brick)
				other.sprite_index = other.spr_lonegustavojumpstart;
		}
		else
		{
			other.sprite_index = other.spr_ratmount_dashjump;
			if (!other.brick)
				other.sprite_index = other.spr_lonegustavodashjump;
		}
		if other.state == states.tumble
			other.movespeed = abs(other.movespeed) * other.xscale;
		other.jumpAnim = true;
		other.state = states.ratmountjump;
		other.image_index = 0;
	}
}
