live_auto_call;

reset_blendmode();
draw_set_colour(c_white);
draw_set_alpha(alpha);

/*
if mode == 1
{
	draw_set_color(c_yellow);
	draw_set_alpha(0.1);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
}
*/

// top bar
tdp_draw_set_font(lang_get_font("creditsfont"));
tdp_draw_set_align(fa_left);

var section_x = 60, section_y = 120 - 40;
var section = sections_array[sel];
var section_sep = 280;

if state == 0 or (state == 1 && state_trans < 1)
{
	draw_set_alpha(0.35 * (1 - state_trans));
	draw_rectangle_color(0, 0, SCREEN_WIDTH, 92, 0, 0, 0, 0, 0);
	draw_set_alpha(1);
	
	for(var i = 0, n = array_length(sections_array); i < n; ++i)
	{
		var this = sections_array[i];
		
		var c = sel == i ? c_white : c_gray;
		var a = 1 - state_trans;
		
		var xx = 150 + i * section_sep - section_scroll[1], yy = 32;
		var str = this.name;
		
		var icon_x = -60 + this.icon_offset[0], icon_y = 10 + this.icon_offset[1];
		if sel == i
		{
			this.icon_alpha = Approach(this.icon_alpha, 1, 0.2);
			icon_x += random_range(-1, 1);
			icon_y += random_range(-1, 1);
		}
		else
			this.icon_alpha = Approach(this.icon_alpha, 0, 0.2);
		
		var info = font_get_offset();
		tdp_draw_text_color(xx - info.x, yy - info.y, str, c, c, c, c, a);
		
		draw_sprite_ext(spr_moddedconfig_icons, this.icon, xx + icon_x, yy + icon_y, 1, 1, 0, c_white, a * this.icon_alpha);
	}
}

// options left side
draw_set_alpha(alpha);

var submenu = self.submenu != noone ? submenus[? self.submenu] : noone;
if submenu != noone
{
	var curve = animcurve_channel_evaluate(incubic, submenu_t);
	section = submenu;
}

var yy = 120 - scroll;
if array_last(section.options_pos) < SCREEN_HEIGHT / 1.5
	yy = round(max((SCREEN_HEIGHT / 2) - array_last(section.options_pos) / 2, 70) - scroll);

if submenu != noone
{
	section_x = lerp(submenu_title_pos[0], section_x, curve);
	section_y = lerp(submenu_title_pos[1], yy - 50, curve);
	
	var info = font_get_offset();
	tdp_draw_text_color(section_x - info.x, section_y - info.y, submenu.name, c_white, c_white, c_white, c_white, 1);
}
tdp_text_commit();

