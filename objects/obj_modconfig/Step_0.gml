live_auto_call;
ensure_order;

// subsection
if !visible
{
	buffer = 2;
	exit;
}
if buffer-- > 0
{
	buffer--;
	exit;
}

// get input
scr_menu_getinput();

// move
var move = key_down2 - key_up2;
var move_hor = key_left2 + key_right2;

if move_buffer == 0
{
	move = key_down - key_up;
	move_hor = key_left + key_right;
	move_buffer = 5;
}
else if (move != 0 or move_hor != 0) && move_buffer == -1
	move_buffer = 20;

if key_down - key_up != 0 or key_left + key_right != 0
{
	if move_buffer > 0
		move_buffer--;
}
else
	move_buffer = -1;

// state machine
switch state
{
	case 0: // sections
		back_hide_y = 50;
		
		if move_hor != 0
		{
			if (sel > 0 && move_hor == -1) or (sel < array_length(sections_array) - 1 && move_hor == 1)
			{
				menu_xo = move_hor * 25;
				alpha = 0;
				sel += move_hor;
				sound_play(sfx_step);
				scroll = 0;
			}
			else
				menu_xo = move_hor * 10;
		}
		state_trans = Approach(state_trans, 0, 0.25);
		scroll = lerp(scroll, 0, 0.25);
		
		if key_jump
		{
			var section = sections_array[sel];
			with section
			{
				if sel == -1
					sel = 0;
				while options_array[sel].type == modconfig.section
					sel++;
				select(sel);
			}
			sound_play(sfx_select);
			
			state = 1;
			state_trans = 0;
			
			yo = -20;
		}
		
		// SAVE
		if key_back
		{
			if mode == 0
			{
				ini_open_from_string(obj_savesystem.ini_str_options);
				
				var a = total_array();
				while array_length(a)
				{
					with array_pop(a)
					{
						for(var i = 0; i < array_length(options_array); i++)
						{
							var opt = options_array[i];
							if !is_callable(opt[$ "apply"])
								continue;
							var value = opt.apply();
							if opt.vari_target == global
							{
								if is_real(value)
									ini_write_real("Modded", opt.vari, value);
								else
									ini_write_string("Modded", opt.vari, value);
							}
						}
					}
				}
				
				ini_write_real("Modded", "preset_version", PRESET_VERSION);
				obj_savesystem.ini_str_options = ini_close();
				
				gamesave_async_save_options();
				with obj_option
				{
					optionselected = 0;
					backbuffer = 2;
				}
				with create_transformation_tip(lstr("mod_saved"))
				{
					depth = -700;
					alarm[1] = 100;
				}
				sound_play(sfx_back);
				
				instance_destroy();
				exit;
			}
			else
			{
				sound_play(sfx_back);
				mode = 0;
			}
		}
		break;
	
	case 1: // configs
		var submenu = self.submenu != noone ? submenus[? self.submenu] : noone;
		var section = sections_array[sel];
		
		if submenu != noone
		{
			if submenu_t < 1
			{
				submenu_t = Approach(submenu_t, 1, 0.1);
				alpha = -1;
			}
			section = submenu;
			
			if section.sel == -1
				section.sel = 0;
		}
		
		if key_back && mode != 2
		{
			sound_play(sfx_back);
			if mode == 3
				mode = 0;
			else if submenu != noone
			{
				self.submenu = noone;
				alpha = -1;
				options_bg = 5;
			}
			else
			{
				section.select(-1);
			
				state = 0;
				yo = 20;
			}
		}
		state_trans = Approach(state_trans, 1, 0.25);
		
		if move != 0 && mode != 2
		{
			control_mouse = false;
			yo = 10 * -move;
			
			with section
			{
				sel = max(sel, 0);
	
				sel += move;
				if sel >= array_length(options_array)
					sel = 0;
				if sel < 0
					sel = array_length(options_array) - 1;
				
				while options_array[sel].type == modconfig.section
				or options_array[sel].type == modconfig.padding
				or (options_array[sel].hidden && other.mode != 1)
				{
					sel += move;
					if sel < 0
						sel = array_length(options_array) - 1;
				}
				select(sel);
			}
		}
		
		if mode == 0 or (section.sel > -1 && mode == 1 && section.options_array[section.sel][$ "preset_thingy"])
		{
			if section.sel != -1
			{
				// change values
				var opt = section.options_array[section.sel], locked = false;
				if opt.type != modconfig.section && is_callable(opt.condition)
				{
					locked = opt.condition();
					if is_array(locked)
						locked = !(locked[0]);
				}

				if !locked
				{
					if opt.type == modconfig.slider
					{
						var move2 = key_left + key_right;
						if move2 != 0
						{
							image_index = 8;
							xo = 10;
							
							opt.value = clamp(opt.value + move2 * (((key_attack * 2) + 1) / 100), 0, 1);
							opt.apply(); // for presets
						}
					}
					else
					{
						var move2 = key_left2 + key_right2;
						//if control_mouse && mouse_check_button_pressed(mb_right)
						//	move2 = -1;
			
						if move2 != 0
						{
							image_index = 8;
							xo = 10;
						
							if opt.type == modconfig.option
							{
								simuplayer.changed = true;
							
								var valueold = opt.value;
								opt.value = clamp(opt.value + move2, 0, array_length(opt.opts) - 1);
								
								if valueold != opt.value
								{
									sound_play(sfx_step);
									opt.apply(); // for presets
								}
							}
							refresh_sequence();
						}
						if key_jump// or (control_mouse && mouse_check_button_pressed(mb_left))
						{
							image_index = 8;
							xo = 10;
							sound_play(sfx_select);
							
							if opt.type == modconfig.option
							{
								opt.value = wrap(opt.value + 1, 0, array_length(opt.opts) - 1);
								opt.apply(); // for presets
							}
							else if opt.type == modconfig.button
							{
								if is_callable(opt.func)
									opt.func();
							}
							else if opt.type == modconfig.preset
							{
								opt.preset.preset_apply();
								
								var a = total_array();
								for(var i = 0, n = array_length(a); i < n; ++i)
								{
									var this = a[i];
									this.refresh_options();
								}
							
								with create_transformation_tip("{u}Applied preset!/")
								{
									depth = -700;
									alarm[1] = 100;
								}
							}
							refresh_sequence();
						}
					}
				}
				else if key_jump
				{
					image_index = 8;
					xo = 10;
					sound_play("event:/sfx/misc/golfjingle");
				}
			}
		}
		
		// choose options for preset
		else if mode == 1
		{
			if section.sel != -1
			{
				var opt = section.options_array[section.sel], locked = false;
				if opt.type == modconfig.preset
					locked = true;
				if !(opt[$ "allow_preset"] ?? true)
					locked = true;
				
				if key_jump
				{
					image_index = 8;
					xo = 10;
					
					if locked
						sound_play("event:/sfx/misc/golfjingle");
					else if opt.type == modconfig.button
					{
						sound_play(sfx_select);
						if is_callable(opt.func)
							opt.func();
					}
					else
					{
						var ind = ds_list_find_index(preset_options, opt);
						if ind > -1
						{
							sound_play(sfx_back);
							ds_list_delete(preset_options, ind);
						}
						else
						{
							sound_play(sfx_select);
							ds_list_add(preset_options, opt);
						}
					}
				}
			}
		}
		else if mode == 2
		{
			var opt = section.options_array[section.sel];
			
			var str = "";
			for(var i = 1; i <= min(string_length(keyboard_string), 20); i++)
			{
				var char = string_char_at(keyboard_string, i);
				if char != "!" && char != "." && char != "'" && char != "," && char != " "
				&& !(ord(char) >= ord("a") && ord(char) <= ord("z"))
				&& !(ord(char) >= ord("A") && ord(char) <= ord("Z"))
				&& !(ord(char) >= ord("0") && ord(char) <= ord("9"))
					continue;
				
				str += char;
			}
			
			keyboard_string = str;
			opt.name = str;
			
			if keyboard_check_pressed(vk_enter) && string_trim(str, [" "]) != ""
			{
				opt.name = string_trim(opt.name, [" "]);
				
				var set_struct = {};
				for(var i = 0; i < ds_list_size(preset_options); i++)
				{
					var j = preset_options[| i];
					if j.type == modconfig.option
						var value = j.opts[j.value][1];
					if j.type == modconfig.slider
						var value = (j.range[0] + (j.range[1] - j.range[0]) * j.value);
					set_struct[$ j.vari] = value;
				}
				
				var main_struct =
				{
					name: opt.name,
					desc: opt.desc,
					version: PRESET_VERSION,
					options: set_struct
				};
				
				var c = 1;
				while file_exists(concat(save_folder, "presets/preset", c, ".json"))
					c++;
				
				var filename = concat(save_folder, "presets/preset", c, ".json");
				var file = file_text_open_write(filename);
				
				file_text_write_string(file, json_stringify(main_struct, true, undefined));
				file_text_close(file);
				
				sound_play("event:/modded/sfx/downloaded");
				create_transformation_tip("{u}Preset saved!/");
				
				opt.typing = false;
				opt.custom = true;
				opt.filename = filename;
				opt.preset.preset_copy_struct(set_struct);
				
				mode = 0;
				delete set_struct;
			}
		}
		else if mode == 3
		{
			var opt = section.options_array[section.sel];
			if key_jump
			{
				image_index = 8;
				xo = 10;
				
				if opt[$ "custom"] && opt[$ "filename"] != undefined
				{
					sound_play_centered(sfx_killenemy);
					file_delete(opt.filename);
					section.make_presets();
					section.sel--;
					mode = 0;
				}
				else
					sound_play("event:/sfx/misc/golfjingle");
			}
		}

		// figure out scroll
		if section.sel >= 0
		{
			var scrolltarget = max(section.options_pos[section.sel] - SCREEN_HEIGHT / 2, 0);
			section.sel = max(section.sel, 0);
		
			scroll = lerp(scroll, scrolltarget, 0.2);
		}
		break;
}

