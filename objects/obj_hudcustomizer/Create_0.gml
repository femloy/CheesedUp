live_auto_call;

buffer = 1;

add_menu = function(name, options, drawer)
{
	var s = {name: name, options: options, drawer: drawer, auto_options: 0};
	for(var i = 0; i < array_length(options); i++)
	{
		if options[i].type == 1 && options[i].auto
			s.auto_options++;
	}
	return s;
}

menus = [];
menu_sel = 0;

// big fan of chatgpt
find_nearest_button = function(buttons, cursor_index, dir)
{
    var current_button = buttons[cursor_index];
    var min_distance = infinity;
    var nearest_index = cursor_index;
    
    for (var i = 0; i < array_length(buttons); i++)
	{
        if (i == cursor_index) continue;
        
        var button = buttons[i];
        var dx = button.x - current_button.x;
        var dy = button.y - current_button.y;
        
        switch dir
		{
            case "up":
                if (dy >= 0) continue;  // Only consider buttons above
                break;
            case "down":
                if (dy <= 0) continue;  // Only consider buttons below
                break;
            case "left":
                if (dx >= 0) continue;  // Only consider buttons to the left
				if button[$ "auto"] continue;
                break;
            case "right":
                if (dx <= 0) continue;  // Only consider buttons to the right
				if button[$ "auto"] continue;
                break;
        }
        
        var distance = dx*dx + dy*dy;  // Using squared distance to avoid sqrt calculation
        if distance < min_distance
		{
            min_distance = distance;
            nearest_index = i;
        }
    }
    
    return nearest_index;
}

sel = -1;
current_cursor = [0, 0, 0, 0];
old_cursor = [0, 0, 0, 0];
target_cursor = [0, 0, 0, 0];
cursor_time = 1;

add_button = function(x, y, rect_size = [50, 50], func = noone)
{
	var s = {type: 0, x: x, y: y, func: noone, rect_size: rect_size};
	s.func = method(s, func);
	s.func(0);
	return s;
}
add_slider = function(x, y, text, set_func = noone, value_func = noone)
{
	var s = {type: 1, x: x, y: y, text: text, set_func: set_func, value_func: value_func};
	s.value = value_func();
	if x == -1 && y == -1
		s.auto = true;
	return s;
}

// menus
array_push(menus, add_menu(lstr("mod_customize_minimal"), 
	
	// buttons
	[
		add_button(892, 30, [25, 25], function(event)
		{
			// combo number on center
			if event == 0
			{
				var pad = round(global.minimal_pad * 50);
				x = 892 - pad;
				y = 30 + pad;
			}
			if event == 1
				global.minimal_combospot = 0;
		}),
		add_button(832, 30, [25, 25], function(event)
		{
			// combo number on left
			if event == 0
			{
				var pad = round(global.minimal_pad * 50);
				x = 832 - pad;
				y = 30 + pad;
			}
			if event == 1
				global.minimal_combospot = 1;
		}),
		add_button(22, 22, [25, 25], function(event)
		{
			// rank bubble behind text
			if event == 0
			{
				var pad = round(global.minimal_pad * 50);
				x = 22 + pad;
				y = 22 + pad;
			}
			if event == 1
				global.minimal_rankspot = 0;
		}),
		add_button(111, 26, [25, 25], function(event)
		{
			// rank bubble next to text
			if event == 0
			{
				var pad = round(global.minimal_pad * 50);
				x = 111 + pad;
				y = 26 + pad;
			}
			if event == 1
				global.minimal_rankspot = 1;
		}),
		
		add_slider(-1, -1, lstr("mod_customize_safezone"), function(value)
		{
			// set
			global.minimal_pad = value;
		}, function()
		{
			// value
			return global.minimal_pad;
		})
	],
	
	// draw
	function()
	{
		var pad = round(global.minimal_pad * 50);
		draw_set_color(c_white);
		
		// rank bubble
		draw_set_font(global.minimal_number);
		
		var xx = 24 + pad, yy = 16 + pad;
		var rx = xx, ry = yy + 6;
		
		if global.minimal_rankspot == 1
		{
			rx = xx + string_width("0000") + 15;
			ry = yy + 10;
		}
		
		draw_sprite_ext(spr_ranks_minimal, 0, rx, ry, 1, 1, 0, c_white, 1);
		
		// score
		draw_set_align();
		draw_text(xx, yy, "0000");
		
		// bullet and chainsaw
		var bx = xx, by = yy + 25;
		bx = scr_draw_fuel(bx, by, spr_bullet_minimal, 3);
		bx = scr_draw_fuel(bx + 2, by - 1, spr_fuel_minimal, 3);
		
		// combo bar
		var cw = sprite_get_width(spr_combobar_minimal), ch = sprite_get_height(spr_combobar_minimal);
		var slice = 0;
		
		var cx = SCREEN_WIDTH - cw - 20 - pad;
		var cy = 16 + pad;
		
		draw_sprite(spr_combobar_minimal, 0, cx, cy);
		draw_sprite(spr_combocursor_minimal, 0, cx + clamp(cw * slice, 8, cw - 12), cy + lerp(4, 3, slice));
		
		// combo number
		draw_set_font(global.minimal_number);
		pal_swap_set(spr_numpalette_minimal, 3);
		draw_set_align(fa_center);
		
		var textx = cx - 3 + cw / 2;
		if global.minimal_combospot == 1
		{
			draw_set_align(fa_right);
			textx = cx - 10;
		}
		
		draw_text(textx, cy + 3, "0");
		pal_swap_reset();
		
		// heat meter
		var hx = cx + 1, hy = cy + 30;
		draw_sprite(spr_heatmeter_minimal, 0, hx, hy);
		
		// panic timer
		draw_set_align(fa_center);
		
		var tx = SCREEN_WIDTH / 2, ty = SCREEN_HEIGHT - 50 - pad;
		var txo = sprite_get_xoffset(spr_bartimer_minimal);
		draw_sprite(spr_bartimer_minimal, 0, tx, ty);
		
		var barw = sprite_get_width(spr_timer_barfill);
		draw_set_mask(tx - txo, ty, spr_bartimer_minimal, 1);
		draw_sprite(spr_timer_barfill, 0, tx - txo + (-current_time / 100) % barw, ty);
		draw_sprite(spr_timer_barfill, 0, tx - txo + barw + (-current_time / 100) % barw, ty);
		draw_reset_clip();
		
		pal_swap_set(spr_numpalette_minimal, 2);
		
		var time_str = "0:00";
		tx -= (14 * (string_length(time_str) - 1)) / 2;
		
		for(var i = 0; i < string_length(time_str); i++)
			draw_text(tx + 14 * i, ty + 3, string_char_at(time_str, i + 1));
		pal_swap_reset();
	})
);