var options_array = section.options_array;
for(var i = 0, n = array_length(options_array); i < n; ++i)
{
	if yy > SCREEN_HEIGHT
		break;
	
	var opt = options_array[i], locked = false;
	if opt.type == modconfig.padding
	{
		yy += 20;
		continue;
	}
	
	if mode == 1
	{
		if opt.type == modconfig.preset
			locked = true;
		if !(opt[$ "allow_preset"] ?? true)
			locked = true;
		if opt[$ "preset_thingy"]
			locked = false;
	}
	else if mode == 3
	{
		if !opt[$ "custom"]
			locked = true;
	}
	else if opt.type != modconfig.section
	{
		if opt.hidden
			continue;
		if is_callable(opt.condition)
			locked = !opt.condition()[0];
	}
	
	var _opt_type = opt.type;
	if opt.type == modconfig.button && opt.small
		_opt_type = modconfig.option;
	
	var col = c_white;
	if mode == 1
	{
		if ds_list_find_index(preset_options, opt) > -1
			col = #99FF99;
	}
	
	switch _opt_type
	{
		default:
			if yy > -32
			{
				tdp_draw_set_align();
				tdp_draw_set_font(lang_get_font("font_small"));
				
				if section.sel == i
					draw_sprite(spr_cursor, image_index, 40 + xo, yy + 8 + yo);
				
				var str = opt.name;
				if mode == 2 && section.sel == i && current_time % 1000 > 500
					str += "|";
				
				var c = locked ? c_gray : (section.sel == i ? col : merge_color(col, c_black, 0.2));
				var scale = min(string_width(str), 200) / string_width(str);
				tdp_draw_text_transformed_color(80 + menu_xo, yy, str, scale, 1, 0, c, c, c, c, alpha);
				
				// value
				var str = "";
				if opt.type == modconfig.slider
					str = string(floor(opt.value * 100)) + "%";
				if opt.type == modconfig.option
					str = lstr("mod_" + opt.opts[opt.value][0]);
				if opt.type == modconfig.preset
				{
					var count = 0;
					with opt.preset
					{
						var vars = struct_get_names(self);
						for(var j = 0, m = array_length(vars); j < m; ++j)
						{
							if !string_starts_with(vars[j], "preset_")
							&& global[$ vars[j]] != self[$ vars[j]]
								count += 1;
						}
					}
					
					str = embed_value_string(lstr("mod_preset_changes"), [count]);
				}
				
				if str != ""
				{
					var scale = min(string_width(str), 110) / string_width(str);
					tdp_draw_set_align(fa_center);
					tdp_draw_text_transformed_color(350 + menu_xo, yy, str, scale, 1, 0, c, c, c, c, alpha);
				
					if section.sel == i && opt.type == modconfig.option && !locked
					&& mode == 0
					{
						if opt.value > 0
							tdp_draw_text(350 - string_width(str) * scale / 2 - Wave(16, 24, 2, 0), yy, "<");
						if opt.value < array_length(opt.opts) - 1
							tdp_draw_text(350 + string_width(str) * scale / 2 + Wave(16, 24, 2, 0), yy, ">");
					}
				}
			}
			
			yy += 20;
			break;
		
		case modconfig.button:
		case modconfig.section:
			tdp_draw_set_align();
			
			draw_set_colour(c_white);
			tdp_draw_set_font(lang_get_font("creditsfont"));
			
			var c = locked ? c_gray : (section.sel == i ? col : merge_color(col, c_black, 0.2));
			if i != 0 && options_array[i - 1].type != modconfig.button
				yy += opt.type == modconfig.section ? 30 : 15;
			
			var info = font_get_offset();
			tdp_draw_text_color((opt.type == modconfig.section ? 60 : 80) + menu_xo - info.x, yy - info.y, opt.name, c, c, c, c, alpha);
			
			if section.sel == i
			{
				submenu_title_pos = [80, yy];
				draw_sprite(spr_cursor, image_index, 40 + xo, yy + 14 + yo);
			}
			
			yy += 40;
			break;
	}
}
tdp_text_commit();

// current option
draw_set_colour(c_white);
if section.sel == -1
{
	draw_set_alpha(1);
	exit;
}

var title_y = 70 + min(back_hide_y, 20);
var desc_y = 410;

var opt = options_array[section.sel];
if opt.type == modconfig.preset
{
	title_y = 80;
	desc_y = title_y + 36;
}

var drawer = 0;
if opt.type != modconfig.preset
{
	if is_callable(opt.drawfunc)
		drawer = 1;
	else if is_array(opt.drawfunc) or sequence_exists(opt.drawfunc)
		drawer = 2;
}

if drawer == 0 && mode != 0
	exit;
if drawer == 0 && opt.type != modconfig.preset
{
	title_y = 240;
	desc_y = title_y + 36;
}

var right_x = SCREEN_WIDTH - 260;
tdp_draw_set_font(lang_get_font("bigfont"));
tdp_draw_set_align(fa_center);

var str = string_upper(opt.name);
var scale = min(string_width(str), 500) / string_width(str);
var info = font_get_offset();
tdp_draw_text_transformed(right_x - info.x, title_y - info.y, str, scale, 1, 0);

/*
if mode == 2 && current_time % 1000 > 500
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_text_new(right_x + string_width(string_upper(opt.name)) / 2 + 16, title_y, "I");
}
*/

