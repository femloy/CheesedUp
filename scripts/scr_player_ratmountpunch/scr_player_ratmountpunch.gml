function scr_player_ratmountpunch()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	image_speed = abs(movespeed) / 12;
	hsp = movespeed;
	move = key_left + key_right;
	landAnim = false;
	sprite_index = spr_lonegustavopunch;
	if (grounded)
		movespeed = Approach(movespeed, xscale * 4, 0.1);
	ratmountpunchtimer--;
	if (ratmountpunchtimer < 0 && (!key_slap || gustavohitwall))
	{
		sprite_index = spr_lonegustavowalk;
		state = states.ratmount;
		if (hsp != 0)
		{
			dir = sign(hsp);
			xscale = dir;
		}
	}
	if (check_solid(x + hsp, y) && !check_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		sound_play_3d("event:/sfx/pep/bumpwall", x, y);
		GamepadSetVibration(0, 0.4, 0.4, 0.2);
		ratmountpunchtimer = 10;
		gustavohitwall = true;
		instance_create(x + hsp, y, obj_bangeffect);
		movespeed /= 1.5;
		movespeed *= -1;
	}
	if ((key_down && grounded && !gustavohitwall) || scr_solid(x, y))
	{
		if check_char("G")
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust);
			movespeed = 12;
			crouchslipbuffer = 25;
			sprite_index = spr_lonegustavocrouchwalk; // crouchslip
			machhitAnim = false;
			state = states.tumble;
			fmod_event_instance_play(snd_crouchslide);
		}
		else
			state = states.ratmountcrouch;
	}
	if (scr_check_groundpound2() && !grounded && !gustavohitwall)
	{
		movespeed = hsp;
		state = states.ratmountgroundpound;
		image_index = 0;
		sprite_index = spr_lonegustavogroundpoundstart;
	}
	if (punch_afterimage > 0)
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		create_blue_afterimage(x, y, sprite_index, image_index, xscale);
	}
}
