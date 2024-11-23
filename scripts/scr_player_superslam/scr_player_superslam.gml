function scr_player_superslam()
{
	if (sprite_index == spr_playerSP_piledriverstart && floor(image_index) >= image_number - 1)
		sprite_index = spr_piledriver;
	if (sprite_index == spr_piledriver or sprite_index == spr_playerSP_piledriverstart)
	{
		move = key_left + key_right;
		hsp = move * movespeed;
		if (move != dir && move != 0)
		{
			dir = move;
			movespeed = 0;
		}
	}
	else
	{
		move = 0;
		hsp = 0;
	}
	
	if IT_FINAL
	{
		if (vsp > 0)
			freefallsmash++;
		if (freefallsmash >= 10 && !instance_exists(superslameffectid))
		{
			with (instance_create(x, y, obj_superslameffect))
			{
				playerid = other.object_index;
				other.superslameffectid = id;
			}
		}
		
		if (vsp > 0)
		{
			if (punch_afterimage > 0)
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with (create_mach3effect(x, y, sprite_index, image_index, true))
				{
					image_xscale = other.xscale;
					playerid = other.id;
					maxmovespeed = 6;
					vertical = true;
					fadeoutstate = states.superslam;
				}
			}
		}
		
		if (sprite_index == spr_piledriver && vsp >= 0)
		{
			if (steppybuffer > 0)
				steppybuffer--;
			else
			{
				create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), part.cloudeffect, 0);
				steppybuffer = 8;
			}
			if (vsp > 17)
			{
				if (piledrivereffect > 0)
					piledrivereffect--;
				else
				{
					with (instance_create(x, y, obj_parryeffect))
						sprite_index = spr_piledrivereffect;
					piledrivereffect = 15;
				}
			}
			vsp += 0.5;
		}
	}
	
	var breakmetal = freefallsmash >= 10 && place_meeting(x, y + vsp, obj_metalblock);
	if !IT_FINAL
		breakmetal = false;
	
	if (grounded && !breakmetal && !place_meeting(x, y + 1, obj_destructibles) && sprite_index == spr_piledriver && vsp > 0)
	{
		sound_play_3d(sfx_groundpound, x, y);
		create_particle(x, y + 3, part.groundpoundeffect, 0);
		sprite_index = spr_piledriverland;
		jumpAnim = true;
		image_index = 0;
		shake_camera(20, 40 / room_speed);
		hsp = 0;
		bounce = false;
		with (instance_create(x, y + 35, obj_bangeffect))
			xscale = obj_player.xscale;
		create_particle(x, y, part.landcloud, 0);
		freefallstart = 0;
		
		if (IT_FINAL && freefallsmash >= 10)
		{
			with (obj_baddie)
			{
				if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound && state != states.grabbed)
				{
					state = states.stun;
					if (stunned < 60)
						stunned = 60;
					vsp = -11;
					image_xscale *= -1;
					hsp = 0;
					momentum = 0;
				}
			}
			shake_camera(10, 30 / room_speed);
			combo = 0;
			bounce = false;
		}
	}
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
	{
		vsp = -6;
		state = states.jump;
	}
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5;
		else if (floor(movespeed) == 6)
			movespeed = 6;
	}
	else
		movespeed = 0;
	if (movespeed > 6)
		movespeed -= 0.1;
	if (CHAR_OLDNOISE && move != 0)
		xscale = move;
	if (vsp < 0 or !IT_FINAL)
		image_speed = 0.35;
	else
		image_speed = 0.5;
}