tdp_draw_set_font(lang_get_font("font_small"));
if mode != 1
{
	var desc = opt.desc;
	if opt[$ "multi_desc"]
		desc = lstr(concat("mod_desc_", opt.vari, "_", opt.value));
	draw_text_special(right_x, desc_y, desc, {sepV: 18, w: 440});
}

/*
if opt.type == modconfig.option or opt.type == modconfig.modifier
{
	var opts = array_length(opt.opts);
	if opt.value < opts
	{
		if !(opt.opts[0][0] == "off" && opt.opts[1][0] == "on")
			tdp_draw_text(right_x, title_y + 36, $"({opt.value + 1}/{opts})");
		else
		{
			var str = lstr("mod_" + opt.opts[opt.value][0]);
			//draw_text_color_new(2 + right_x, 2 + 116, str, 0, 0, 0, 0, 0.25 * alpha);
			tdp_draw_text(right_x, title_y + 36, str);
		}
	}
}
if opt.type == modconfig.slider
{
	draw_sprite_ext(spr_slider, 0, right_x - 100, title_y + 32, 1, 1, 0, c_white, alpha);
	draw_sprite(spr_slidericon2, 0, right_x - 100 + 200 * opt.value, title_y + 32);
}
*/

if opt.type == modconfig.preset
{
	with opt.preset
	{
		var vars = struct_get_names(self);
		var count = 0;
		
		for(var i = 0, m = array_length(vars); i < m; ++i)
		{
			if !string_starts_with(vars[i], "preset_")
			&& global[$ vars[i]] != self[$ vars[i]]
			{
				if count >= 15
				{
					count++;
					continue;
				}
				
				var change_opt = other.find_option(vars[i]);
				if change_opt != undefined
				{
					tdp_draw_set_halign(fa_left);
					
					var scale = min(string_width(change_opt.name), 150) / string_width(change_opt.name);
					tdp_draw_text_transformed(right_x - other.preview_width / 2, 170 + 20 * count, change_opt.name, scale, 1, 0);
					
					var str = "";
					switch change_opt.type
					{
						case modconfig.option:
							for(var j = 0; j < array_length(change_opt.opts); j++)
							{
								if change_opt.opts[j][1] == self[$ vars[i]]
									str = lstr("mod_" + change_opt.opts[j][0]);
							}
							break;
						case modconfig.slider:
							var value = self[$ vars[i]];
							value = (value - change_opt.range[0]) / (change_opt.range[1] - change_opt.range[0]);
							str = string(floor(value * 100)) + "%";
							break;
					}
					
					tdp_draw_set_halign(fa_center);
					tdp_draw_text(right_x, 170 + 20 * count, "->");
					
					tdp_draw_set_halign(fa_right);
					var scale = min(string_width(str), 150) / string_width(str);
					tdp_draw_text_transformed(right_x + other.preview_width / 2, 170 + 20 * count, str, scale, 1, 0);
				}
				else
				{
					tdp_draw_set_halign(fa_left);
					tdp_draw_text_color(right_x - other.preview_width / 2, 170 + 20 * count, "Unknown", c_ltgray, c_ltgray, c_ltgray, c_ltgray, 1);
				}
				count += 1;
			}
		}
		
		if count >= 15
		{
			tdp_draw_set_halign(fa_center);
			tdp_draw_text(right_x, 170 + 20 * 15 + 10, embed_value_string("... and % more", [count - 15]));
		}
		
		if count == 0
			tdp_draw_text(right_x, 260, lstr("mod_preset_nochanges"));
	}
}
tdp_text_commit();

