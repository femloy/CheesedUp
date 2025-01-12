#macro WC_NODEBUG "You do not have permission to use this command"
#macro WC_FUCK_YOU choose("You tried.", "Not that easy, pal.", "Nope.", "Sorry... no.", "Good thinking!", "You think I'm stupid?", "Did I say sorry? I lied.", "Try ALT F4, see if that does it.", "But of course.", "Command Error - 404 Not Found", "Whew, almost bypassed it, there.", "I don't think so.", "Hahaha, good one!", "No.")

function WCscr_altname(name, alt)
{
	variable_global_set($"sh_{alt}", variable_global_get($"sh_{name}"));
	array_push(allFunctions, alt);
	
	var metadata = functionData[$ name];
	metadata.help_hidden = true; // TODO
	functionData[$ alt] = metadata;
}

function scr_wc_cleanup()
{
	if ds_exists(WC_builtins, ds_type_map)
		ds_map_destroy(WC_builtins);
	if ds_exists(WC_binds, ds_type_map)
		ds_map_destroy(WC_binds);
	if ds_exists(WC_frozen, ds_type_list)
		ds_list_destroy(WC_frozen);
	if ds_exists(WC_win_list, ds_type_list)
		ds_list_destroy(WC_win_list);
}

function scr_wc_apply_props(inst, props)
{
	if !is_struct(props)
		exit;
	
	with inst
	{
		var vars = struct_get_names(props);
		for(var i = 0, n = array_length(vars); i < n; ++i)
			self[$ vars[i]] = props[$ vars[i]];
	}
}

