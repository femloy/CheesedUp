function scr_player_frozen()
{
	image_speed = 0.35;
	
	movespeed += 0.01;
	if room == dungeon_9 or room == dungeon_10 or room == snick_challengeend
		movespeed += 0.02;
	
	if movespeed >= 1
	{
		movespeed = 0;
		state = states.normal;
		
		scr_hurtplayer(id);
		sound_play_3d("event:/sfx/pep/hurt", x, y);
		sound_play_3d(global.snd_screamboss, x, y);
		
		repeat 3
			sound_play_3d("event:/modded/sfx/enemyscream", x, y);
		with obj_tv
		{
			jumpscare = room_speed / 2
			//jumpscaretext = irandom(sprite_get_number(spr_scares_txt) - 1);
		}
		
		image_blend = c_white;
		with obj_music
			fmod_event_instance_set_pitch(panicmusicID, 1)
		exit;
	}
	
	if -key_left2 or key_right2 or key_up2 or key_down2 or key_jump or key_slap
	{
		shaketime = 8;
		hitLag -= 5;
		movespeed = max(movespeed - 0.04, 0);
		
		if hitLag <= 0
		{
			sound_play_3d(sfx_punch, x, y);
			sound_play_3d(sfx_breakblock, x, y);;
		
			movespeed = tauntstoredmovespeed;
			sprite_index = tauntstoredsprite;
			
			state = states.jump;
			jumpstop = true;
			vsp = IT_jumpspeed();
			sprite_index = spr_machfreefall;
			
			image_blend = c_white;
			with obj_music
				fmod_event_instance_set_pitch(panicmusicID, 1)
			exit;
		}
	}
	shaketime = Approach(shaketime, 0, 1);
	
	with obj_music
		fmod_event_instance_set_pitch(panicmusicID, lerp(1, 0.25, obj_player1.movespeed));
	image_blend = merge_colour(c_white, c_purple, movespeed);
}