draw_set_alpha(1);
if drawer
{
	// roundrect background
	var xx = right_x, wd = preview_width;
	var yy = 260, ht = preview_height;
	
	// DRAW IT
	var condition = [true];
	if opt.type != modconfig.section && is_callable(opt.condition)
		condition = opt.condition();
	
	var do_alphafix = true;
	if !condition[0]
	{
		if !surface_exists(global.modsurf)
			global.modsurf = surface_create(wd, ht);
		
		surface_set_target(global.modsurf);
		draw_clear_alpha(c_black, 0.5);
		
		draw_set_font(lang_get_font("font_small"));
		draw_set_align(fa_center, fa_middle);
		tdp_draw_text(wd / 2, ht / 2, condition[1]);
		
		tdp_text_commit();
			
		surface_reset_target();
	}
	else
	{
		var func = opt.drawfunc;
		if is_array(func)
			func = opt.drawfunc[opt.value];
		
		if !sequence_exists(func)
		{
			if !surface_exists(global.modsurf)
				global.modsurf = surface_create(wd, ht);
			
			surface_set_target(global.modsurf);
			draw_clear_alpha(c_black, 0);
		
			draw_set_alpha(1);
			
			reset_blendmode();
			pal_swap_set(spr_peppalette, 1, false);
		
			if opt.type == modconfig.option or opt.type == modconfig.modifier
				do_alphafix = func(opt.opts[opt.value][1]) ?? true;
			else if opt.type == modconfig.slider
			{
				var value = (opt.range[0] + (opt.range[1] - opt.range[0]) * opt.value);
				do_alphafix = func(value) ?? true;
			}
			else
				do_alphafix = func() ?? true;
		
			pal_swap_reset();
			
			surface_reset_target();
		}
	}
	
	// frame backdrop
	var back_target_width = 0;
	if opt.type == modconfig.option
	{
		var opts = array_length(opt.opts);
		var pad = 50;
		back_target_width = (opts - 1) * pad;
	}
	if opt.type == modconfig.slider
		back_target_width = 180;
	if back_target_width > 0
		back_extra_width = lerp(back_extra_width, back_target_width, 0.75);
	
	if opt.type == modconfig.option or opt.type == modconfig.slider
		back_hide_y = Approach(back_hide_y, 0, 10);
	else
		back_hide_y = Approach(back_hide_y, 50, 10);
	
	draw_set_bounds(xx - wd / 2, yy - ht / 2 - 50, xx + wd / 2, yy - ht / 2);
	draw_sprite_stretched_ext(spr_modconfig_frame, 1, xx - sprite_get_xoffset(spr_modconfig_frame) - back_extra_width / 2, yy - ht / 2 - sprite_get_yoffset(spr_modconfig_frame) + back_hide_y, sprite_get_width(spr_modconfig_frame) + back_extra_width, sprite_get_height(spr_modconfig_frame), c_white, alpha);
	
	// frame buttons
	if opt.type == modconfig.option
	{
		var fucked_pad = pad * (back_extra_width / back_target_width);
		for(var i = 0; i < opts; i++)
		{
			var button_x = xx + (i * fucked_pad) - (((opts - 1) * fucked_pad) / 2);
			draw_sprite_ext(spr_modconfig_frame, opt.value == i ? 3 : 2, button_x, yy - ht / 2 + back_hide_y, 1, 1, 0, c_white, alpha);
		}
	}
	if opt.type == modconfig.slider
	{
		var slider_y = yy - ht / 2 - 35 + back_hide_y;
		draw_sprite_ext(spr_slider, 0, xx - 100, slider_y, 1, 1, 0, c_white, alpha);
		draw_sprite(spr_slidericon2, 0, xx - 100 + 200 * opt.value, slider_y);
	}
	
	draw_reset_clip();
	reset_blendmode();
	
	// draw surface
	if surface_exists(global.modsurf)
	{
		sprite_set_live(spr_modconfig_frame, true);
		draw_sprite_ext(spr_modconfig_frame, 0, 5 + xx, 5 + yy - ht / 2, 1, 1, 0, 0, 0.25 * alpha);
		
		draw_surface_ext(global.modsurf, 5 + xx - wd / 2, 5 + yy - ht / 2, 1, 1, 0, 0, 0.25 * alpha);
		if !do_alphafix
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		draw_surface_ext(global.modsurf, xx - wd / 2, yy - ht / 2, 1, 1, 0, c_white, alpha);
		
		draw_sprite_ext(spr_modconfig_frame, 0, xx, yy - ht / 2, 1, 1, 0, c_white, alpha);
	}
	
	if !do_alphafix
		reset_blendmode();
}
