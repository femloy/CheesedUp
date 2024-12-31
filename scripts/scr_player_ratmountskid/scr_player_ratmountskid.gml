function scr_player_ratmountskid()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	hsp = xscale * -movespeed;
	movespeed = Approach(movespeed, 0, 0.8);
	if (brick)
		sprite_index = spr_ratmountskid;
	else
		sprite_index = spr_lonegustavoskid;
	gustavodash = 0;
	ratmount_movespeed = 8;
	image_speed = 0.4;
	if (abs(movespeed) <= 0 || abs(hsp) <= 0)
	{
		movespeed = 0;
		state = states.ratmount;
	}
	if (input_buffer_jump > 0 && can_jump && sprite_index != spr_ratmount_swallow)
	{
		particle_set_scale(part.highjumpcloud2, xscale, 1);
		create_particle(x, y, part.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		if (brick)
			sprite_index = spr_ratmount_jump;
		else if (ratmount_movespeed >= 12)
			sprite_index = spr_lonegustavodashjump;
		else
			sprite_index = spr_ratmount_groundpound;
		image_index = 0;
		if (state != states.ratmount)
			xscale *= -1;
		input_buffer_jump = 0;
		movespeed = hsp;
		jumpAnim = true;
		state = states.ratmountjump;
		vsp = IT_jumpspeed();
		jumpstop = false;
	}
	if (((scr_slapbuffercheck() && key_up) || key_shoot2) && brick)
	{
		scr_resetslapbuffer();
		ratmount_kickbrick();
		movespeed = -movespeed;
		hsp = movespeed;
		ratmount_movespeed = 8;
	}
	if (scr_slapbuffercheck() && !key_up)
	{
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust, 0);
		scr_resetslapbuffer();
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = false;
		movespeed = -movespeed;
		ratmountpunchtimer = 25;
		gustavohitwall = false;
		state = states.ratmountpunch;
		image_index = 0;
		if (move != 0)
			xscale = move;
		movespeed = xscale * 12;
		sprite_index = spr_lonegustavopunch;
	}
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			copy_player_scale(other);
			other.dashcloudid = id;
		}
	}
}
