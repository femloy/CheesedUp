live_auto_call;

if room == rank_room or !global.option_hud
	exit;
if global.hud == hudstyles.debug
	exit;

if global.timeattack
{
	var rank_img = 0;
	var slice = clamp(global.tatime / global.tacrank, 0, 1);
	
	if global.tatime <= global.tasrank
	{
		rank_img = scr_is_p_rank() ? 5 : 4;
		image_speed = 0.35;
	}
	else if global.tatime <= global.taarank
	{
		rank_img = 3;
		image_speed = 0.3;
	}
	else if global.tatime <= global.tabrank
	{
		rank_img = 2;
		image_speed = 0.2;
	}
	else if global.tatime <= global.tacrank
	{
		rank_img = 1;
		image_speed = 0.1;
	}
	else
	{
		image_index = 0;
		image_speed = 0;
	}
	
	if global.hud == hudstyles.minimal
	{
		var xx = SCREEN_WIDTH / 2;
		var yy = SCREEN_HEIGHT - 32 + timer_y;
		
		draw_set_font(global.minimal_number);
		pal_swap_set(spr_numpalette_minimal, 2);
		draw_set_align(fa_center, fa_middle);
		
		var seconds = floor(global.tatime / 60);
		var minutes = floor(seconds / 60);
		seconds = seconds % 60;
	
		if seconds < 10
			seconds = concat("0", seconds);
		var str = concat(minutes, ":", seconds);
		
		draw_text(xx, yy, str);
		pal_swap_reset();
		
		with obj_camera
			scr_rankbubbledraw(xx - string_width(str) / 2 - 20, yy);
	}
	else
	{
		var xx = SCREEN_WIDTH / 2, yy = SCREEN_HEIGHT - 57 + timer_y;
		
		var bar_xo = sprite_get_xoffset(spr_timeattack_bar);
		var bar_yo = sprite_get_yoffset(spr_timeattack_bar);
		var bar_wd = sprite_get_width(spr_timeattack_bar);
		var bar_ht = sprite_get_height(spr_timeattack_bar);
	
		var clip_x1 = xx - bar_xo + 5;
		var clip_x2 = clip_x1 + bar_wd - 10;
		var clip_y1 = yy - bar_yo + 5;
		var clip_y2 = clip_y1 + bar_ht - 10;
		
		if global.hud == hudstyles.final
		{
			draw_set_bounds(clip_x1, clip_y1, start_buffer > 0 ? clip_x2 : lerp(clip_x1, clip_x2, slice), clip_y2);
			draw_sprite_tiled_ext(spr_timeattack_fill, rank_img, barfill_x, clip_y1, 1, 1, c_white, start_buffer > 0 ? abs(sin(current_time / 200)) : 1);
			draw_reset_clip();
	
			// lines
			draw_set_bounds(clip_x1, clip_y1, clip_x2, clip_y2, , true);
			var arank_pos = lerp(clip_x1, clip_x2, global.tasrank / global.tacrank);
			var brank_pos = lerp(clip_x1, clip_x2, global.taarank / global.tacrank);
			var crank_pos = lerp(clip_x1, clip_x2, global.tabrank / global.tacrank);
			draw_line_width_color(arank_pos, clip_y1, arank_pos, clip_y2, 1, 0, 0);
			draw_line_width_color(brank_pos, clip_y1, brank_pos, clip_y2, 1, 0, 0);
			draw_line_width_color(crank_pos, clip_y1, crank_pos, clip_y2, 1, 0, 0);
			draw_reset_clip();
	
			// bar
			if global.tatime >= global.tacrank && !lost_clock
			{
				sound_play_centered(sfx_killenemy);
				lost_clock = true;
		
				with instance_create(CAMX + clip_x2, CAMY + yy, obj_sausageman_dead)
				{
					sprite_index = spr_timeattack_clock;
					spr_palette = spr_timeattack_palette;
					paletteselect = 1;
				}
			}
	
			pal_swap_set(spr_timeattack_palette, rank_img + 1);
			draw_sprite(spr_timeattack_bar, rank_img, xx, yy);
			if !lost_clock
				draw_sprite(spr_timeattack_clock, -1, lerp(clip_x1, clip_x2, slice), yy - 1); // xx + bar_wd - bar_xo
			pal_swap_reset();
		}
	
		// text
		if start_buffer <= 0
		{
			var seconds = floor(global.tatime / 60);
			var minutes = floor(seconds / 60);
			seconds = seconds % 60;
	
			if seconds < 10
				seconds = concat("0", seconds);
			
			if global.hud != hudstyles.final
			{
				draw_set_color(c_yellow);
				xx += random_range(-1, 1);
				yy += random_range(-1, 1);
			}
			
			draw_set_align(fa_center, fa_middle);
			draw_set_font(global.bigfont);
			draw_text(xx, yy - 4, concat(minutes, ":", seconds));
		}
		else
			start_buffer--;
	}
}