function scr_wc_create()
{
	WC_debug = DEBUG;
	
	// builtin list
	WC_builtins = ds_map_create();
	ds_map_add(WC_builtins, "undefined", undefined);
	ds_map_add(WC_builtins, "NaN", NaN);
	ds_map_add(WC_builtins, "infinity", infinity);
	ds_map_add(WC_builtins, "true", true);
	ds_map_add(WC_builtins, "false", false);
	ds_map_add(WC_builtins, "noone", noone);
	ds_map_add(WC_builtins, "mouse_x", function() {return mouse_x});
	ds_map_add(WC_builtins, "mouse_y", function() {return mouse_y});
	
	ds_map_add(WC_builtins, "c_white", c_white);
	ds_map_add(WC_builtins, "c_aqua", c_aqua);
	ds_map_add(WC_builtins, "c_black", c_black);
	ds_map_add(WC_builtins, "c_dkgray", c_dkgray);
	ds_map_add(WC_builtins, "c_fuchsia", c_fuchsia);
	ds_map_add(WC_builtins, "c_gray", c_gray);
	ds_map_add(WC_builtins, "c_green", c_green);
	ds_map_add(WC_builtins, "c_lime", c_lime);
	ds_map_add(WC_builtins, "c_ltgray", c_ltgray);
	ds_map_add(WC_builtins, "c_maroon", c_maroon);
	ds_map_add(WC_builtins, "c_navy", c_navy);
	ds_map_add(WC_builtins, "c_olive", c_olive);
	ds_map_add(WC_builtins, "c_orange", c_orange);
	ds_map_add(WC_builtins, "c_purple", c_purple);
	ds_map_add(WC_builtins, "c_red", c_red);
	ds_map_add(WC_builtins, "c_silver", c_silver);
	ds_map_add(WC_builtins, "c_teal", c_teal);
	ds_map_add(WC_builtins, "c_yellow", c_yellow);
	
	// all command aliases
	WCscr_altname("clear", "cls");
	WCscr_altname("var", "variable");
	WCscr_altname("panic", "pizzatime");
	WCscr_altname("create", "instance_create");
	WCscr_altname("showcollisions", "toggle_collisions");
	WCscr_altname("char", "character");
	WCscr_altname("char", "switch_char");
	WCscr_altname("state", "player_set_state");
	WCscr_altname("room", "room_goto");
	WCscr_altname("room", "player_room");
	
	// selection modes
	enum WC_select_modes
	{
		create,
		debugview,
		variable
	}
	WC_select_mode = -1;
	WC_select_inst = noone;
	WC_select_inst_props = noone;
	
	// instance drag
	WC_drag_toggle = DEBUG;
	WC_drag_alt = false;
	WC_drag_offset = [0, 0];
	WC_drag_grid = [4, 4];
	WC_drag_inst = noone;
	WC_drag_deleting = false;
	
	// debug view
	WC_debugview = false;
	WC_debugview_target = noone;
	WC_debugview_scroll = 0;
	
	// etc
	WC_showinvisible = 0; // 0: no, 1: yes, 2: show names of objects without sprites
	WC_oobcam = false;
	WC_showcollisions = false;
	WC_debugoverlay = false;
	
	// shortcuts
	WC_bindsenabled = true;
	WC_binds = ds_map_create();
	function WCscr_addbind(key, command_or_method)
	{
		ds_map_add(WC_binds, string(key), command_or_method);
	}
	
	if DEBUG
	{
		//WCscr_addbind(ord("1"), "create");
		//WCscr_addbind(ord("3"), "var");
		WCscr_addbind(ord("4"), "oobcam");
		WCscr_addbind(ord("5"), "panic");
		WCscr_addbind(ord("7"), "showcollisions");
		WCscr_addbind(ord("9"), "debughud");
		WCscr_addbind(vk_numpad0, function() {
			global.option_resolution = 1;
			screen_apply_size();
		});
		WCscr_addbind(vk_numpad1, "resetsaveroom");
	}
	
	// frozen variables
	WC_frozen = ds_list_create();
	function WCscr_freezevar(instance, variable)
	{
		for(var i = 0; i < ds_list_size(WC_frozen); i++)
		{
			var frozen = WC_frozen[|i];
			if is_array(frozen) && frozen[0] == instance && frozen[1] == variable
			{
				ds_list_delete(WC_frozen, i);
				return false;
			}
		}
		ds_list_add(WC_frozen, [instance, variable, variable_instance_get(instance, variable)]);
		return true;
	}
	
	// open console bind
	WCscr_addbind(220, function()
	{
		if !isOpen
			self.open();
		else
			self.close();
	});
	
	// windows
	WC_win_list = ds_list_create();
	function WCwin(title, draw) constructor
	{
		if !instance_exists(obj_shell)
			exit;
		
		var winlist = obj_shell.WC_win_list;
		win_title = title;
		
		win_x = ds_list_size(winlist) * 32;
		win_y = 64 + ds_list_size(winlist) * 16;
		win_width = 160;
		win_height = 90;
		setSize();
		
		win_moving = false;
		win_resize = false;
		
		static setSize = function(wd = win_width, ht = win_height)
		{
			win_width = wd;
			win_height = ht;
			
			win_x = clamp(win_x, 0, SCREEN_WIDTH - win_width);
			win_y = clamp(win_y, 0, SCREEN_HEIGHT - win_height);
			return self;
		}
		
		self.draw = method(self, draw);
		ds_list_add(winlist, self);
	}
	WC_win_focus = -1;
	WC_win_dragx = 0;
	WC_win_dragy = 0;
	
	#region functions
	
	function WCscr_overconsole()
	{
		return (isOpen && point_in_rectangle(mouse_x_gui, mouse_y_gui, shellOriginX, shellOriginY, shellOriginX + width, shellOriginY + height))
		or gameframe_drag_flags != 0 or is_mouse_over_debug_overlay();
	}
	function WCscr_findobj(obj)
	{
		var target_one = false;
		var target = noone;
	
		if obj == "all"
		{
			// every instance
			target = all;
		}
		else if asset_get_type(obj) == asset_object
		{
			// just an object
			var asset = asset_get_index(obj);
			if instance_exists(asset)
				target = asset;
		}
		else
		{
			// possibly a specific object
			if string_pos(":", obj) > 0
			{
				// parse object and index
				var parse_obj = "";
				var parse_ind = "";
				var parsing = 0;
				
				for(var i = 1; i <= string_length(obj); i++)
				{
					var char = string_char_at(obj, i);
					
					// obj part
					if parsing == 0
					{
						if char == ":"
						{
							parsing = 1;
							continue;
						}
						parse_obj += char;
					}
					
					// index part
					else
						parse_ind += char;
				}
				
				// verify that index is number
				if string_digits(parse_ind) != parse_ind or string_digits(parse_ind) == ""
					return "Instance index must be a number";
				parse_ind = real(parse_ind);
				
				// get object
				var asset = noone;
				if string_digits(parse_obj) == parse_obj
					asset = real(parse_obj);
				else if asset_get_type(parse_obj) == asset_object
					asset = asset_get_index(parse_obj);
			
				if instance_exists(asset)
				{
					target_one = true;
					
					// get specific instance
					asset = instance_find(asset, parse_ind);
					if instance_exists(asset)
						target = asset;
				}
			}
			// or just an object, by number
			else if string_digits(obj) == obj && obj != ""
			{
				if instance_exists(real(obj))
					target = real(obj);
				if real(obj) >= 100000 // most likely an instance id
					target_one = true;
			}
		}
		return [target, target_one];
	}
	function WCscr_allargs(args, after = 0)
	{
		var ret = "";
		for(var i = after; i < array_length(args); i++)
			ret += args[i] + (i == array_length(args) - 1 ? "" : " ");
		return ret;
	}
	function WCscr_getvalue(value)
	{
		value = string(value);
		
		// asset
		if asset_get_index(value) != -1
			value = asset_get_index(value);
			
		// number
		else if string_is_number(value)
			value = real(value);
		
		// builtin variable
		else if ds_map_exists(WC_builtins, value) 
		{
			value = ds_map_find_value(WC_builtins, value);
			if is_method(value)
				value = value();
		}
		
		// forced string
		else if string_char_at(value, 1) == "\""
		&& string_char_at(value, string_length(value)) == "\""
		{
			value = string_delete(value, 1, 1);
			value = string_delete(value, string_length(value), 1);
		}
		
		// parse?
		else
		{
			// \" to "
			value = string_replace(value, "\\\"", "\"");
		}
		return value;
	}
	
	#endregion
}

