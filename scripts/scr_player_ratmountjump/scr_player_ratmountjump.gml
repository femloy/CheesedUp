function scr_player_ratmountjump()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	move = key_left + key_right;
	if (sprite_index == spr_lonegustavodashjump)
		image_speed = 0.6;
	else
		image_speed = 0.35;
	if (!jumpstop && vsp < 0.5 && !key_jump2)
	{
		vsp /= 10;
		jumpstop = true;
	}
	hsp = movespeed;
	var r = ratmount_movespeed;
	if ((check_solid(x + xscale, y) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || abs(movespeed) <= 6)
	{
		gustavodash = 0;
		ratmount_movespeed = 8;
	}
	if ((check_solid(x + hsp, y) && !check_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles)) && gustavodash != 51)
	{
		movespeed = 0;
		if (r >= 12)
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if (_bump)
			{
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				state = states.bump;
				if (brick)
					sprite_index = spr_ratmount_bump;
				else
					sprite_index = spr_lonegustavobump;
				image_index = 0;
				hsp = -xscale * 4;
				vsp = -5;
				shake_camera(4, 5 / room_speed);
				exit;
			}
		}
	}
	if (gusdashpadbuffer <= 0)
	{
		if (move != 0)
		{
			if (move == xscale)
				movespeed = Approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else if (gustavodash == 51)
				movespeed = Approach(movespeed, 0, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
		}
		else if (gustavodash == 51)
			movespeed = Approach(movespeed, 0, 0.5);
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if (move != xscale && move != 0)
		{
			ratmount_movespeed = 8;
			xscale = move;
		}
	}
	if (gusdashpadbuffer > 0 && movespeed != 0)
		xscale = sign(movespeed);
	if (jumpAnim && floor(image_index) == (image_number - 1))
	{
		jumpAnim = false;
		switch (sprite_index)
		{
			case spr_lonegustavojumpstart:
				sprite_index = spr_lonegustavojump;
				break;
			case spr_lonegustavodashjump:
				sprite_index = spr_lonegustavodashjump;
				break;
			case spr_ratmount_groundpound:
				sprite_index = spr_ratmount_groundpoundfall;
				break;
			case spr_ratmount_jump:
				sprite_index = spr_ratmount_fall;
				break;
			case spr_ratmount_jump2:
				sprite_index = spr_ratmount_fall2;
				break;
			case spr_ratmount_balloonend2:
				sprite_index = spr_ratmount_balloonend3;
				break;
			case spr_ratmount_mushroombounce:
				jumpAnim = true;
				image_index = image_number - 1;
				break;
			case spr_ratmount_balloonend1:
				if (vsp > 0)
				{
					jumpAnim = true;
					sprite_index = spr_ratmount_balloonend2;
				}
				else
					jumpAnim = true;
				break;
		}
	}
	if (scr_check_groundpound())
	{
		if (brick)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				create_particle(x, y, part.genericpoofeffect);
			}
		}
		brick = false;
		movespeed = hsp;
		state = states.ratmountgroundpound;
		image_index = 0;
		sprite_index = spr_lonegustavogroundpoundstart;
	}
	if (((scr_slapbuffercheck() && key_up) || key_shoot2) && brick)
	{
		scr_resetslapbuffer();
		ratmount_kickbrick();
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
		state = states.ratmountpunch;
		gustavohitwall = false;
		ratmountpunchtimer = 25;
		image_index = 0;
		if (move != 0)
			xscale = move;
		movespeed = xscale * 12;
		sprite_index = spr_lonegustavopunch;
	}
	var bounce = true;
	if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && !place_meeting(x, y + 5, obj_grindrail))
	{
		bounce = false;
		input_buffer_jump = 0;
		particle_set_scale(part.highjumpcloud2, xscale, 1);
		create_particle(x, y, part.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		if (brick)
		{
			if (ratmount_movespeed >= 12 && key_attack)
				sprite_index = spr_ratmount_dashjump;
			else
				sprite_index = spr_ratmount_jump;
		}
		else if (ratmount_movespeed >= 12 && key_attack)
			sprite_index = spr_lonegustavodashjump;
		else
			sprite_index = spr_ratmount_groundpound;
		image_index = 0;
		jumpAnim = true;
		state = states.ratmountjump;
		vsp = -11;
		jumpstop = false;
	}
	if (key_jump && brick && bounce)
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.65);
		state = states.ratmountbounce;
		instance_create(x, y, obj_highjumpcloud2);
		sprite_index = spr_ratmount_walljump;
		image_index = 0;
		vsp = -16;
	}
	if (grounded && vsp > 0 && sprite_index != spr_lonegustavokick)
	{
		doublejump = false;
		create_particle(x, y, part.landcloud, 0);
		state = states.ratmount;
		landAnim = true;
		jumpstop = false;
		if (brick && !key_attack)
			sprite_index = spr_ratmount_land;
		else
			landAnim = false;
		image_index = 0;
	}
	with (ratgrabbedID)
		scr_enemy_ratgrabbed();
	ratmount_shootpowerup();
	ratmount_dotaunt();
}
