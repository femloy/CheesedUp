function scr_charswitch_sprite(back)
{
	if !back
	{
		with obj_player1
		{
			if character == "N"
				return spr_noise_intro;
		}
		return spr_gustavo_intro;
	}
	else
	{
		with obj_player1
		{
			if character == "N"
				return spr_backtonoise;
		}
		return spr_backtopeppino;
	}
}

function scr_switchgustavo(set_state = true, skip_gloves = false)
{
	with obj_player1
	{
		if character != "N"
		{
			ratmount_movespeed = 8;
			gustavodash = 0;
			isgustavo = true;
			if set_state
			{
				visible = true;
				state = states.ratmount;
				sprite_index = character == "V" ? spr_mortidle : spr_player_ratmountidle;
				jumpAnim = false;
			}
			brick = true;
			player_destroy_sounds();
			player_init_sounds();
		}
		else
		{
			isgustavo = false;
			noisecrusher = true;
			if set_state
			{
				visible = true;
				jumpAnim = false;
				state = states.normal;
				sprite_index = spr_idle;
				if room == street_jail && !skip_gloves
				{
					actor_buffer = 40;
					sprite_index = spr_playerN_glovesstart;
					image_index = 0;
					state = states.animation;
				}
			}
		}
	}
	if (room == street_jail)
	{
		with (obj_music)
		{
			if (music != noone)
				fmod_event_instance_set_parameter(music.event, "state", 1, true);
		}
	}
	else if (room == forest_G1)
	{
		with (obj_music)
		{
			if (music != noone)
				fmod_event_instance_set_parameter(music.event, "state", 2, true);
		}
	}
	with obj_swapmodefollow
	{
		isgustavo = true;
		get_character_spr();
	}
}

function scr_switchpeppino(set_state = true)
{
	with obj_player1
	{
		if character != "N"
		{
			gustavodash = 0;
			ratmount_movespeed = 8;
			isgustavo = false;
			brick = false;
			player_destroy_sounds();
			player_init_sounds();
			if set_state
			{
				visible = true;
				state = states.normal;
				jumpAnim = false;
				sprite_index = spr_idle;
			}
		}
		else
		{
			isgustavo = false;
			noisecrusher = false;
			if set_state
			{
				jumpAnim = false;
				sprite_index = spr_idle;
				visible = true;
				state = states.normal;
			}
		}
	}
	if (room == street_jail)
	{
		with (obj_music)
		{
			if (music != noone)
				fmod_event_instance_set_parameter(music.event, "state", 0, true);
		}
	}
	else if (room == forest_G1)
	{
		with (obj_music)
		{
			if (music != noone)
				fmod_event_instance_set_parameter(music.event, "state", 0, true);
		}
	}
	with obj_swapmodefollow
	{
		isgustavo = false;
		get_character_spr();
	}
}
