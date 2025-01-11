function scr_pausedraw()
{
	//if live_call() return live_result;
	
    if instance_exists(obj_option) or instance_exists(obj_achievement_pause)
        exit;
    
	static jukebox_pos = 0;
	
	var ui_index = 0;
	if is_holiday(holiday.halloween)
		ui_index = 1;
	
	if fade > 0
	{
		draw_set_color(c_white);
		if pause or fade >= 1
		{
			draw_set_alpha(1);
			scr_draw_pause_image();
		}
		draw_set_alpha(fade - 0.5);
		draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
		
		if (!instance_exists(obj_achievement_pause))
		{
			draw_set_alpha(fade);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(lang_get_font("bigfont"));
		
			var h = string_height(lang_get_value("default_letter"));
			var pad = 16;
			var len = array_length(pause_menu);
			var wh = (h * len) + (pad * (len - 1));
			var yy = (SCREEN_HEIGHT / 2) - (wh / 2);
			
			var iconspr = spr_pizzaangel;
			if (is_holiday(holiday.halloween))
				iconspr = spr_noisedevil;
			
			for (var i = 0; i < len; i++)
			{
				var b = pause_menu[i];
				var c = c_gray;
				var t = lang_get_value(b);
				if (selected == i)
				{
					var cx = (SCREEN_WIDTH / 2) - (string_width(t) / 2) - 60;
					if (update_cursor)
					{
						cursor_x = (cursor_actualx + cursor_x) - cx;
						cursor_y = (cursor_actualy + cursor_y) - yy;
						update_cursor = false;
					}
					cursor_actualx = cx;
					cursor_actualy = yy;
					draw_sprite(iconspr, cursor_index, cx + cursor_x, yy + cursor_y);
					c = c_white;
				}
				tdp_draw_text_color(SCREEN_WIDTH / 2, yy, t, c, c, c, c, fade);
				var ic = array_get(ds_map_find_value(pause_menu_map, b), 0);
				if (ic != undefined)
					scr_pauseicon_draw(ic, (SCREEN_WIDTH / 2) + (string_width(t) / 2) + 50, yy);
				yy += (h + pad);
			}
		}
	}
	
	draw_set_alpha(1);
	tdp_text_commit();
	
	draw_sprite_ext(spr_pause_border, ui_index, border1_x, border1_y, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_pause_border, ui_index, border2_x, border2_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_pause_vine, ui_index, SCREEN_WIDTH / 2, vine_y, 1, 1, 0, c_white, 1);

	var lvlsave = global.leveltosave;
	if (fade > 0 && lvlsave != -4 && lvlsave != "tutorial" && lvlsave != "exit" && lvlsave != "secretworld" && room != boss_fakepep && room != boss_fakepephallway && room != boss_fakepepkey && room != boss_vigilante && room != boss_noise && room != boss_pepperman && room != boss_pizzaface && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom
	&& lvlsave != "grinch" && lvlsave != "dragonlair" && lvlsave != "snickchallenge")
	{
		if !instance_exists(obj_achievement_pause)
		{
			draw_set_alpha(fade - treasurealpha);
			lang_draw_sprite(spr_treasurefound_pause, !treasurefound, 80, SCREEN_HEIGHT - 60);
			draw_set_alpha(fade - secretalpha);
			draw_sprite(spr_secretportal_idle, 0, SCREEN_WIDTH - 132, SCREEN_HEIGHT - 124);
			draw_set_font(global.combofont);
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			draw_set_color(c_white);
			draw_text(SCREEN_WIDTH - 132 - 60, SCREEN_HEIGHT - 124 - 8, concat(secretcount, "/", scr_secretcount(lvlsave)));
			draw_set_alpha(1);
		}
	}
	
	if global.jukebox != noone
	{
		if pause
			jukebox_pos = Approach(jukebox_pos, 0, 1);
		else
			jukebox_pos = Approach(jukebox_pos, 120, 8);
		
		if jukebox_pos < 100
		{
			var len = fmod_event_get_length(global.jukebox.name);
			var pos = fmod_event_instance_get_timeline_pos(global.jukebox.instance);
		
			var bar_wd = sprite_get_width(spr_timer_bar);
			var bar_ht = sprite_get_height(spr_timer_bar);
			var bar_x = floor(SCREEN_WIDTH / 2 - bar_wd / 2);
			var bar_y = SCREEN_HEIGHT - 70 + jukebox_pos;
		
			draw_set_bounds(bar_x + 6, bar_y + 6, lerp(bar_x + 6, bar_x + bar_wd - 6, pos / len), bar_y + bar_ht - 6);
			draw_sprite_tiled(spr_jukebox_barfill, 0, -current_time / 100, bar_y);
			draw_reset_clip();
		
			draw_sprite(spr_timer_bar, 0, bar_x, bar_y);
			draw_sprite(is_holiday(holiday.loy_birthday) ? spr_jukebox_john_idle : spr_jukebox_john_active, current_time / 60, lerp(bar_x + 6, bar_x + bar_wd - 6, pos / len), bar_y + 13);
		
			draw_set_alpha(1);
	
			draw_set_align(1, 1);
			draw_set_colour(c_white);
			draw_set_font(global.bigfont);
		
			var seconds = round(pos / 1000);
			var minutes = floor(seconds / 60);
			seconds = seconds % 60;
			
			draw_text(bar_x + 153, bar_y + 18 - (font_get_offset(global.bigfont).y / 2), concat(minutes, ":", seconds < 10 ? "0" : "", seconds));
			
			draw_set_font(global.font_small);
			draw_text(SCREEN_WIDTH / 2, bar_y + 54, global.jukebox.name_pause);
		}
	}
	else
		jukebox_pos = 120;
	
	if transfotext != -4 && !instance_exists(obj_achievement_pause)
	{
		draw_set_alpha(fade);
		draw_set_font(lang_get_font("creditsfont"));
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		var xx = SCREEN_WIDTH / 2;
		yy = SCREEN_HEIGHT - 50;
		var s = transfotext_size;
		xx -= (s[0] / 2);
		yy -= s[1];
		if global.jukebox != noone
			yy -= 40;
		xx = floor(xx);
		yy = floor(yy);
		global.tdp_text_try_outline = true;
		scr_draw_text_arr(xx, yy, transfotext, c_white, fade);
		global.tdp_text_try_outline = false;
		tdp_text_commit();
		draw_set_alpha(1);
	}
	pause_draw_priests();
}
