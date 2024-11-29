function chat_style_pto() constructor
{
	live_auto_call;
	
	created = false;
	typing = false;
	screensprite = noone;
	instance_list = noone;
	typing_box_height = 0;
	
	create = function()
	{
		with obj_netchat
			depth = -10000;
	}
	
	dispose = function(pause_only = false)
	{
		if screensprite != noone && sprite_exists(screensprite)
		{
			scr_delete_pause_image();
			screensprite = noone;
		}
		if instance_list != noone && ds_exists(instance_list, ds_type_list)
		{
			ds_list_destroy(instance_list);
			instance_list = noone;
		}
		
		if !pause_only
		{
			// rest goes here
			
		}
	}
	
	update = function()
	{
		if !created
			create();
		
		if DEBUG && keyboard_check_pressed(ord("R")) && !typing
		{
			with obj_netchat
			{
				instance_destroy();
				instance_create(0, 0, object_index);
			}
		}
		
		// quit on pause
		var quit = false;
		
		with obj_pause if pause quit = true;
		if room == Mainmenu or room == Longintro or room == Initroom or room == characterselect
			quit = true;
		
		if quit
		{
			obj_netchat.open = false;
			exit;
		}
		if instance_exists(obj_loadingscreen)
			exit;
		
		// toggle
		if (keyboard_check_pressed(ord("T")) && !(obj_netchat.open && typing))
		or (keyboard_check_pressed(vk_escape) && obj_netchat.open && !typing)
		{
			obj_netchat.open = !obj_netchat.open;
			with obj_pause
				pause_buffer = 5;
		}
		
		// update
		if obj_netchat.open
		{
			if !typing && keyboard_check_pressed(vk_enter)
			{
				dispose(true);
				
				instance_list = ds_list_create();
				scr_create_pause_image();
				scr_pause_deactivate_objects(false);
				typing = true;
				
				keyboard_string = "";
				with obj_shell
					WC_bindsenabled = false;
			}
			else if typing && (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter))
			{
				if keyboard_check_pressed(vk_enter)
				{
					// send message
					var player_name = "todo";
					var str = string_trim(keyboard_string, [" ", "\t", "\n"]);
					if str != ""
					{
						if string_starts_with(str, ":")
						{
							net_add_chat_message(player_name, str, true);
							
							var command = string_split(str, " ", true, infinity);
							switch command[0]
							{
								case ":clear":
									net_clear_chat();
									break;
								default:
									with net_add_chat_message("", "Command not found!")
										name_color = #FF7777;
									break;
							}
						}
						else
						{
							trace("Sent: \"", str, "\"");
							net_send_chat_message(player_name, str);
						}
						typing_box_height = 0;
					}
				}
				
				scr_pause_activate_objects(false);
				typing = false;
				
				dispose(true);
				
				keyboard_string = "";
				with obj_shell
					WC_bindsenabled = true;
			}
			
			if typing
			{
				if ord(keyboard_lastchar) == 127
					keyboard_string = "";
			}
		}
	}
	
	do_text_effect = function(xx, yy, chat_sep, xscale, yscale, command, pos, message, preview)
	{
		with message
		{
			if string_pos_ext(command, text, pos) == pos
			{
				if preview
				{
					draw_text_transformed_color(xx, yy, command, xscale, yscale, 0, c_gray, c_gray, c_gray, c_gray, 1);
					xx += string_width(command);
				}
				pos += string_length(command) - 1;
				return [true, xx, yy, pos];
			}
		}
		return [false];
	}
	
	render_chat_text = function(xx, yy, chat_sep, xscale, yscale, message, preview)
	{
		with message
		{
			draw_set_colour(name_color);
			draw_set_alpha(pending ? 0.5 : 1);
			
			var name_prefix = concat(name, ": ");
			if name == ""
				name_prefix = "";
			
			for(var c = 1; c <= string_length(name_prefix); c++)
			{
				var char = string_char_at(name_prefix, c);
				if char == ":"
					draw_set_color(c_white);
				
				draw_text_transformed(xx, yy, char, xscale, yscale, 0);
				
				xx += string_width(char);
			}
			
			var effect = 0;
			var color = c_white;
			
			for(var c = 1; c <= string_length(text); c++)
			{
				var r = other.do_text_effect(xx, yy, chat_sep, xscale, yscale, "</>", c, self, preview);
				if r[0]
				{
					xx = r[1];
					yy = r[2];
					c = r[3];
					color = c_white;
					effect = 0;
					continue;
				}
				
				var r = other.do_text_effect(xx, yy, chat_sep, xscale, yscale, "<wave>", c, self, preview);
				if r[0]
				{
					xx = r[1];
					yy = r[2];
					c = r[3];
					effect = 1;
					continue;
				}
				
				var r = other.do_text_effect(xx, yy, chat_sep, xscale, yscale, "<shake>", c, self, preview);
				if r[0]
				{
					xx = r[1];
					yy = r[2];
					c = r[3];
					effect = 2;
					continue;
				}
				
				var r = other.do_text_effect(xx, yy, chat_sep, xscale, yscale, "<rainbow>", c, self, preview);
				if r[0]
				{
					xx = r[1];
					yy = r[2];
					c = r[3];
					color = -1;
					continue;
				}
				
				if string_pos_ext("<#", text, c) == c && string_pos_ext(">", text, c) > c
				{
					var hex_effect = string_copy(text, c, string_pos_ext(">", text, c));
					var hex = string_copy(hex_effect, 3, string_length(hex_effect) - 3);
					
					var temp_color = net_parse_css_color(hex, true);
					if !is_string(temp_color)
						color = temp_color;
					
					if preview
					{
						var preview_color = is_string(temp_color) ? c_red : c_gray;
						draw_text_transformed_color(xx, yy, hex_effect, xscale, yscale, 0, preview_color, preview_color, preview_color, preview_color, 1);
						xx += string_width(hex_effect);
						c += string_length(hex_effect) - 1;
						continue;
					}
					else if !is_string(temp_color)
					{
						c += string_length(hex_effect) - 1;
						continue;
					}
				}
				
				var char = string_char_at(text, c);
				
				var draw_x = xx, draw_y = yy;
				if effect == 1
				{
					draw_x += cos(current_time / 100 + c);
					draw_y += sin(current_time / 100 + c);
				}
				if effect == 2
				{
					draw_x += random_range(-1, 1);
					draw_y += random_range(-1, 1);
				}
				
				var final_color = color;
				if color == -1
					final_color = make_color_hsv((current_time / 20 + (-c * 5)) % 255, 200, 255);
				
				draw_text_transformed_color(draw_x, draw_y, char, xscale, yscale, 0, final_color, final_color, final_color, final_color, draw_get_alpha());
				xx += string_width(char);
			}
			
			yy -= chat_sep;
		}
		return yy;
	}
	
	draw = function()
	{
		if obj_netchat.open
		{
			draw_set_font(global.font_small);
			
			var player_name = "todo";
			var helper_height = 100;
			
			// background
			reset_blendmode();
			
			if typing
				draw_sprite(screensprite, 0, 0, 0);
			
			shader_set(shd_blur);
			shader_set_uniform_f(shader_get_uniform(shd_blur, "size"), 960 / 3, 540 / 3, 4);
			
			if !typing
			{
				draw_surface_part(application_surface, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, 0, SCREEN_HEIGHT - helper_height);
				draw_surface_part(obj_screensizer.gui_surf, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, 0, SCREEN_HEIGHT - helper_height);
			}
			else
				draw_sprite_part_ext(screensprite, 0, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, 0, SCREEN_HEIGHT - helper_height, 1, 1, c_white, 1);
			
			shader_reset();
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - helper_height + 1, false);
			
			// helper box
			draw_set_alpha(0.75);
			draw_rectangle(0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_set_alpha(1);
			
			draw_set_align(fa_center, fa_middle);
			draw_set_color(c_white);
			draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT - helper_height / 2, typing ? "Press ENTER to send.\nPress ESCAPE to cancel." : "Press ENTER to start typing.\nPress ESCAPE to exit the chat.");
			
			// typing box
			draw_set_align();
			
			var chat_left = 4;
			var chat_bottom = SCREEN_HEIGHT - helper_height;
			
			var letter_height = string_height("A");
			var chat_sep = letter_height + 2;
			
			typing_box_height = Approach(typing_box_height, typing ? chat_sep : 0, 3);
			if typing_box_height > 0
			{
				draw_set_alpha(0.5);
				draw_set_color(c_black);
				draw_rectangle(0, chat_bottom - typing_box_height, SCREEN_WIDTH, chat_bottom, false);
				draw_set_alpha(1);
				
				draw_set_color(c_white);
				
				var yscale = typing_box_height / chat_sep;
				render_chat_text(chat_left, chat_bottom - letter_height * yscale, chat_sep, 1, yscale, {
					name: player_name,
					pending: false,
					name_color: c_white,
					text: concat(keyboard_string, (current_time % 1000) > 400 ? "|" : "")
				}, true);
			}
			
			// messages
			reset_blendmode();
			
			var size = ds_list_size(global.online_messages);
			var yy = chat_bottom - typing_box_height - letter_height;
			
			for(var i = size - 1; i >= 0; i--)
			{
				with global.online_messages[| i]
				{
					var flash_time = 400;
					if current_time - added < flash_time && !pending
					{
						var t = (current_time - added) / flash_time;
						draw_set_alpha((1 - t) * 0.4);
						draw_set_color(c_white);
						draw_rectangle(0, yy, SCREEN_WIDTH, yy + chat_sep - 1, false);
						draw_set_alpha(1);
					}
					
					yy = other.render_chat_text(chat_left, yy, chat_sep, 1, 1, self, false);
				}
				if yy <= 0
					break;
			}
			
			// auto complete
			if string_starts_with(keyboard_string, ":")
			{
				var commands = [":help", ":clear"];
				var yy = chat_bottom - typing_box_height - letter_height;
				for(var i = 0; i < array_length(commands); i++)
				{
					if string_pos(keyboard_string, commands[i]) == 1
					{
						draw_set_color(c_black);
						draw_set_alpha(0.75);
						draw_rectangle(0, yy, SCREEN_WIDTH, yy + chat_sep - 1, false);
						
						draw_set_alpha(1);
						draw_set_color(c_white);
						draw_text(chat_left, yy, commands[i]);
						yy -= chat_sep;
					}
				}
			}
		}
	}
	
	game_paused = function()
	{
		return typing;
	}
}
