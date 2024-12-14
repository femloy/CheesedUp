global.timer_shake = 0;
function scr_panicdraw()
{
	//if live_call() return live_result;
	
	static timer_ind = 0;
	static seconds_prev = "";
	
	draw_set_font(global.smallnumber_fnt);
	draw_set_halign(fa_center);
	shader_reset();
	
	if (global.panic or global.snickchallenge) && !(DEATH_MODE && MOD.DeathMode) && !global.timeattack
	{
		// smooth timerº
		var gaining_time = true;
		if global.fill <= fill_lerp
		{
			fill_lerp = global.fill;
			gaining_time = false;
		}
		else if global.leveltosave == "sucrose"
			fill_lerp = Approach(fill_lerp, global.fill, 2);
		else
			fill_lerp = lerp(fill_lerp, global.fill, 0.05);
		
		// chunk timer
		var _fill = fill_lerp;
		var _currentbarpos = chunkmax - _fill;
		var _perc = _currentbarpos / chunkmax;
		var _max_x = 299;
		var _barpos = _max_x * _perc;
	
		// M:SS timer
		var _timer_array = scr_filltotime(_fill);
		var minutes = _timer_array[0], seconds = _timer_array[1];
		if seconds < 10
			seconds = concat("0", seconds);
		
		// draw them
		var sprite_struct = scr_timer_sprites();
		if !sugary_level or global.snickchallenge
		{
			var bar = sprite_struct.bar;
			var barfill = sprite_struct.barfill;
			var timerspr = (sprite_struct.tower == noone ? pizzaface_sprite : (timer_tower && !check_lap_mode(lapmodes.laphell) ? sprite_struct.tower : pizzaface_sprite));
			if johnface_sprite != sprite_struct.johnfaceback
				johnface_sprite = (_fill > chunkmax) ? sprite_struct.johnfacesleep : sprite_struct.johnface;
			
			var _barfillpos = floor(_barpos) + 13;
			if _barfillpos > 0
			{
				var clip_x = timer_x + 3;
				var clip_y = timer_y + 5;
				
				draw_set_bounds(clip_x, clip_y, clip_x + _barfillpos, clip_y + 30);
				for (i = 0; i < 3; i++)
					draw_sprite(barfill, 0, clip_x + barfill_x + (i * 173), clip_y);
				draw_reset_clip();
			}
			draw_sprite(bar, image_index, timer_x, timer_y);
		
			// john
			draw_sprite(johnface_sprite, johnface_index, timer_x + 13 + max(_barpos, 0), timer_y + 20);
		
			// pizzaface
			draw_sprite(timerspr, pizzaface_index, timer_x + 320, timer_y + 10);
			
			// timer
			draw_set_align(1, 1);
			draw_set_font(global.bigfont);
			
			var tx = timer_x + 153, ty = timer_y + 18 - (font_get_offset(global.bigfont).y / 2), tstr = concat(minutes, ":", seconds);
			if global.timer_shake != 0
				draw_text_special(tx, ty, tstr, {shake: global.timer_shake});
			else
				draw_text(tx, ty, tstr);
		}
		else if SUGARY_SPIRE
		{
			if global.leveltosave == "sucrose"
			{
				// sucrose snowstorm
				if pizzaface_sprite == sprite_struct.pizzaface1
					draw_sprite(spr_sucrosetimer_coneball_idle, pizzaface_index, SCREEN_WIDTH / 2, timer_y + 25);
				if pizzaface_sprite == sprite_struct.pizzaface2
					draw_sprite(spr_sucrosetimer_coneball, pizzaface_index, SCREEN_WIDTH / 2, timer_y + 25);
				if pizzaface_sprite == sprite_struct.pizzaface3
					draw_sprite(spr_sucrosetimer_coneball, 25, SCREEN_WIDTH / 2, timer_y + 25);
			
				if seconds_prev != seconds
				{
					timer_ind = timer_ind ? 0 : 1;
					seconds_prev = seconds;
				}
			
				var _tmr_spr = gaining_time ? spr_sucrosetimer_gain : spr_sucrosetimer;
				draw_sprite(_tmr_spr, timer_ind, SCREEN_WIDTH / 2, timer_y + 25);
				
				// text
				var minsx = SCREEN_WIDTH / 2 - 90
				var secx = SCREEN_WIDTH / 2 - 10
				var minsy = timer_y + 25 - 15
				
				if minutes < 10
					minutes = concat("0", minutes);
				minutes = string(minutes);
				
				var col = gaining_time ? #60D048 : #F80000;
				
				draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(minutes, 1)) - ord("0"), minsx, minsy, 1, 1, 0, col, 1);
				draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(minutes, 2)) - ord("0"), minsx + 28, minsy, 1, 1, 0, col, 1);
				
				draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(seconds, 1)) - ord("0"), secx, minsy, 1, 1, 0, col, 1);
				draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(seconds, 2)) - ord("0"), secx + 28, minsy, 1, 1, 0, col, 1);
			}
			else
			{
				// sugary spire
				if pizzaface_sprite == sprite_struct.pizzaface1
				{
					draw_sprite(spr_bartimer_normalBack, pizzaface_index, timer_x + 164, timer_y + 20);
				
					var _barfillpos = floor(_barpos) + 13;
					if (_barfillpos > 0)
					{
						var clipx = timer_x - 20;
						var clipy = timer_y + 20;
					
						draw_set_bounds(clipx, clipy, clipx + _barfillpos, clipy + 50);
						draw_sprite(spr_bartimer_strip, 0, clipx + 184, clipy);
						draw_reset_clip();
					}
					draw_sprite(spr_bartimer_roll, johnface_index, max(timer_x + _barfillpos, timer_x) - 24, timer_y + 55 - 15 * max(_perc, 0));
		
					draw_sprite(spr_bartimer_normalFront, pizzaface_index, timer_x + 164, timer_y + 20);
				}
				else if pizzaface_sprite == sprite_struct.pizzaface2
					draw_sprite(spr_bartimer_showtime, pizzaface_index, timer_x + 164, timer_y + 20);
				else if pizzaface_sprite == sprite_struct.pizzaface3
					draw_sprite(spr_bartimer_showtime, 70, timer_x + 164, timer_y + 20);
		
				// timer
				draw_set_align(1, 1);
				draw_set_font(lang_get_font("sugarypromptfont"));
				draw_text(timer_x + 153, timer_y, concat(minutes, ":", seconds));
			}
		}
		
		// lap display
		if global.lap
		{
			if !instance_exists(obj_ghostcollectibles) && global.leveltosave != "sucrose" && global.leveltosave != "secretworld"
				lap_y = Approach(lap_y, timer_ystart + 24 * sugary_level, 1);
			else
				lap_y = Approach(lap_y, timer_ystart + 212, 4);
				
			if instance_exists(obj_wartimer)
				lap_x = Approach(lap_x, (SCREEN_WIDTH / 2) - 170 + (50 * sugary_level), 1);
			else if !instance_exists(obj_pizzaface) or showtime_buffer > 0
				lap_x = timer_x - 32 * sugary_level;
			else
				lap_x = Approach(lap_x, (SCREEN_WIDTH / 2) + 32, 1);
			
			draw_lapflag(lap_x, lap_y, lapflag_index, sugary_level);
		}
	}
}