function scr_wc_step()
{
	depth = -16000;
	WC_debug = DEBUG or (global.experimental && instance_exists(obj_persistent) && !instance_exists(obj_disclaimer) && !obj_persistent.shell_force_off);
	
	#region bound keys
	
	for(var i = ds_map_find_first(WC_binds); !is_undefined(i); i = ds_map_find_next(WC_binds, i))
	{
		if keyboard_check_pressed(real(i))
		{
			var val = ds_map_find_value(WC_binds, i);
			if is_method(val)
				val();
			else if !isOpen && WC_bindsenabled
			{
				var args = _input_string_split(val);
				
				// set arguments outside of the console
				if array_length(args) == 1
				{
					if args[0] == "var" or args[0] == "variable"
					{
						if keyboard_check(vk_shift)
						{
							var variable = get_string("Input global variable name here", "");
							if variable != ""
							{
								if variable_global_exists(variable)
									var value = get_string($"Overwriting existing value in global.{variable} to...", string(variable_global_get(variable)));
								else
									var value = get_string($"Creating new variable global.{variable} with value...", "");
								
								consoleString = $"var global {variable} {value}";
								_execute_script(_input_string_split(consoleString), true);
								consoleString = "";
							}
						}
						else
							WC_select_mode = WC_select_modes.variable;
					}
					else
					{
						var metadata = functionData[$ args[0]];
						if !is_undefined(metadata) && variable_struct_exists(metadata, "arguments")
						{
							for(var i = 0; i < array_length(metadata.arguments); i++)
							{
								if string_char_at(metadata.arguments[i], 1) != "<"
								{
									var getstring = get_string($"Write value for argument:\n{metadata.arguments[i]}", "");
									if getstring == ""
										exit;
									
									if string_pos(getstring, " ") != 0 && string_pos(getstring, "\"") != 1
										val += $" \"{getstring}\"";
									else
										val += $" {string_trim(getstring)}";
								}
							}
						}
						args = _input_string_split(val)
						
						consoleString = val;
						if array_length(args) > 0
							_execute_script(args, true);
					}
				}
				else
				{
					consoleString = val;
					if array_length(args) > 0
						_execute_script(args, true);
				}
				consoleString = "";
			}
		}
	}
	
	#endregion
	#region frozen variables
	
	if WC_debug
	{
		for(var i = 0; i < ds_list_size(WC_frozen); i++)
		{
			var frozen = WC_frozen[|i];
			if is_array(frozen) && instance_exists(frozen[0]) or frozen[0] == global
				variable_instance_set(frozen[0], frozen[1], frozen[2]);
		}
	}
	
	#endregion
	#region focus on a window
	
	var mousex = mouse_x_gui, mousey = mouse_y_gui;
	if mouse_check_button_pressed(mb_left)
	{
		WC_win_focus = -1;
		if !WCscr_overconsole()
		{
			for(var i = 0; i < ds_list_size(WC_win_list); i++)
			{
				var win = WC_win_list[|i];
				if mousex >= win.win_x && mousex < win.win_x + win.win_width + 4
				&& mousey >= win.win_y - 32 && mousey < win.win_y + win.win_height + 4
				{
					WC_win_focus = win;
					break;
				}
			}
		}
	}
	#endregion
	#region drag objects
	
	if WC_drag_toggle && WC_debug && WC_select_mode <= -1
	{
		// object gone failsafe
		if !instance_exists(WC_drag_inst)
			WC_drag_inst = noone;
		
		// start dragging an object
		var mb = mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_middle);
		if mb != 0 && WC_win_focus == -1 && !WCscr_overconsole() && !instance_exists(WC_drag_inst)
		{
			// drag player
			if mb == 1 && keyboard_check(vk_control) && instance_exists(obj_player1)
			{
				WC_drag_offset = [0, 0];
				WC_drag_alt = keyboard_check(vk_alt);
				WC_drag_inst = instance_find(obj_player1, 0);
			}
			// normal drag
			else
			{
				WC_drag_inst = collision_point(mouse_x, mouse_y, all, true, false);
				if instance_exists(WC_drag_inst)
				{
					// prioritize baddie (pt exclusive)
					if !keyboard_check(vk_shift)
					{
						if WC_drag_inst.object_index == obj_baddiecollisionbox
						&& instance_exists(WC_drag_inst.baddieID)
							WC_drag_inst = WC_drag_inst.baddieID;
						if WC_drag_inst.object_index == obj_heatafterimage
							WC_drag_inst = WC_drag_inst.playerid;
					}
					
					// vars
					WC_drag_offset = [mouse_x - WC_drag_inst.x, mouse_y - WC_drag_inst.y];
					WC_drag_alt = keyboard_check(vk_alt);
					
					// duplicate
					if mb == -1
					{
						with WC_drag_inst
							other.WC_drag_inst = instance_copy(keyboard_check(vk_control));
					}
				}
			}
		}
	
		// mass delete
		if WC_drag_inst == noone && keyboard_check(vk_control) && mouse_check_button_pressed(mb_right)
			WC_drag_deleting = true;
		
		if WC_drag_deleting
		{
			if !mouse_check_button(mb_right)
				WC_drag_deleting = false;
		
			var delinst = collision_point(mouse_x, mouse_y, all, true, false);
			if instance_exists(delinst)
				instance_destroy(delinst, !keyboard_check(vk_alt));
		}
		
		// actually drag the object
		if instance_exists(WC_drag_inst)
		{
			var rel = (!mouse_check_button(mb_middle) && mouse_check_button_released(mb_left)) or (!mouse_check_button(mb_left) && mouse_check_button_released(mb_middle));
		
			// move the object
			if !WC_drag_alt or rel
			{
				with WC_drag_inst
				{
					// handle grid
					x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
					y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
				}
				
				// handle frozen position
				for(var i = 0; i < ds_list_size(WC_frozen); i++)
				{
					var frozen = WC_frozen[|i];
					if frozen[0] != global && instance_exists(frozen[0]) && frozen[0].id == WC_drag_inst.id
					{
						if frozen[1] == "x"
							WC_frozen[|i][2] = WC_drag_inst.x;
						if frozen[2] == "y"
							WC_frozen[|i][2] = WC_drag_inst.y;
					}
				}
			}
			
			// delete or cancel
			if rel
				WC_drag_inst = noone;
			else if mouse_check_button_pressed(mb_right) && WC_drag_inst != noone
			{
				if !WC_drag_alt
					instance_destroy(WC_drag_inst, !keyboard_check(vk_control));
				WC_drag_inst = noone;
			}
			
			// duplicate
			else if (mouse_check_button(mb_left) && mouse_check_button_pressed(mb_middle))
			or (keyboard_check(vk_control) && mouse_check_button(mb_middle))
			{
				var copy = noone;
				with WC_drag_inst
					copy = instance_copy(false);
				
				if WC_drag_alt
				{
					with copy
					{
						x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
						y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
					}
				}
			}
		}
	}
	else
		WC_drag_inst = noone;
	
	#endregion
	#region instance selection mode
	
	if WC_select_mode == -1
	{
		WC_select_inst = noone;
		WC_select_inst_props = noone;
	}
	else if WC_select_mode == WC_select_modes.create
	{
		if mouse_check_button_pressed(mb_left) or (mouse_check_button(mb_left) && keyboard_check(vk_control))
			instance_create(floor(mouse_x / WC_drag_grid[0]) * WC_drag_grid[0], floor(mouse_y / WC_drag_grid[1]) * WC_drag_grid[1], WC_select_inst);
	}
	else
	{
		WC_select_inst = collision_point(mouse_x, mouse_y, all, false, false);
			
		// make sure you select the baddie instead of its collision
		if WC_select_inst && !keyboard_check(vk_shift)
		{
			if WC_select_inst.object_index == obj_baddiecollisionbox && instance_exists(WC_select_inst.baddieID)
				WC_select_inst = WC_select_inst.baddieID;
			if WC_select_inst.object_index == obj_heatafterimage
				WC_select_inst = WC_select_inst.playerid;
		}
		
		// select
		if WC_select_inst && mouse_check_button_pressed(mb_left)
		{
			switch WC_select_mode
			{
				default: show_message("Boop"); break;
					
				case WC_select_modes.debugview:
					WC_debugview = true;
					WC_debugview_target = WC_select_inst;
					WC_debugview_scroll = 0;
					break;
					
				case WC_select_modes.variable:
					var variable = get_string($"Selected {object_get_name(WC_select_inst.object_index)}\nInput variable name here", "");
					if variable == ""
						WC_select_mode = -1;
					else
					{
						if variable_instance_exists(WC_select_inst, variable)
							var value = get_string($"Overwriting existing value in {variable} to...", string(variable_instance_get(WC_select_inst, variable)));
						else
							var value = get_string($"Creating new variable {variable} with value...", "");
							
						consoleString = $"var {real(WC_select_inst.id)} {variable} {value}";
						_execute_script(_input_string_split(consoleString), true);
						consoleString = "";
					}
					break;
			}
			WC_select_mode = -1;
		}
	}
	
	// cancel
	if mouse_check_button_pressed(mb_right)
		WC_select_mode = -1;
	
	#endregion
}

