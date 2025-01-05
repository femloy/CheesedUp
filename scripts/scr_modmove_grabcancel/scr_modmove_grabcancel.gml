function scr_modmove_grabcancel()
{
	if scr_modding_hook_falser("player/suplexdash/precancel")
	{
		image_index = 0;
		if !grounded && IT_grab_cancel()
		{
			sound_play_3d("event:/sfx/pep/grabcancel", x, y);
			sprite_index = spr_suplexcancel;
			jumpAnim = true;
			grav = 0.5;
			state = states.jump;
		}
		else
		{
			state = states.normal;
			movespeed = 2;
			grav = 0.5;
		}
		scr_modding_hook("player/suplexdash/postcancel");
	}
}
