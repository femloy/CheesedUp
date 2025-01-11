function scr_tvdraw_mini()
{
	if live_call() return live_result;
	
	static combo_prev = 0;
	static combo_shake = 0;
	
	var pad = round(global.minimal_pad * 50);
	
	// combo bar
	var cw = sprite_get_width(spr_combobar_minimal), ch = sprite_get_height(spr_combobar_minimal);
	var slice = global.combo == 0 ? 0 : (global.combotime / 60);
	
	var cx = SCREEN_WIDTH - cw - 20 - pad;
	var cy = 16 + hud_posY + pad;
	
	if slice > 0
	{
		draw_set_mask(cx, cy, spr_combobar_minimal, 1);
		draw_set_bounds(cx, cy, cx + cw * slice, cy + ch);
		
		var img = scr_can_p_rank() ? 0 : 1;
		draw_sprite(spr_combofill_minimal, img, cx - (scr_current_time() / 100) % cw, cy);
		draw_sprite(spr_combofill_minimal, img, cx + cw - (scr_current_time() / 100) % cw, cy);
		draw_reset_clip();
	}
	
	draw_sprite(spr_combobar_minimal, 0, cx, cy);
	draw_sprite(spr_combocursor_minimal, 0, cx + clamp(cw * slice, 8, cw - 12), cy + lerp(4, 3, slice));
	
	// combo number
	draw_set_font(global.minimal_number);
	pal_swap_set(spr_numpalette_minimal, 3);
	draw_set_align(fa_center);
	
	if combo_prev != global.combo
	{
		combo_prev = global.combo;
		combo_shake = 2;
	}
	
	var combo = string(global.combo);
	var textx = cx - 3 + (cw - ((string_length(combo) - 1) * 18)) / 2;
	
	if global.minimal_combospot == 1
	{
		draw_set_align(fa_right);
		textx = cx - 10 - ((string_length(combo) - 1) * 18);
	}
	
	for(var i = 1; i <= string_length(combo); i++)
	{
		var xo = random_range(-combo_shake, combo_shake), yo = random_range(-combo_shake, combo_shake);
		draw_text(textx + ((i - 1) * 18) + xo, cy + 3 + yo, string_char_at(combo, i));
	}
	
	combo_shake = Approach(combo_shake, 0, 0.1);
	if global.combotime < 5 && global.combo != 0
		combo_shake = 3;
	if global.combotime < 20 && global.combo != 0 && combo_shake < 1
		combo_shake = 1;
	
	pal_swap_reset();
	
	// heat meter
	if global.heatmeter
	{
		var hx = cx + 1, hy = cy + 30;
		var hw = sprite_get_width(spr_heatmeter_minimal), hh = sprite_get_height(spr_heatmeter_minimal);
		
		var slice = min(global.style / 50, 1);
		draw_rectangle_color(hx + 4, hy + 4, hx + (hw - 4) * slice, hy + hh - 4, c_red, c_red, c_red, c_red, false);
		
		pal_swap_set(spr_heatmeter_palette, global.stylethreshold);
		draw_sprite(spr_heatmeter_minimal, 0, hx, hy);
		pal_swap_reset();
	}
	
	// panic timer
	var war = instance_find(obj_wartimer, 0);
	var ta = global.timeattack;
	
	if (global.panic or global.snickchallenge or war) && !ta
	{
		draw_set_align(fa_center);
		if war
			timer_y = max(timer_y, SCREEN_HEIGHT + 10);
		
		var tx = SCREEN_WIDTH / 2, ty = max(timer_y, SCREEN_HEIGHT - 50) - pad;
		var txo = sprite_get_xoffset(spr_bartimer_minimal);
		draw_sprite(spr_bartimer_minimal, war ? 2 : 0, tx, ty);
		
		if !war
		{
			var barw = sprite_get_width(spr_timer_barfill);
			draw_set_mask(tx, ty, spr_bartimer_minimal, 1);
			draw_sprite(spr_timer_barfill, 0, tx - txo + barfill_x % barw, ty);
			draw_sprite(spr_timer_barfill, 0, tx - txo + barw + barfill_x % barw, ty);
			draw_reset_clip();
		
			var _timer_array = scr_filltotime();
			var minutes = _timer_array[0], seconds = _timer_array[1];
			draw_set_colour(minutes == 0 && seconds < 30 ? c_red : c_white);
		}
		else
		{
			var minutes = war.minutes, seconds = war.seconds;
			var alpha = clamp((war.alarm[0] - 45) / 15, 0, 1);
			draw_sprite_ext(spr_bartimer_minimal, 1, tx, ty, 1, 1, 0, c_red, alpha);
			draw_set_colour(c_red);
		}
		
		pal_swap_set(spr_numpalette_minimal, 2);
		
		var time_str = concat(minutes, ":", seconds < 10 ? "0" : "", seconds);
		tx -= (14 * (string_length(time_str) - 1)) / 2;
		
		var shake = global.timer_shake, col = c_white;
		if minutes == 0 && seconds < 30 && seconds > 0
			shake = 1;
		
		for(var i = 0; i < string_length(time_str); i++)
		{
			var xo = random_range(-shake, shake), yo = random_range(-shake, shake);
			draw_text_color(tx + 14 * i + xo, ty + 3 + yo, string_char_at(time_str, i + 1), col, col, col, col, 1);
		}
		pal_swap_reset();
	}
	draw_set_colour(c_white);
	draw_set_align();
}