function WCscr_drawmask(xx = x, yy = y)
{
	var _mask = mask_index == -1 ? sprite_index : mask_index;
	
	// Get the unmodified mask data
	var _b1 = sprite_get_bbox_left(_mask) * image_xscale;
	var _b2 = sprite_get_bbox_top(_mask) * image_yscale;
	var _b3 = (sprite_get_bbox_right(_mask) + 1) * image_xscale;
	var _b4 = (sprite_get_bbox_bottom(_mask) + 1) * image_yscale;
	
	var _xoff = sprite_get_xoffset(_mask) * image_xscale;
	var _yoff = sprite_get_yoffset(_mask) * image_yscale;
	
	// Get the unmodified vector for each corner
	var _dis1 = point_distance(_xoff, _yoff, _b1, _b2);
	var _dir1 = point_direction(_xoff, _yoff, _b1, _b2);
	var _dis2 = point_distance(_xoff, _yoff, _b3, _b2);
	var _dir2 = point_direction(_xoff, _yoff, _b3, _b2);
	var _dis3 = point_distance(_xoff, _yoff, _b3, _b4);
	var _dir3 = point_direction(_xoff, _yoff, _b3, _b4);
	var _dis4 = point_distance(_xoff, _yoff, _b1, _b4);
	var _dir4 = point_direction(_xoff, _yoff, _b1, _b4);

	// Now modify the vectors using the current position and image angle
	var _x1 = lengthdir_x(_dis1, image_angle + _dir1);
	var _y1 = lengthdir_y(_dis1, image_angle + _dir1);
	var _x2 = lengthdir_x(_dis2, image_angle + _dir2);
	var _y2 = lengthdir_y(_dis2, image_angle + _dir2);
	var _x3 = lengthdir_x(_dis3, image_angle + _dir3);
	var _y3 = lengthdir_y(_dis3, image_angle + _dir3);
	var _x4 = lengthdir_x(_dis4, image_angle + _dir4);
	var _y4 = lengthdir_y(_dis4, image_angle + _dir4);
			
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx + _x1, yy + _y1);
	draw_vertex(xx + _x2, yy + _y2);
	draw_vertex(xx + _x3, yy + _y3);
	draw_vertex(xx + _x4, yy + _y4);
	draw_primitive_end();
}

