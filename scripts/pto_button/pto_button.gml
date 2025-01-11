function pto_button(x, y, w, h = 72, hoverable = true, mxo = 0, myo = 0, text = "")
{
	var state = 0;
	var gui = event_number == ev_gui or event_number == ev_gui_begin or event_number == ev_gui_end;
	
	if hoverable && point_in_rectangle((gui ? mouse_x_gui : mouse_x) + mxo, (gui ? mouse_y_gui : mouse_y) + myo, x, y, x + w, y + h)
	{
		if mouse_check_button_released(mb_left)
			state = 2;
		else
			state = 1;
	}
	
	draw_sprite_stretched(spr_button, state != 0, x, y, w, h);
	if text != ""
	{
		draw_set_font(lang_get_font("creditsfont"));
		draw_set_colour(c_white);
		draw_set_align(fa_center);
		draw_text_new(lerp(x, x + w, 0.5), y + 20, text);
		draw_set_align();
	}
	
	return state;
}
function text_button(x, y, text = "", col = c_white, selcol = c_aqua, max_width = -1)
{
	var xx = x, yy = y, ww = string_width(text), hh = string_height(text), scale = 1;
	if max_width != -1
	{
		scale = min(ww, max_width) / ww;
		ww = min(ww, max_width);
	}
	
	if draw_get_halign() == fa_center
		xx = x - ww / 2;
	if draw_get_halign() == fa_right
		xx -= ww;
	if draw_get_valign() == fa_middle
		yy = y - yy / 2;
	if draw_get_valign() == fa_bottom
		yy -= hh;
	
	var gui = event_number == ev_gui or event_number == ev_gui_begin or event_number == ev_gui_end;
	var state = 0;
	if point_in_rectangle((gui ? mouse_x_gui : mouse_x), (gui ? mouse_y_gui : mouse_y), xx, yy, xx + ww, yy + hh)
	{
		if mouse_check_button_released(mb_left)
			state = 2;
		else
			state = 1;
	}
	
	if text != ""
	{
		if state != 0
			col = selcol;
		
		if global.tdp_text_try_outline
		{
			var info = font_get_offset();
			tdp_draw_text_transformed_color(x - info.x, y - info.y, text, scale, 1, 0, col, col, col, col, draw_get_alpha());
		}
		else
			draw_text_transformed_color_new(x, y, text, scale, 1, 0, col, col, col, col, draw_get_alpha());
	}
	return state;
}
function pto_textbox_init()
{
	textboxes = ds_map_create();
}
function pto_textbox_destroy()
{
	ds_map_destroy(textboxes);
	
	if global.in_menu == 2
		global.in_menu = false;
	
	window_set_cursor(cr_default);
	with obj_shell
		WC_bindsenabled = true;
}
function pto_textbox(x, y, w = 254, h = 30, maximum = 32, placeholder = "", def = "")
{
	//if live_call(x, y, w, h, maximum, placeholder, def) return live_result;
	
	// setup the textbox
	var x2 = x + w, y2 = y + h;
	
	var varprefix = string(x * y);
	var struct = ds_map_find_value(textboxes, varprefix);
	
	if struct == undefined
	{
		struct = {
			str: def,
			sel: false,
			textline: 0,
			scroll: 0,
			hover: false
		}
	}
	
	// draw the text and the textbox itself
	draw_set_font(lang_get_font("font_small"));
	draw_set_halign(fa_left);
	draw_rectangle(x, y, x + w, y + h, false);
	draw_set_colour(c_black);
	draw_rectangle(x + 1, y + 1, x + w - 1, y + h - 1, true);
	draw_set_colour(c_white);
	
	draw_set_bounds(x + 2, y, x + w - 2, y + h);
	var xx = x, yy = y, scrollw = (h < 60 ? struct.scroll : 0), scrollh = (h >= 60 ? struct.scroll : 0);
	
	draw_text(xx + 6 + scrollw, yy + 6 + scrollh, struct.str);
	xx += string_width(struct.str);
	
	if struct.str == "" && !struct.sel
		draw_text_color(xx + 6, yy + 6, placeholder, c_white, c_white, c_white, c_white, .25);
	if floor(struct.textline / 20)
		draw_rectangle_color(xx + scrollw + 8, yy + scrollh + 6, xx + scrollw + 8, yy + scrollh + h - 8, 0, 0, 0, 0, false);
	draw_reset_clip();
	
	// scrolling
	var gui = event_number == ev_gui or event_number == ev_gui_begin or event_number == ev_gui_end;
	var hover = point_in_rectangle(gui ? mouse_x_gui : mouse_x, gui ? mouse_y_gui : mouse_y, x, y, x2, y2);
	
	if hover
	{
		if mouse_wheel_down()
			struct.scroll -= 16;
		if mouse_wheel_up()
			struct.scroll += 16;
		
		struct.hover = true;
		window_set_cursor(cr_beam);
	}
	else if struct.hover
	{
		struct.hover = false;
		window_set_cursor(cr_default);
	}
	
	// selected
	if !struct.sel
	{
		if mouse_check_button_pressed(mb_left) && hover
		{
			cooldown = 2;
			
			struct.textline = 20;
			struct.sel = true;
			keyboard_string = struct.str;
			
			with obj_shell
				WC_bindsenabled = false;
			
			if !global.in_menu
				global.in_menu = 2;
		}
	}
	if struct.sel
	{
		if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text()
			keyboard_string += clipboard_get_text();
		if keyboard_check(vk_control) && keyboard_check_pressed(vk_backspace)
			keyboard_string = "";
		
		if cooldown <= 0
		{
			if struct.str != keyboard_string
			{
				keyboard_string = string_copy(keyboard_string, 1, maximum);
				
				struct.scroll = w + -string_width(keyboard_string) - string_width("W");
				struct.str = keyboard_string;
				struct.textline = 20;
			}
		}
		else
			cooldown--;
		struct.textline = (struct.textline + 1) % 40;
		
		if mouse_check_button_pressed(mb_left) && !hover
		{
			struct.textline = 0;
			struct.sel = false;
			
			with obj_shell
				WC_bindsenabled = true;
			
			if global.in_menu == 2
				global.in_menu = false;
		}
	}
	
	struct.scroll = clamp(struct.scroll, -max((h >= 60 ? yy - h + 32 : xx - w + 16), 0), 0);
	
	ds_map_set(textboxes, varprefix, struct);
	return struct;
}
