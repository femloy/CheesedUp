live_auto_call;

if (state == 0 && !fadein) or (state == 1 && fadein)
{
	draw_sprite_ext(spr_shop_bg, -1, 0, 0, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_shop_icognito, -1, 0, 0, 1, 1, 0, c_white, 1);
	
	var sign_xx = Wave(-4, 4, 2, 10, global.time * 20) - 25, sign_yy = sign_y + Wave(-1, 1, 4, 0, global.time * 20);
	draw_sprite_ext(spr_shop_sign, 0, sign_xx, sign_yy, 1, 1, 0, c_white, 1);
	
	// item
	var xx = sign_xx + 760, yy = sign_yy + 220;
	
	draw_set_font(lfnt("bigfont"));
	draw_set_align(fa_center);
	draw_text_special(xx, sign_yy + 25, string_upper(item_name), { shake: 1 });
	
	if sprite_exists(item_sprite)
	{
		// shadow
		draw_set_flash(#D07800);
		draw_set_bounds(xx - 140, yy - 100, xx + 140, yy + 100);
		draw_sprite_ext(item_sprite, item_image, xx + item_offset.x + 5, yy + item_offset.y + 3, 2, 2, 0, c_white, 1);
		draw_reset_clip();
		draw_reset_flash();
		
		// sprite
		if sprite_exists(item_spr_palette)
		{
			pal_swap_set(item_spr_palette, item_paletteselect);
			if sprite_exists(item_pattern)
			{
				pattern_set(item_color_array, item_sprite, item_image, 2, 2, item_pattern);
				draw_sprite_stretched(item_pattern, pattern_get_subimage(item_pattern), xx + 50 - 32, yy - 32, 64, 64);
				xx -= 50;
			}
		}
		draw_sprite_ext(item_sprite, item_image, xx + item_offset.x, yy + item_offset.y, 2, 2, 0, c_white, 1);
		pal_swap_reset();
	}
	
	// dialog
	if dialog_state == 1
		draw_sprite_ext(spr_shop_bubbleopen, dialog_image, 0, 0, 1, 1, 0, c_white, 1);
	else if dialog_state == 3
		draw_sprite_ext(spr_shop_bubbleopen, sprite_get_number(spr_shop_bubbleopen) - dialog_image - 1, 0, 0, 1, 1, 0, c_white, 1);
	else if dialog_state == 2
	{
		draw_sprite_ext(spr_shop_bubble, -1, 0, 0, 1, 1, 0, c_white, 1);
		
		var d = dialog_formatted;
		draw_set_font(lfnt("tutorialfont"));
		draw_set_colour(c_black);
		
		var lines = string_count("\n", d) + 1;
		var vsep = 24;
		var height = lines * vsep;
		
		var last_n = string_pos("\n", d);
		if last_n == 0
			last_n = string_length(d);
		
		var xx = 230 - string_width(string_copy(d, 1, last_n - 1)) / 2, yy = 470 - height / 2;
		draw_set_align();
		
		for(var i = 0; i < dialog_pos; i++)
		{
			var char = string_char_at(d, i + 1);
			if char == "\n"
			{
				var n = string_pos_ext("\n", d, i + 2);
				if n == 0
					n = string_length(d);
				
				var line = string_copy(d, i + 2, n - last_n);
				last_n = n;
				
				xx = 230 - string_width(line) / 2;
				yy += vsep;
				continue;
			}
			
			draw_text(round(xx), round(yy), char);
			xx += string_width(char);
		}
	}
}

draw_set_alpha(fade);
screen_clear(c_black);
draw_set_alpha(1);
