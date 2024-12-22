exit;

#macro CHAT_TEXT_ARGS draw_x, draw_y, char, char_pos, xscale, yscale, color, alpha
#macro CHAT_ERROR_COLOR #ff7777

function chat_style_pto() constructor
{
	live_auto_call;
	
	created = false;
	typing = false;
	paused = false;
	screensprite = noone;
	instance_list = noone;
	typing_box_height = 0;
	helper_height = 100;
	
	// Add new effects here (don't use non-local variables in these functions)
 	default_text_drawer = function(CHAT_TEXT_ARGS)
	{
		draw_text_transformed_color(draw_x, draw_y, char, xscale, yscale, 0, color, color, color, color, alpha);
	}
	
	chat_effects = {};
	chat_effects[$ "</>"] =
	{
		text_drawer: default_text_drawer,
		color: c_white
	};
	chat_effects[$ "<wave>"] =
	{
		text_drawer: method({d: default_text_drawer}, function(CHAT_TEXT_ARGS)
		{
			draw_x += cos(current_time / 100 + char_pos);
			draw_y += sin(current_time / 100 + char_pos);
			d(CHAT_TEXT_ARGS);
		})
	}
	chat_effects[$ "<shake>"] =
	{
		text_drawer: method({d: default_text_drawer}, function(CHAT_TEXT_ARGS)
		{
			draw_x += random_range(-1, 1);
			draw_y += random_range(-1, 1);
			d(CHAT_TEXT_ARGS);
		})
	}
	chat_effects[$ "<rainbow>"] =
	{
		color: function(CHAT_TEXT_ARGS)
		{
			return make_color_hsv((current_time / 20 + (-char_pos * 5)) % 255, 200, 255);
		}
	}
	
	// Chat message drawer
	render_chat_text = function(xx, yy, chat_sep, xscale, yscale, message, preview)
	{
		var starting_x = xx;
		with message
		{
			draw_set_colour(name_color);
			draw_set_alpha(pending ? 0.5 : 1);
			
			// format
			var text_final = text;
			var yy_offset = 0;
			
			for(var c = 1; c <= string_length(text_final); c++)
			{
				var char = string_char_at(text_final, c);
				if char == "\n"
				{
					if !preview
						yy_offset -= chat_sep;
				}
			}
			
			// name
			var name_prefix = "";
			if name != ""
			{
				name_prefix = concat(name, ": ");
				
				draw_text_transformed(xx, yy + yy_offset, name, xscale, yscale, 0);
				xx += string_width(name);
				
				draw_set_color(c_white);
				draw_text_transformed(xx, yy + yy_offset, ":", xscale, yscale, 0);
				xx += string_width(": ");
			}
			
			// content
			var text_drawer = other.default_text_drawer;
			var color = c_white; // may be function, see chat_effects struct
			
			var effect_struct = struct_get_names(other.chat_effects);
			for(var c = 1; c <= string_length(text_final); c++)
			{
				var char = string_char_at(text_final, c);
				if char == "\n"
				{
					xx = starting_x + string_width(name_prefix);
					yy_offset += chat_sep * 2;
					yy -= chat_sep;
					continue;
				}
				
				// generic effects
				var do_continue = false;
				var escape_character = "!";
				for(var i = 0; i < array_length(effect_struct); i++)
				{
					var command = effect_struct[i], this = other.chat_effects[$ command];
					if string_char_at(text_final, c) == escape_character && string_pos_ext(command, text_final, c) == c + 1
					{
						do_continue = true;
						break;
					}
					if string_pos_ext(command, text_final, c) == c && string_char_at(text_final, c - 1) != escape_character
					{
						if preview
						{
							draw_text_transformed_color(xx, yy + yy_offset, command, xscale, yscale, 0, c_gray, c_gray, c_gray, c_gray, 1);
							xx += string_width(command);
						}
						c += string_length(command) - 1;
						do_continue = true;
						
						text_drawer = this[$ "text_drawer"] ?? text_drawer;
						color = this[$ "color"] ?? color;
						break;
					}
				}
				if do_continue
					continue;
				
				// hex colors
				if string_pos_ext("<#", text_final, c) == c && string_pos_ext(">", text_final, c) > c
				{
					var hex_effect = string_copy(text_final, c, string_pos_ext(">", text_final, c) - c + 1);
					var hex = string_copy(hex_effect, 3, string_length(hex_effect) - 3);
					
					var temp_color = net_parse_css_color(hex, true);
					var error = is_string(temp_color);
					
					if !error
						color = temp_color;
					
					if preview
					{
						var preview_color = error ? CHAT_ERROR_COLOR : c_gray;
						draw_text_transformed_color(xx, yy + yy_offset, hex_effect, xscale, yscale, 0, preview_color, preview_color, preview_color, preview_color, 1);
						
						if error
						{
							draw_set_alpha(0.25);
							draw_rectangle_color(xx, yy - chat_sep + yy_offset, xx + string_width(string(temp_color)), yy + yy_offset - 3, 0, 0, 0, 0, false);
							draw_set_alpha(1);
							draw_text_transformed_color(xx, yy - chat_sep + yy_offset, temp_color, xscale, yscale, 0, preview_color, preview_color, preview_color, preview_color, 1);
						}
						
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
				
				// actually draw it
				var final_color = color;
				if is_method(color)
					final_color = color(xx, yy + yy_offset, char, c, xscale, yscale, noone, noone);
				
				text_drawer(xx, yy + yy_offset, char, c, xscale, yscale, final_color, draw_get_alpha());
				xx += string_width(char);
			}
			
			yy -= chat_sep;
		}
		return yy;
	}
	
	// The internals. Mmmppghhghf.....
	pause = function()
	{
		dispose(true);
		instance_list = ds_list_create();
		scr_create_pause_image();
		scr_pause_deactivate_objects(false);
		paused = true;
	}
	
	unpause = function()
	{
		scr_pause_activate_objects(false);
		dispose(true);
		paused = false;
	}
	
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
		with obj_shell if isOpen quit = true;
		with obj_popupscreen if type == 0 quit = true;
		
		if quit && !game_paused()
		{
			obj_netchat.open = false;
			typing = false;
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
				pause();
				typing = true;
				
				keyboard_string = "";
				with obj_shell
					WC_bindsenabled = false;
			}
			else if typing && (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter)) && !keyboard_check(vk_shift)
			{
				if keyboard_check_pressed(vk_enter)
				{
					// send message
					var player_name = obj_netclient.username;
					var str = string_trim(keyboard_string, [" ", "\t", "\n"]);
					if str != ""
					{
						var send_over = true;
						if string_starts_with(str, ":")
						{
							send_over = false;
							
							var command = string_split(str, " ", true, infinity);
							switch command[0]
							{
								case ":help":
									net_add_chat_message("", concat(
										"COMMANDS\n",
										":help<#777777> - Displays all currently available commands.</>\n",
										":clear<#777777> - Clears the chat.</>\n",
										"\n",
										"EFFECTS\n",
										"<#RRGGBB><#777777> - Displays text with the specified color.</>\n",
										"!<wave><#777777><wave> - Wavy text</>\n",
										"!<shake><#777777><shake> - Shaky text</>\n",
										"!<rainbow><#777777><rainbow> - Rainbow text</>"
									));
									break;
								
								case ":clear":
									net_clear_chat();
									break;
								
								case ":ping":
									net_send_ping();
									break;
								
								// serverside
								default:
									/*
									net_add_chat_message(player_name, str, true);
									with net_add_chat_message("", "Command not found!")
										name_color = CHAT_ERROR_COLOR;
									*/
									send_over = true;
									break;
							}
						}
						if send_over
						{
							trace("Sent: \"", str, "\"");
							net_send_chat_message(str);
						}
						typing_box_height = 0;
					}
				}
				
				unpause();
				typing = false;
				
				keyboard_string = "";
				with obj_shell
					WC_bindsenabled = true;
			}
			
			if typing
			{
				if ord(keyboard_lastchar) == 127
					keyboard_string = "";
				if string_starts_with(keyboard_string, ":lua ")
				&& keyboard_check(vk_shift) && keyboard_check_pressed(vk_enter)
					keyboard_string += "\n";
				if string_pos("  ", keyboard_string) != 0
					keyboard_string = string_replace_all(keyboard_string, "  ", " ");
			}
		}
	}
	
	pre_draw = function(x, y, xscale, yscale)
	{
		if obj_netchat.open
		{
			if typing && sprite_exists(screensprite)
				draw_sprite_ext(screensprite, 0, x, y, xscale, yscale, 0, c_white, 1);
			
			shader_set(shd_blur);
			shader_set_uniform_f(shader_get_uniform(shd_blur, "size"), 960 / 3, 540 / 3, 4);
			
			if !typing
			{
				draw_surface_part_ext(application_surface, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, x, y + SCREEN_HEIGHT - helper_height, xscale, yscale, c_white, 1);
				if surface_exists(obj_screensizer.gui_surf)
					draw_surface_part_ext(obj_screensizer.gui_surf, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, x, y + SCREEN_HEIGHT - helper_height, xscale, yscale, c_white, 1);
			}
			else if sprite_exists(screensprite)
				draw_sprite_part_ext(screensprite, 0, 0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, helper_height, x, y + SCREEN_HEIGHT - helper_height, xscale, yscale, c_white, 1);
			
			shader_reset();
		}
	}
	
	draw = function()
	{
		if obj_netchat.open
		{
			draw_set_font(global.font_small);
			
			var player_name = obj_netclient.username;
			
			// background
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - helper_height + 1, false);
			
			// helper box
			draw_set_alpha(0.75);
			draw_rectangle(0, SCREEN_HEIGHT - helper_height, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_set_alpha(1);
			
			draw_set_align(fa_center, fa_middle);
			draw_set_color(c_white);
			draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT - helper_height / 2,
				typing ? concat("Press ENTER to send.\nPress ESCAPE to cancel.", string_starts_with(keyboard_string, ":lua ") ? "\nPress SHIFT + ENTER for newline." : "")
				: "Press ENTER to start typing.\nPress ESCAPE to exit the chat.");
			
			// messages
			draw_set_align();
			
			var chat_left = 4;
			var chat_bottom = SCREEN_HEIGHT - helper_height;
			
			var letter_height = string_height("A");
			var chat_sep = letter_height + 2;
			
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
			
			// typing box
			var target_height = chat_sep;
			if typing_box_height > 0
			{
				draw_set_alpha(0.25);
				draw_set_color(c_black);
				draw_rectangle(0, chat_bottom - typing_box_height, SCREEN_WIDTH, chat_bottom, false);
				draw_set_alpha(1);
				
				draw_set_color(c_white);
				
				var yscale = typing_box_height / chat_sep;
				var yy = chat_bottom - letter_height - (chat_sep * (yscale - 1));
				
				var new_yy = render_chat_text(chat_left, yy, chat_sep, 1, clamp(yscale, 0, 1), {
					name: player_name,
					pending: false,
					name_color: c_white,
					text: concat(keyboard_string, (current_time % 1000) > 400 ? "|" : "")
				}, true);
				
				target_height = yy - new_yy;
			}
			typing_box_height = Approach(typing_box_height, typing ? target_height : 0, max(abs(typing_box_height - target_height) / chat_sep, 1) * 3);
			
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
						draw_set_alpha(0.25);
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
		return paused;
	}
}