function WCscr_drawobject(instance, alpha = 0.75)
{
	// redraw sprite
	if sprite_exists(instance.sprite_index)
		draw_sprite_ext(instance.sprite_index, instance.image_index, instance.x, instance.y, instance[$ "xscale"] ?? instance.image_xscale, instance[$ "yscale"] ?? instance.image_yscale, instance.image_angle, instance.image_blend, alpha);
	else
		draw_point_color(instance.x, instance.y, c_red);
}

function scr_wc_draw()
{
	draw_set_font(consoleFont);
	
	#region dragging instance
	
	if instance_exists(WC_drag_inst)
	{
		with WC_drag_inst
		{
			var xp = x, yp = y;
		
			x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
			y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
		}
		
		// draw spr
		WCscr_drawobject(WC_drag_inst);
		
		// mask
		draw_set_colour(WC_drag_alt ? c_aqua : c_red);
		draw_set_alpha(0.25);
		with WC_drag_inst
			WCscr_drawmask();
		draw_set_alpha(1);
		
		// resetti positioni
		with WC_drag_inst
		{
			x = xp;
			y = yp;
		}
	}
	
	#endregion
	#region selecting instance
	
	if WC_select_mode != -1
	{
		// make color
		var col = c_white;
		switch WC_select_mode
		{
			case WC_select_modes.debugview:
				col = merge_colour(c_white, c_orange, 0.35);
				break;
		}
		draw_set_colour(col);
		
		// make text
		var text = "Select object", xx = mouse_x, yy = mouse_y;
		if WC_select_mode == WC_select_modes.create
		{
			xx = floor(mouse_x / WC_drag_grid[0]) * WC_drag_grid[0];
			yy = floor(mouse_y / WC_drag_grid[1]) * WC_drag_grid[1];
			
			text = "Spawn here";
			
			var objspr = object_get_sprite(WC_select_inst);
			if sprite_exists(objspr)
			{
				text = "";
				draw_sprite_ext(object_get_sprite(WC_select_inst), 0, xx, yy, 1, 1, 0, c_white, 0.5);
			}
		}
		else if instance_exists(WC_select_inst)
		{
			text = object_get_name(WC_select_inst.object_index);
			xx += choose(1, -1);
			
			draw_set_flash(col);
			WCscr_drawobject(WC_select_inst, abs(sin(current_time / 500)) * 0.5);
			draw_reset_flash();
		}
		
		// draw it
		draw_set_align(fa_center, fa_middle);
		draw_text(xx, yy, text);
		draw_set_align();
	}
	
	#endregion
	#region show invisible
	
	if WC_showinvisible > 0
	{
		with all
		{
			if sprite_exists(sprite_index)
				WCscr_drawobject(id);
			else if other.WC_showinvisible == 2
			{
				draw_set_alpha(1);
				draw_set_colour(c_white);
				draw_set_align(fa_center, fa_middle);
				draw_text(x, y, object_get_name(object_index));
				draw_set_align();
			}
		}
	}
	
	#endregion
	#region debug view
	
	if WC_debugview && instance_exists(WC_debugview_target) && WC_debugview_target != global
	{
		// draw its mask
		if !(instance_exists(WC_drag_inst) && WC_drag_inst.id == WC_debugview_target.id)
		{
			draw_set_alpha(0.5);
			draw_set_colour(c_red);
			with WC_debugview_target
				WCscr_drawmask();
			draw_set_alpha(1);
		}
		
		// draw the sprite
		if !WC_debugview_target.visible or WC_debugview_target.image_alpha <= 0
			WCscr_drawobject(WC_debugview_target);
		
		// and draw the center of the object
		draw_set_colour(c_red);
		draw_rectangle(WC_debugview_target.x - 1, WC_debugview_target.y - 1, WC_debugview_target.x + 1, WC_debugview_target.y + 1, false);
	}
	
	#endregion
}

