function scr_modmove_longjump()
{
	if scr_modding_hook_falser("player/suplexdash/prelongjump")
	{
		input_buffer_jump = 0;
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust, 0);
		jumpstop = false;
		image_index = 0;
		vsp = IT_jumpspeed();
		
		if !CHAR_POGONOISE && IT_grabjump_mach2()
		{
			state = states.mach2;
			if IT_longjump() && (character == "P" or spr_longjump != spr_player_longjump)
			{
				fmod_event_instance_play(rollgetupsnd);
				sprite_index = spr_longjump;
			}
			else
				sprite_index = spr_mach2jump;
		}
		scr_modding_hook("player/suplexdash/postlongjump");
	}
}
