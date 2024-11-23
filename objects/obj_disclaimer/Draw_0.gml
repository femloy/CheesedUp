live_auto_call;

if instance_exists(obj_loadingscreen)
	exit;

// surface bullshit
if !surface_exists(surf)
	surf = surface_create(960, 540);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// roundrect
draw_set_colour(c_black);

var xx = 50 * size;
var yy = 32 * size;
var xsiz = (960 / 2) * (1 - size);
var ysiz = (540 / 2) * (1 - size);
var rectsize = 5;

draw_set_alpha(0.95);
draw_roundrect_ext(xx + xsiz, yy + ysiz, 960 - xx - xsiz, 540 - yy - ysiz, 12, 12, false);
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.1);
draw_roundrect_ext(xx + xsiz + rectsize, yy + ysiz + rectsize, 960 - xx - xsiz - rectsize, 540 - yy - ysiz - rectsize, 12, 12, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

// draw it
surface_reset_target();
draw_surface(surf, 0, 0);

// disclaimer
if menu == 0
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);

if t >= 1 or menu == 3
{
	switch menu
	{
		case 0:
			if state == 1
			{
				// disclaimer
				draw_set_align(fa_left);
				draw_set_colour(c_white);
			
				var disclaimer_alpha = clamp((room_speed * 3 - disclaimer.wait - 20) / 20, 0, 1);
				draw_set_alpha(disclaimer_alpha);
			
				draw_set_font(lang_get_font("creditsfont"));
				scr_draw_text_arr(SCREEN_WIDTH / 2 - disclaimer.header_size[0] / 2, 100, disclaimer.header, merge_colour(c_red, c_white, 0.25), disclaimer_alpha);
			
				draw_set_font(lfnt("tvbubblefont"));
				draw_set_align(fa_center);
				
				var disc_text = lstr("disclaimer");
				draw_text(SCREEN_WIDTH / 2, 180, disc_text);
				
				// blatant advertisement
				if text_button(SCREEN_WIDTH / 2, 180 + string_height(disc_text), concat("\n    ", lstr("disclaimer_link"), "    \n\n"), #5865F2, c_white) == 2
				{
					sound_play(sfx_collect);
					url_open("https://discord.gg/thenoise");
				}
				
				// continue button
				if disclaimer.wait-- <= 0// or PLAYTEST
				{
					draw_set_font(lang_get_font("creditsfont"));
					draw_set_alpha(clamp(-disclaimer.wait / 20, 0, 1));
				
					if text_button(960 / 2, 440, lstr("disclaimer_continue"), c_dkgray, c_white) == 2
					or (key_jump or keyboard_check_pressed(vk_enter))
					{
						sound_play("event:/modded/sfx/diagclose");
						state = -2;
						disclaimer.wait = 30;
					
						ini_open(game_save_id + "saveData.ini");
						ini_write_real("Modded", "disclaimer", true);
						ini_close();
					}
				}
			}
			else if state == -2
			{
				if disclaimer.wait-- <= 0
				{
					global.disclaimer_section = 2;
					room_restart();
				}
			}
			break;
	
		case 2:
			// playtester
			if PLAYTEST
			{
				draw_set_align(fa_center);
			
				draw_set_colour(merge_colour(c_red, c_white, 0.25));
				draw_set_font(lang_get_font("bigfont"));
				draw_text((960 / 2) + random_range(-1, 1), 100, "DISCLAIMER");
			
				// actual text
				draw_set_colour(c_white);
				draw_set_font(font1);
				draw_text(960 / 2, 160, self.str);
			
				if state == 2
				{
					if x++ == 300
						self.str += "\n\nThe servers might be down...\nTry again in a little bit.";
				}
				else if state == 1
				{
					var tsize = 400;
					var textbox = pto_textbox(960 / 2 - tsize / 2, 300, tsize, 30, , "Password");
		
					if pto_button(960 / 2 - 200 / 2, 350, 200, , , , , "Enter") == 2
					or (textbox.sel && keyboard_check_pressed(vk_enter))
					{
						textbox.str = string_trim(textbox.str, []);
					
						if obj_richpresence.userid == ""
						{
							show_message("Failed to start the Rich Presence! Make sure you have your Discord desktop client open, and that it's compatible with it.");
							exit;
						}
						if obj_richpresence.userid == "1045800378228281345"
						{
							show_message("You appear to be using arRPC for Rich Presence. This is incompatible with the playtester login. Get the vanilla Discord client.");
							exit;
						}
				
						if os_is_network_connected(true) && textbox.str != "" && string_digits(textbox.str) == textbox.str && count < 5
						{
							sound_play_centered(sfx_collect);
							self.str = "(Checking...)";
							state = 2;
						
							x = 0;
						
							// https://play.cheesedup.lol/verify.php
							var base_link = concat("https://play.cheesedup.lol/", "verify", ".php");
							req = http_get($"{base_link}?{"key"}={textbox.str}&{"id"}={obj_richpresence.userid}&{"v"}={GM_version}");
						}
					
						textbox.str = "";
						keyboard_string = "";
					}
				}
				break;
			}
		
		case 3:
			// crash handler
			draw_clear(c_black);
			draw_set_align();
		
			if sprite_exists(crash_image)
				draw_sprite_stretched_ext(crash_image, 0, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, 0.15);
		
			var crashtext = lstr("disclaimer_crash1");
			//var crashtext2 = "Screenshot this and report it on Discord!";
			
			draw_set_colour(c_white);
			draw_set_alpha(1);
			tdp_draw_set_font(lang_get_font("font_small"));
			
			var yy = 16;
			tdp_draw_text_transformed(16, yy, crashtext, 2, 2, 0);
			yy += string_height(crashtext) * 2;
			yy += 16;
			
			draw_set_font(font1);
			draw_text_ext_color(16, yy, string_replace_all(crash_msg.longMessage, "\t", ""), 16, SCREEN_WIDTH, c_ltgray, c_ltgray, c_ltgray, c_ltgray, 1);
			
			tdp_draw_set_font(lang_get_font("creditsfont"));
			global.tdp_text_try_outline = true;
			scr_draw_text_arr(SCREEN_WIDTH / 2 - scr_text_arr_size(text)[0] / 2, SCREEN_HEIGHT - 64, text);
			global.tdp_text_try_outline = false;
			
			tdp_text_commit();
			break;
	}
}

// fade in
draw_set_alpha(fade_alpha);
draw_set_colour(c_black);
draw_rectangle(CAMX, CAMY, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