function scr_wc_drawgui()
{
	//if live_call() return live_result;
	draw_set_font(consoleFont);
	
	// vars
	var mousex = mouse_x_gui, mousey = mouse_y_gui;
	var wincol = c_black, txtcol = c_white;
	var guiwidth = display_get_gui_width(), guiheight = display_get_gui_height();
	
	#region debug view
	
	//show_debug_overlay(WC_debugview);
	if WC_debugview
	{
		draw_set_align();
		draw_set_colour(c_white);
		
		draw_text(4, 4, stringify(room, false, 0) +
		$"\ninstances: {instance_count}, fps: {fps} ({fps_real})");
		
		if instance_exists(WC_debugview_target) or WC_debugview_target == global
		{
			var str = $"\n\n\n{stringify(WC_debugview_target, false, 0)}";
			if WC_debugview_target != global
			{
				str += $"\nx: {WC_debugview_target.x}";
				str += $"\ny: {WC_debugview_target.y}";
				str += $"\nsprite_index: {stringify(WC_debugview_target.sprite_index, false, 0)}";
				str += $"\nimage_index: {WC_debugview_target.image_index}";
				str += $"\nimage_speed: {WC_debugview_target.image_speed}";
				str += $"\nimage_xscale: {WC_debugview_target.image_xscale}";
				str += $"\nimage_yscale: {WC_debugview_target.image_yscale}";
				str += $"\nmask_index: {stringify(WC_debugview_target.mask_index, false, 0)}";
				
				for (var c = 0; c <= 11; c++)
				{
					if WC_debugview_target.alarm[c] > -1
						str += $"\nalarm[{c}]: {WC_debugview_target.alarm[c]}";
				}
			}
			draw_text(4, 24, str);
			
			draw_set_halign(fa_right);
			var objvars = variable_instance_get_names(WC_debugview_target);
		
			if array_length(objvars) == 0
				draw_text(display_get_gui_width(), 4, "No variables");
			else
			{
				WC_debugview_scroll = clamp(WC_debugview_scroll, 0, max(array_length(objvars) - 32, 0));
				for (var b = WC_debugview_scroll; b < min(WC_debugview_scroll + 33, array_length(objvars)); b++)
				{
					var getvar = stringify(WC_debugview_target[$ objvars[b]], false, 0);
					
					draw_set_colour(c_ltgray);
					var todraw = string_replace_all(string(getvar), "\n", "\\n");
					
					if b <= 32 + WC_debugview_scroll
						draw_text(956, ((b - WC_debugview_scroll) * 16) + 4, concat(objvars[b], ": ", todraw));
				}
				
				if keyboard_check_pressed(vk_pageup)
					WC_debugview_scroll -= 32;
				if keyboard_check_pressed(vk_pagedown)
					WC_debugview_scroll += 32;
				WC_debugview_scroll = clamp(WC_debugview_scroll, 0, array_length(objvars) - 32);
			}
		}
		else
			WC_debugview_target = noone;
	}
	else
		WC_debugview_target = noone;
	
	#endregion
	#region windows
	
	gameframe_can_input = true;
	
	var winlist = WC_win_list;
	for(var i = 0; i < ds_list_size(winlist); i++)
	{
		var win = WC_win_list[|i];
		with win
		{
			var focused = other.WC_win_focus == self;
		
			// move window
			if focused && (mousey < win_y or win_moving) && !win_resize
			{
				gameframe_can_input = false;
				if mouse_check_button(mb_left)
				{
					if !win_moving
					{
						WC_win_dragx = mousex - win_x;
						WC_win_dragy = mousey - win_y;
						win_moving = true;
					}
					win_x = mousex - WC_win_dragx;
					win_y = mousey - WC_win_dragy;
					
					// snap window to screen sides
					win_x = clamp(win_x, 0, guiwidth - win_width);
					win_y = clamp(win_y, 32, guiheight - win_height);
					
					if mouse_check_button_pressed(mb_right) && win_moving
					{
						trace($"Deleting window {i}, size {ds_list_size(winlist)}");
						
						other.WC_win_focus = -1;
						ds_list_delete(winlist, i--);
						
						continue;
					}
				}
				else
					win_moving = false;
			}
			else
				win_moving = false;
		
			// resize window
			if (!win_moving && mousex < win_x + win_width + 4 && mousex >= win_x + win_width - 4 && mousey < win_y + win_height + 4 && mousey >= win_y + win_height - 4)
			or (win_resize && mouse_check_button(mb_left))
			{
				if win_resize or !other.WCscr_overconsole()
					window_set_cursor(cr_size_nwse);
				if focused && mouse_check_button(mb_left)
				{
					if !win_resize
					{
						WC_win_dragx = mousex - win_width;
						WC_win_dragy = mousey - win_height;
						win_resize = true;
					}
					win_width = clamp(mousex - WC_win_dragx, 16, guiwidth - win_x);
					win_height = clamp(mousey - WC_win_dragy, 16, guiheight - win_y);
				}
				else
					win_resize = false;
			}
			else
			{
				if window_get_cursor() == cr_size_nwse
				{
					if display_mouse_get_x() > window_get_x() && display_mouse_get_x() < window_get_x() + window_get_width()
					&& display_mouse_get_y() > window_get_y() && display_mouse_get_y() < window_get_y() + window_get_height()
						window_set_cursor(cr_default);
				}
				win_resize = false;
			}
			
			// draw
			var win_surf = surface_create(win_width, win_height);
			
			if surface_get_width(win_surf) != win_width or surface_get_height(win_surf) != win_height
				surface_resize(win_surf, win_width, win_height);
			
			surface_set_target(win_surf);
			draw_clear_alpha(wincol, 0.35);
			draw_set_colour(txtcol);
			draw();
			surface_reset_target();
			
			draw_surface(win_surf, win_x, win_y);
				
			// window top
			draw_set_colour(wincol);
			draw_set_alpha(focused ? 0.6 : 0.45);
			draw_rectangle(win_x, win_y, win_x + win_width - 1, win_y - 32, false);
			
			draw_set_colour(txtcol);
			draw_text(win_x + 6, win_y - 33 + floor(string_height("M") / 2), win_title);
			
			draw_set_alpha(1);
			surface_free(win_surf);
		}
	}
	
	#endregion
	#region dragging
	
	if instance_exists(WC_drag_inst)
	{
		draw_set_color(WC_drag_alt ? merge_colour(c_aqua, c_white, 0.75) : c_white);
		draw_set_align(fa_center, fa_top);
		
		var dragtext = "Dragging ";
		if mouse_check_button(mb_middle) && keyboard_check(vk_control)
			dragtext = "Duplicating ";
		
		var postext = $"x{WC_drag_inst.x} y{WC_drag_inst.y}";
		if WC_drag_alt
			postext += $"  >  x{floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0]} y{floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1]}";
		
		draw_text(guiwidth / 2, 0, concat(dragtext, object_get_name(WC_drag_inst.object_index), "\n", postext));
	}
	
	#endregion
	#region selecting instance
	
	if WC_select_mode != -1
	{
		draw_set_color(c_white);
		draw_set_align(fa_center, fa_top);
		draw_text(guiwidth / 2, 0, "Right click to cancel");
	}
	
	#endregion
}
