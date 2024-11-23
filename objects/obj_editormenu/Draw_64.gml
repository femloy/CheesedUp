live_auto_call;

draw_set_align(fa_left);
draw_reset_clip();

switch menu
{
	case 0:
		draw_set_font(global.creditsfont);
		
		// levels
		var array = towers;
		for(var i = 0; i < array_length(array); i++)
		{
			var xx = 100 - cam.x + random_range(-shake, shake), yy = i * 36 - cam.y + random_range(-shake, shake);
			if fader <= 0 && sel.y != i
				continue;
			if yy < -32
				continue;
			if yy > SCREEN_HEIGHT
				break;
			
			if sel.y == i
			{
				xx += random_range(delete_time / 5, -delete_time / 5);
				yy += random_range(delete_time / 5, -delete_time / 5);
			}
			
			draw_set_align(fa_left);
			
			var this = array[i], str = this.name, wd = 32 * 16;
			var drawx = xx;
			
			if sel.y == i
			{
				draw_set_colour(c_white);
				if string_width(str) > wd
				{
					textscroll += 1.5;
			
					drawx -= clamp(textscroll - 50, 0, string_width(str) - wd);
					if textscroll >= string_width(str) - wd + 200
						textscroll = -50;
				}
			}
			else
			{
				draw_set_colour(c_gray);
				draw_set_alpha(fader);
			}
			if this.type == 0
				draw_sprite_ext(spr_towericon, 0, xx - 42, yy, 1, 1, 0, sel.y == i ? c_white : c_gray, draw_get_alpha());
			
			if sel.y == i && delete_time > 0.5
			{
				textscroll = 0;
				wd = string_width(str);
				
				draw_set_colour(c_red);
				draw_set_bounds(xx, yy, xx + wd * (delete_time / 100), yy + 32);
				draw_text_new(drawx, yy, str);
				
				draw_set_colour(c_white);
				draw_set_bounds(xx + wd * (delete_time / 100), yy, xx + wd, yy + 32);
				draw_text_new(drawx, yy, str);
			}
			else
			{
				draw_set_bounds(xx, yy, xx + wd, yy + 32);
				draw_text_new(drawx, yy, str);
			}
			draw_reset_clip();
			draw_set_alpha(1);
			
			if (this.corrupt or this.fresh) && state == 0
			{
				draw_set_colour(this.corrupt ? c_red : c_yellow);
				draw_set_align(fa_center, fa_middle);
				draw_text_new((xx - 72 + 8) + (this.type == 1 ? 40 : 0), yy + min(sin(current_time / 200) * 15 + 5, 0) + 20, "!");
			}
		}

		// control help
		tdp_draw_set_font(lfnt("creditsfont"));
		if controls.text == ""
			controls.compiled = noone;
		else if controls.text != controls.text_prev
		{
			controls.text_prev = controls.text;
			controls.compiled = scr_compile_icon_text(controls.text, 1, true);
		}
		if controls.compiled != noone
		{
			draw_set_colour(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, SCREEN_HEIGHT - 32 - 8 - 8, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_set_alpha(1);
			draw_set_align();
			
			global.tdp_text_try_outline = true;
			scr_draw_text_arr(SCREEN_WIDTH - 8 - controls.compiled[2], SCREEN_HEIGHT - 32 - 8, controls.compiled[0]);
			global.tdp_text_try_outline = false;
			tdp_text_commit();
		}

		// top right
		if state == 0
		{
			tdp_draw_set_font(lfnt("creditsfont"));
			global.tdp_text_try_outline = true;
			
			var yy = 0;
	
			// browse
			tdp_draw_set_align(fa_right);
			draw_set_color(c_white);
			
			if text_button(SCREEN_WIDTH - 16, 16, lstr("cyop_browse")) == 2
			{
				page = 1;
				fetch_remote_towers(page);
				
				sel.x = 0;
				sel.y = 0;
				
				instance_destroy(obj_startgate_pizza);
				instance_destroy(obj_startgate_secreteye);
				instance_destroy(obj_startgate);
			}
			yy += 1.5;
			
			tdp_draw_set_font(lang_get_font("font_small"));
			tdp_draw_set_align(fa_right);
			draw_set_color(c_white);
			
			// open levels folder
			if has_pizzatower && directory_exists(towers_folder)
			{
				if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 26), lstr("cyop_openfolder")) == 2
					launch_external($"explorer.exe \"{towers_folder}\"");
			}
		
			// pick file
			if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 26), lstr("cyop_pickfile")) == 2
			{
				var load = get_open_filename_ext($"{lstr("cyop_filekind")} (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", lstr("cyop_file_prompt"));
				if load != ""
				{
					state = 2;
					with instance_create(0, 0, obj_cyop_loader)
					{
						var result = cyop_load(load);
						if is_string(result)
						{
							show_message(result);
							instance_destroy();
							other.state = 0;
						}
						else
							loaded = true;
					}
				}
			}
			
			if array_length(towers) > 0
			{
				var level = towers[sel.y];
				
				// level filename
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_gray);
				draw_text(SCREEN_WIDTH - 16, 16 + (yy++ * 26), $"{filename_name(filename_dir(level.file))}/{string_replace(filename_name(level.file), ".tower.ini", "")}");
				draw_set_align();
			}
			else
			{
				tdp_draw_set_font(lang_get_font("creditsfont"));
				tdp_draw_set_align(fa_center, fa_middle);
				tdp_draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, lstr("cyop_nolevels"));
			}
			global.tdp_text_try_outline = false;
			tdp_text_commit();
		}
		break;
	
	case 1:
		// 0 - loading listing
		// 1 - loaded
		// 2 - downloading level
		
		if state != 2
		{
			draw_set_colour(c_black);
			draw_set_alpha(0.9);
			draw_roundrect(16 - 1, 16 - 1, SCREEN_WIDTH - 16 - 1, SCREEN_HEIGHT - 16 - 1, false);
			draw_set_alpha(1);
			draw_set_colour(c_white);
		
			tdp_draw_set_font(lang_get_font("font_small"));
			var center = 582 + (530 * 0.65 / 2); // center of the right side.
		
			var boundleft = 16 + 1, boundtop = 16 + 1, boundright = SCREEN_WIDTH - 16, boundbottom = SCREEN_HEIGHT - 16;
			draw_set_bounds(boundleft, boundtop, boundright, boundbottom);
		}
		
		if state == 0
		{
			// loading list...
			draw_reset_clip();
			
			image_angle += 5;
			draw_sprite_ext(spr_loading, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 1, 1, image_angle, c_white, 1);
			
			draw_set_align(fa_center);
			draw_text(center, SCREEN_HEIGHT - 20 - 50, embed_value_string(lstr("cyop_page"), [page]));
			
			exit;
		}
		else if state == 2
		{
			// preview image
			var this = remote_towers[sel.y];
			var scrw = SCREEN_WIDTH;
			var scrh = SCREEN_HEIGHT;
			var width = sprite_get_width(this.image);
			var height = sprite_get_height(this.image);
			var scale = min(scrw / height, scrh / width);
			
			var xx = scrw / 2 - (width / 2 * scale);
			var yy = scrh / 2 - (height / 2 * scale);
			
			gpu_set_tex_filter(true);
			draw_sprite_ext(this.image, 0, xx, yy, scale, scale, 0, c_white, 1);
			gpu_set_tex_filter(false);
			
			if mouse_check_button_pressed(mb_left)
				state = 1;
		}
		else if state == 3
		{
			// download options
			if array_length(download_choices) == 0
			{
				image_angle += 5;
				draw_sprite_ext(spr_loading, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 1, 1, image_angle, c_white, 1);
			}
			else
			{
				/*
				if keyboard_check_pressed(ord("1"))
				{
					download_choices[array_length(download_choices)] = download_choices[array_length(download_choices) - 1];
				}
				if keyboard_check_pressed(ord("2")) && array_length(download_choices) > 1
				{
					array_delete(download_choices, array_length(download_choices) - 1, 1);
				}
				*/
				
				draw_set_font(lfnt("creditsfont"));
				draw_set_align(fa_center);
				draw_text(SCREEN_WIDTH / 2, boundtop + 24, lstr("cyop_downloads"));
				
				tdp_draw_set_font(lfnt("font_small"));
				
				var count = array_length(download_choices);
				draw_text_color(SCREEN_WIDTH / 2, boundtop + 64, embed_value_string(lstr("cyop_download_count"), [count]), c_gray, c_gray, c_gray, c_gray, 1);
				
				var wd = 500, ht = 75, hpad = 4;
				var xx = SCREEN_WIDTH / 2, yy = SCREEN_HEIGHT / 2;
				
				yy -= ((ht + hpad) * (count - 1)) / 2;
				yy = round(max(yy, SCREEN_HEIGHT / 2 - 150 + ht / 2));
				
				// scroll area
				var left = xx - wd / 2, right = xx + wd / 2;
				var top = SCREEN_HEIGHT / 2 - 150, bottom = SCREEN_HEIGHT / 2 + 150;
				
				draw_set_bounds(left, top, right + 1, bottom + 1);
				if point_in_rectangle(mouse_x_gui, mouse_y_gui, left, top, right, bottom)
				{
					if mouse_wheel_up()
						downloads_scroll += 32;
					if mouse_wheel_down()
						downloads_scroll -= 32;
					
					downloads_scroll = clamp(downloads_scroll, -(ht + hpad) * count - (top - bottom) + hpad, 0);
				}
				
				// draw them
				yy += downloads_scroll;
				
				tdp_draw_set_align(fa_center, fa_middle);
				for(var i = 0; i < count; i++)
				{
					var this = download_choices[i];
					var this_top = yy - ht / 2, this_bottom = yy + ht / 2;
					
					if yy + ht / 2 < top
					{
						yy += ht + hpad;
						continue;
					}
					if yy - ht / 2 > bottom
						break;
					
					var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, left, max(this_top, top), right, min(this_bottom, bottom));
					var col1 = hovering * #222222 + #5000b8, col2 = hovering * #222222 + #1070d0;
					
					var downloadable = string_ends_with(this._sFile, ".zip");
					draw_rectangle_color(left, this_top, right, this_bottom, col1, col2, col2, col1, !downloadable);
					
					var str = $"{this._sFile}";
					if this._sDescription != ""
						str = $"{this._sDescription}\{c_gray\}\n{str}";
					draw_text_special(lerp(left, right, 0.5), lerp(this_top, this_bottom, 0.5), str, {});
					
					if hovering && mouse_check_button_pressed(mb_left)
					{
						if downloadable
						{
							var download = downloads[sel.y];
							var tower = remote_towers[sel.y];
							
							download.file = this;
							download.file.path = $"{towers_folder}\\temp_{tower.modid}\\download.zip";
							download.request = http_get_file(this._sDownloadUrl, download.file.path);
							download.state = 1;
							
							state = 1;
							
							// delete level from play list
							for(var i = 0; i < array_length(towers); i++)
							{
								var curr = towers[i];
								if filename_name(filename_dir(curr.file)) == concat(filter == gb_filter.WIP ? "WIP-" : "", tower.modid)
									array_delete(towers, i, 1);
							}
						}
						else
						{
							if string_ends_with(this._sFile, ".rar")
								message_show(lstr("cyop_error_rar"));
							else if string_ends_with(this._sFile, ".json")
								message_show(lstr("cyop_error_json"));
							else
								message_show(embed_value_string(lstr("cyop_error_nonzip"), [filename_ext(this._sFile)]));
						}
					}
					
					yy += ht + hpad;
				}
				
				tdp_text_commit();
				draw_reset_clip();
				
				draw_set_align(fa_center);
				if text_button(SCREEN_WIDTH / 2, boundbottom - 64, lstr("cyop_back")) == 2
				&& state != 1
					done_download(sel.y);
			}
		}
		else
		{
			// list
			var xxstart = 36, yystart = 32;
			var xx = xxstart, yy = yystart;
			
			/*
			var temp_sel = sel.y;
			if mouse_check_button_pressed(mb_left)
				temp_sel = -1;
			*/
			
			var col1 = merge_color(#5000b8, c_white, 0.5), col2 = merge_color(#1070d0, c_white, 0.5);
			for(var i = 0; i < array_length(remote_towers); i++)
			{
				var this = remote_towers[i];
				var scale = 0.3;
				var sprw = 530 * scale, sprh = 298 * scale;
				
				if !(yy - scroll + 200 < boundtop or yy - scroll >= boundbottom)
				{
					var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy - scroll, xx + sprw, yy + 180 - scroll);
					if hovering
					{
						draw_set_bounds(boundleft, boundtop, boundright, boundbottom);
						draw_rectangle_color(xx - 4, yy - 4 - scroll, xx + sprw + 4, yy + 180 + 4 - scroll, c_aqua, c_aqua, c_aqua, c_aqua, true);
						if mouse_check_button_pressed(mb_left)
						{
							if sel.y == i
								sel.y = -1;
							else
								sel.y = i;
						}
						//temp_sel = sel.y;
					}
				
					draw_set_bounds(xx, max(yy - scroll, boundtop), xx + 160, min(yy + 200 - scroll, boundbottom));
					draw_set_colour(c_white);
					if sel.y > -1 && sel.y != i
						draw_set_colour(#555555);
					
					gpu_set_tex_filter(true);
					if this.image_loaded
					{
						var actual_w = sprite_get_width(this.image) * scale;
						var actual_h = sprite_get_height(this.image) * scale;
						
						scale = min(sprw / actual_w, sprh / actual_h);
						actual_w *= scale;
						actual_h *= scale;
						
						draw_sprite_stretched_ext(this.image, 0, xx + (sprw / 2) - (actual_w / 2), yy - scroll + (sprh / 2) - (actual_h / 2), actual_w, actual_h, draw_get_colour(), 1);
					}
					else
					{
						draw_rectangle_color(xx, yy - scroll, xx + sprw - 1, yy + sprh - 1 - scroll, 0, 0, 0, 0, false);
						draw_sprite_ext(spr_loading, 0, xx + sprw / 2, yy + sprh / 2 - scroll, 0.5, 0.5, current_time, c_white, 1);
					}
					gpu_set_tex_filter(false);
				
					// stats
					draw_set_font(lang_get_font("smallfont"));
					draw_set_alpha(0.5);
					
					draw_sprite_ext(spr_browsericons, 1, xx, yy + 100 - scroll + 64, 1, 1, 0, draw_get_colour(), 0.5);
					
					var viewsstr = this.views;
					if this.views > 1000
						viewsstr = string_replace(string_format(this.views / 1000, 1, 1), ".0", "") + lstr("cyop_thousand");
					
					draw_text_new(xx + 16, yy + 100 - scroll + 64, viewsstr);
					
					draw_sprite_ext(spr_browsericons, 2, xx + 32 + string_width(viewsstr), yy + 100 - scroll + 64, 1, 1, 0, draw_get_colour(), 0.5);
					draw_text_new(xx + 16 + 32 + string_width(viewsstr), yy + 100 - scroll + 64, this.posts);
					
					// text
					draw_set_alpha(1);
					draw_set_font(lang_get_font("font_small"));
					
					var str = this.name;
					if string_length(str) > 50
						str = string_copy(str, 1, 50) + "...";
				
					if this.downloaded
						draw_text_ext_color(xx, yy + 96 - scroll, str, 16, 170, col1, col2, col2, col1, sel.y != -1 && sel.y != i ? 0.25 : 1);
					else
						draw_text_ext(xx, yy + 96 - scroll, str, 16, 170);
				}
				
				xx += 180;
				if i % 3 == 2 && i != array_length(remote_towers) - 1
				{
					xx = xxstart;
					yy += 200;
				}
			}
			draw_reset_clip();
			
			// scroll
			var maxscroll = max(yy + 200 - SCREEN_HEIGHT + 16, 0);
				
			if mouse_wheel_up()
				scroll -= 42;
			if mouse_wheel_down()
				scroll += 42;
			scroll = clamp(scroll, 0, maxscroll);
				
			/*
			draw_set_colour(#222222);
			var x1 = 600 - 28, x2 = 600 - 20;
			var y1 = 28, y2 = SCREEN_HEIGHT - 28;
			x1--;
			y1--;
			x2--;
			y2--;
				
			draw_rectangle(x1, y1, x2, y2, false);
				
			draw_set_color(c_white);
			shader_reset();
			draw_circle(lerp(x1, x2, 0.5), lerp(y1, y2, scroll / maxscroll), 10, false);
			*/
			
			draw_set_alpha(1);
			
			// level info
			var xx = 582;
			var yy = 32;
			
			if sel.y > -1
			{
				var this = remote_towers[sel.y];
				var scale = 0.65;
				var sprw = 530 * scale, sprh = 298 * scale;
				
				draw_set_colour(c_white);
				draw_set_align(fa_center);
				
				// image
				gpu_set_tex_filter(true);
				if this.image_loaded
				{
					scale *= min(530 / sprite_get_width(this.image), 298 / sprite_get_height(this.image));
					draw_sprite_ext(this.image, 0, xx + (530 * 0.65 / 2) - sprite_get_width(this.image) * scale / 2, yy, scale, scale, 0, c_white, 1);
					
					if point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy, xx + sprw, yy + sprite_get_height(this.image) * scale)
					{
						if mouse_check_button_pressed(mb_left)
						{
							state = 2;
							exit;
						}
					}
				}
				gpu_set_tex_filter(false);
				
				yy += sprite_get_height(this.image) * scale;
				yy += 16;
				
				// name
				draw_text_ext(center, yy, this.name, 16, xx * scale);
				yy += string_height_ext(this.name, 16, xx * scale);
				yy += 16;
				
				// RE-download button
				var download_xo = 0, download_wd = 200;
				var download = downloads[sel.y];
				
				if this.downloaded && download_count == 0
				{
					download_xo = -80;
					download_wd = 150;
					
					var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, center - (download_wd / 2) - download_xo, yy, center + (download_wd / 2) - download_xo, yy + 42);
					var col1 = hovering * #222222 + #5000b8, col2 = hovering * #222222 + #1070d0;
					
					if hovering && mouse_check_button_pressed(mb_left)
						fetch_tower_download(sel.y);
					
					draw_rectangle_color(center - (download_wd / 2) - download_xo, yy, center + (download_wd / 2) - download_xo, yy + 42, col1, col2, col2, col1, false);
					draw_text(center - download_xo, floor(yy) + 14, lstr("cyop_update"));
				}
				
				// download button
				var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, center - (download_wd / 2) + download_xo, yy, center + (download_wd / 2) + download_xo, yy + 42);
				var col1 = hovering * #222222 + #5000b8, col2 = hovering * #222222 + #1070d0;
				
				if hovering
				{
					//temp_sel = 0;
					if mouse_check_button_pressed(mb_left) && download == noone && !this.corrupt
					{
						if !this.downloaded
							fetch_tower_download(sel.y);
						else if download_count == 0
						{
							// find index
							for(var i = 0; i < array_length(towers); i++)
							{
								var curr = towers[i];
								if filename_name(filename_dir(curr.file)) == concat(filter == gb_filter.WIP ? "WIP-" : "", this.modid)
								{
									if !file_exists(curr.file)
										curr.corrupt = true;
									if curr.corrupt
										continue;
										
									sel.y = i;
										
									stop_music();
									sound_play(sfx_collectpizza);
										
									menu = 0;
									state = 1;
									break;
								}
							}
						}
					}
				}
				
				if download != noone && download.progress > 0
					draw_rectangle_color(center - (download_wd / 2) + download_xo, yy, center - (download_wd / 2) + download_xo + download.progress * 200, yy + 42, c_green, c_lime, c_lime, c_green, false);
				draw_rectangle_color(center - (download_wd / 2) + download_xo, yy, center + (download_wd / 2) + download_xo, yy + 42, col1, col2, col2, col1, download != noone or this.corrupt or (this.downloaded && download_count != 0));
				
				if state != 1
					draw_sprite_ext(spr_loading, 0, center, yy + 21, 1, 1, current_time / 2, c_white, 1);
				
				var str = lstr("cyop_download");
				if this.downloaded
					str = download_count == 0 ? lstr("cyop_downloaded") : lstr("cyop_downloaded_busy");
				if this.corrupt
					str = lstr("cyop_error");
				if download != noone
				{
					if download.state == 0
						str = lstr("cyop_finding");
					if download.state == 1
						str = lstr("cyop_downloading");
					if download.state == 2
						str = lstr("cyop_extracting");
				}
				tdp_draw_text(center + download_xo, floor(yy) + 14, str);
				tdp_text_commit();
				
				yy += 64;
				
				// counts
				draw_set_colour(c_gray);
				
				var str = embed_value_string(lstr("cyop_levelstats"), [this.views, this.likes, this.posts]);
				draw_text(xx + (530 * 0.65 / 2), yy, str);
				
				if string_pos("\n", str)
					yy += string_height(str) - 16;
				
				if text_button(xx + (530 * 0.65 / 2), yy + 24, lstr("cyop_openbrowser")) == 2
					url_open(this.url);
			}
			
			draw_reset_clip();
			
			// close button
			draw_set_align(fa_center);
			if state == 1 && download_count == 0
			{
				if text_button(center, SCREEN_HEIGHT - 20 - 30, lstr("cyop_close")) == 2
				{
					sel.y = 0;
					image_cleanup();
					remote_towers = [];
					menu = 0;
					state = 0;
					sort_by = 0;
					filter = 0;
					search = "";
					
					exit;
				}
			}
			
			// sort
			draw_set_colour(c_white);
			
			var yy = SCREEN_HEIGHT - 20 - 50;
			if text_button(center, yy, embed_value_string(lstr("cyop_page"), [page])) == 2
			{
				if state == 1 && download_count == 0
				{
					var pag = get_integer(lstr("cyop_gotopage"), page);
					if pag != undefined && pag != page && pag >= 1
					{
						page = pag;
						fetch_remote_towers(page);
					}
				}
			}
			
			if array_length(remote_towers) > 0 && download_count == 0
			{
				if page != 1
				{
					if text_button(center - 60, yy, "<") == 2
					{
						sel.y = -1;
						page--;
						fetch_remote_towers(page);
					}
				}
				if !last_page
				{
					if text_button(center + 60, yy, ">") == 2
					{
						sel.y = -1;
						page++;
						fetch_remote_towers(page);
					}
				}
			}
			//if temp_sel == -1 && state == 1
			//	sel.y = -1;
			
			if sel.y == -1
			{
				if download_count == 0
				{
					draw_set_font(lfnt("creditsfont"));
					var selected = search != "";
					if text_button(center, 90, lstr("cyop_search"), selected ? col1 : c_white, selected ? c_red : c_aqua) == 2
					{
						if search == ""
							search = get_string(lstr("cyop_search_prompt"), "");
						else
							search = "";
						
						page = 1;
						fetch_remote_towers(page);
					}
					
					var yy = 240;
					
					draw_set_font(lfnt("font_small"));
					var selected = sort_by == gb_sort.MostViewed;
					if text_button(center - 80, yy, lstr("cyop_sortviews"), selected ? col1 : c_white, selected ? c_red : c_aqua, 70) == 2
					{
						if sort_by == gb_sort.MostViewed
							sort_by = 0;
						else
							sort_by = gb_sort.MostViewed;
					
						page = 1;
						fetch_remote_towers(page);
					}
					
					var selected = sort_by == gb_sort.MostDownloaded;
					if text_button(center, yy, lstr("cyop_sortdownloads"), selected ? col1 : c_white, selected ? c_red : c_aqua, 70) == 2
					{
						if sort_by == gb_sort.MostDownloaded
							sort_by = 0;
						else
							sort_by = gb_sort.MostDownloaded;
					
						page = 1;
						fetch_remote_towers(page);
					}
					
					var selected = sort_by == gb_sort.MostLiked;
					if text_button(center + 80, yy, lstr("cyop_sortlikes"), selected ? col1 : c_white, selected ? c_red : c_aqua, 70) == 2
					{
						if sort_by == gb_sort.MostLiked
							sort_by = 0;
						else
							sort_by = gb_sort.MostLiked;
					
						page = 1;
						fetch_remote_towers(page);
					}
				
					draw_text_color(center, yy - 20, lstr("cyop_sortby"), c_gray, c_gray, c_gray, c_gray, 1);
					
					yy += 60;
					draw_text_color(center, yy - 20, lstr("cyop_filterby"), c_gray, c_gray, c_gray, c_gray, 1);
					
					var selected = filter == gb_filter.Featured;
					if text_button(center - 40, yy, lstr("cyop_filterfeatured"), selected ? col1 : c_white, selected ? c_red : c_aqua, 70) == 2
					{
						if filter == gb_filter.Featured
							filter = 0;
						else
							filter = gb_filter.Featured;
					
						page = 1;
						fetch_remote_towers(page);
					}
					
					var selected = filter == gb_filter.WIP;
					if text_button(center + 40, yy, lstr("cyop_filterwip"), selected ? col1 : c_white, selected ? c_red : c_aqua, 70) == 2
					{
						if filter == gb_filter.WIP
							filter = 0;
						else
							filter = gb_filter.WIP;
					
						page = 1;
						fetch_remote_towers(page);
					}
				}
				
				var str = download_count > 0 ? (download_count == 1 ? lstr("cyop_wait1") : embed_value_string(lstr("cyop_wait2"), [download_count])) : lstr("cyop_tip");
				draw_text_color(center, 64, str, c_gray, c_gray, c_gray, c_gray, 1);
			}
		}
		break;
}
draw_set_align();
