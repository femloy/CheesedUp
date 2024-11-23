function scr_panicdraw_old()
{
	//if live_call() return live_result;
	
	if PANIC && !(DEATH_MODE && MOD.DeathMode) && !global.timeattack
	{
		var _timer_array = scr_filltotime();
		var minutes = _timer_array[0], seconds = _timer_array[1];
		if seconds < 10
			seconds = concat("0", seconds);
	
		draw_set_align(fa_center);
		draw_set_font(lang_get_font("bigfont"));
		draw_set_colour(minutes == 0 && seconds < 30 ? c_red : c_white);
		
		var yoffset = min(yi - SCREEN_HEIGHT - (string_height(message) - 20), 0);
		draw_text_new(timer_x + 153 + random_range(-1, 1), SCREEN_HEIGHT - 60 + random_range(-1, 1) + yoffset, concat(minutes, ":", seconds));
		
		// lap display
		if global.lap && !instance_exists(obj_ghostcollectibles)
		{
			lap_y = timer_ystart;
			
			if instance_exists(obj_wartimer)
				lap_x = Approach(lap_x, (SCREEN_WIDTH / 2) - 170 + (50 * sugary_level), 2);
			else if !instance_exists(obj_pizzaface) or showtime_buffer > 0
				lap_x = timer_x + 85;
			else
				lap_x = Approach(lap_x, (SCREEN_WIDTH / 2) + 32, 1);
			
			draw_lapflag(lap_x, lap_y, lapflag_index, sugary_level);
		}
	}
}