// top scrolling
if sel > -1
{
	var section_sep = 280;

	draw_set_font(lang_get_font("creditsfont"));
	var section_pos = 100 + string_width(sections_array[sel].name) + sel * section_sep - section_scroll[0];

	if section_pos > SCREEN_WIDTH - 100
		section_scroll[0] += 100;
	if section_pos < 150
		section_scroll[0] -= 100;
}
section_scroll[1] = lerp(section_scroll[1], section_scroll[0], 0.25);

// animation
menu_xo = lerp(menu_xo, 0, 0.25);
if abs(menu_xo) < 1
	menu_xo = 0;

xo = lerp(xo, 0, 0.25);
yo = lerp(yo, 0, 0.25);
alpha = lerp(alpha, 1, 0.25);

// making preset transfotip
var t = "";
if mode == 1
{
	if state == 1
	{
		if section[$ "make_presets"] != undefined
		{
			if ds_list_size(preset_options) == 0
				t = lstr("mod_config_mode4");
			else
				t = lstr("mod_config_mode7");
		}
		else
			t = lstr("mod_config_mode6");
	}
	else
		t = lstr("mod_config_mode5");
}
if mode == 2
	t = lstr("mod_config_mode2");
if mode == 3
	t = lstr("mod_config_mode3");

if t != ""
{
	var transfotip;
	if instance_exists(obj_transfotip)
		transfotip = obj_transfotip.id;
	else
		transfotip = instance_create(x, y, obj_transfotip);
	
	with transfotip
	{
		if text != t
		{
			text = t;
			alarm[0] = 1;
		}
		alarm[1] = 5;
		depth = -700;
		
		fadeout_speed = 0.1;
		fadeout = false;
	}
}
