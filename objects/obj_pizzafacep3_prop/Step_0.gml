if (use_collision)
{
	if (!start)
	{
		sprite_index = stunspr;
		if (grounded && vsp > 0)
		{
			with (obj_player1)
			{
				sprite_index = spr_gnomecutscene1;
				if (character == "N")
					sprite_index = spr_playerN_bosscutscene1;
			}
			alarm[1] = -1;
			create_particle(x, y, part.landcloud);
			sound_play_3d("event:/sfx/pep/step", x, y);
			hsp = 0;
			start = true;
			if (sprite_index == spr_pepperman_scared)
				sound_play_3d("event:/sfx/voice/peppermanscared", x, y);
			if (sprite_index == spr_playerV_hurt)
				sound_play_3d("event:/sfx/voice/vigiangry", x, y);
			if (sprite_index == spr_playerN_hurt)
				sound_play_3d("event:/sfx/voice/noisepositive", x, y);
			if (sprite_index == spr_fakepeppino_stun)
				sound_play_3d("event:/sfx/voice/fakepeppositive", x, y);
			sprite_index = angryspr;
		}
	}
	else
	{
		hsp = Approach(hsp, 0, 0.1);
		sprite_index = angryspr;
	}
	scr_collide();
}
else
{
	x += hsp;
	y += vsp;
	if (vsp < 20)
		vsp += grav;
	if (y > 400)
		instance_destroy();
}
