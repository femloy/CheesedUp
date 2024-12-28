function scr_player_Sjumpprep()
{
	if CHAR_POGONOISE
		return scr_playerN_Sjumpprep();
	
	if sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft
		move = key_left + key_right;
	else
		move = xscale;
		
	if place_meeting(x, y + 1, obj_railparent)
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (move * movespeed) + (railmovespeed * raildir);
		
	if (sprite_index == spr_superjumpprep)
		movespeed = Approach(movespeed, 0, IT_Sjumpprep_deccel());
		
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
		sprite_index = spr_superjumppreplight;
	if (sprite_index == spr_superjumppreplight)
		movespeed = IT_Sjumpprep_speed();
		
	if (sprite_index != spr_superjumpprep)
	{
		if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
		{
			if (key_right)
				sprite_index = xscale == 1 ? spr_superjumpright : spr_superjumpleft;
			if (-key_left)
				sprite_index = xscale == 1 ? spr_superjumpleft : spr_superjumpright;
		}
		else
			sprite_index = spr_superjumppreplight;
	}
	if (!scr_check_superjump() && (grounded or (!superjumped && check_sugarychar())) && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		with instance_create(x, y, obj_explosioneffect)
			copy_player_scale(other, true);
		sprite_index = spr_superjump;
		state = states.Sjump;
		vsp = -17;
		image_index = 0;
		if (character == "N")
			scr_fmod_soundeffect(snd_noiseSjumprelease, x, y);
	}
	image_speed = 0.35;
}

function scr_playerN_Sjumpprep()
{
	hsp = 0;
	vsp = 0;
	if !REMIX
		pogochargeactive = false;
	pogocharge = 50;
	if (floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_playerN_jetpackstart)
		{
			if (pizzapepper == 0)
			{
				state = states.mach3;
				sprite_index = spr_playerN_jetpackboost;
				instance_create(x, y, obj_jumpdust);
				movespeed = 15;
			}
			else
			{
				state = states.mach3;
				sprite_index = spr_crazyrun;
				instance_create(x, y, obj_jumpdust);
				movespeed = 21;
			}
		}
		else if (sprite_index == spr_superjumpprep)
		{
			var sjumpsnd = superjumpsnd;
			if (character == "N")
				sjumpsnd = snd_noiseSjump;
			fmod_event_instance_set_parameter(superjumpsnd, "state", 2, true);
			instance_create(x, y, obj_explosioneffect);
			sprite_index = spr_superjump;
			state = states.Sjump;
			vsp = -15;
			if (character == "N")
				scr_fmod_soundeffect(snd_noiseSjumprelease, x, y);
		}
	}
	if (sprite_index == spr_playerN_jetpackstart)
		image_speed = 0.5;
	else
		image_speed = 0.3;
}