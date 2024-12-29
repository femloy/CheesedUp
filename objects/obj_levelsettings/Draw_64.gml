live_auto_call;

if keyboard_check_pressed(ord("R")) && DEBUG
{
	instance_destroy();
	instance_create(0, 0, obj_levelsettings, {level: level});
	exit;
}

image_alpha = Approach(image_alpha, 1, 0.1);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);

var opt_spr = SUGARY ? bg_options_ss : spr_optionsBG;
var opt_img = SUGARY ? 1 : 6;

draw_set_alpha(1);
switch menu
{
	case 0:
		if state != 2
		{
			if state == 0
				draw_set_alpha(image_alpha * .7);
			else
				draw_set_alpha(.7 - anim_t);
			draw_set_colour(c_black);
			draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_set_alpha(1);
		}
		
		if !surface_exists(surface)
			surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
		
		var modifiers_x = -230;
		var replays_x = 230;
		
		if !has_replays
			modifiers_x = 0;
		
		surface_set_target(surface);
		switch state
		{
			case 0: // choosing!
				draw_clear_alpha(c_black, 0);
				
				var img_modifier = sel == 0 ? (floor(image_index / 2) % 2) : 0;
				var img_replay = sel == 1 ? (floor(image_index / 2) % 2) : 0;
				
				draw_sprite_ext(spr_gate_modifiers, img_modifier, SCREEN_WIDTH / 2 + modifiers_x, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 0 ? c_white : #222222, 1);
				lang_draw_sprite_ext(spr_gate_modifiers_text, img_modifier, SCREEN_WIDTH / 2 + modifiers_x, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 0 ? c_white : #222222, 1);
				
				if has_replays
				{
					draw_sprite_ext(spr_gate_replays, img_replay, SCREEN_WIDTH / 2 + replays_x, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 1 ? c_white : #222222, 1);
					lang_draw_sprite_ext(spr_gate_replays_text, img_replay, SCREEN_WIDTH / 2 + replays_x, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 1 ? c_white : #222222, 1);
				}
				
				var info = get_pep_palette_info();
				if info.paletteselect != 1
				{
					pal_swap_player_palette(spr_gate_modifiers, 2 + img_modifier,,,, true);
					draw_sprite_ext(spr_gate_modifiers, 2 + img_modifier, SCREEN_WIDTH / 2 + modifiers_x, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 0 ? c_white : c_dkgray, 1);
					
					if has_replays
					{
						pal_swap_player_palette(spr_gate_replays, 2 + img_replay,,,, true);
						draw_sprite_ext(spr_gate_replays, 2 + img_replay, SCREEN_WIDTH / 2 + 230, SCREEN_HEIGHT / 2 + 30, 1, 1, 0, sel == 1 ? c_white : c_dkgray, 1);
					}
					
					pal_swap_reset();
				}
				break;
			
			case 1: // moving towards center
			case 2: // expanding
				if state == 1
				{
					anim_t = Approach(anim_t, 1, .07);
					var curve = animcurve_channel_evaluate(outback, anim_t);
					
					var yy = lerp(SCREEN_HEIGHT / 2 + 30, SCREEN_HEIGHT / 2, curve);
					var xx = lerp(SCREEN_WIDTH / 2 + (sel == 0 ? modifiers_x : replays_x), SCREEN_WIDTH / 2, curve);
					
					draw_clear_alpha(c_black, (image_alpha * .7) - anim_t);
					
					var spr = sel == 0 ? spr_gate_modifiers : spr_gate_replays;
					var spr_text = sel == 0 ? spr_gate_modifiers_text : spr_gate_replays_text;
					
					draw_sprite_ext(spr, 0, xx, yy, 1, 1, 0, c_white, 1 - anim_t);
					lang_draw_sprite_ext(spr_text, 0, xx, yy, 1, 1, 0, c_white, 1 - anim_t);
					
					pal_swap_player_palette(spr, 2,,,, true);
					draw_sprite_ext(spr, 2, xx, yy, 1, 1, 0, c_white, 1 - anim_t);
					
					draw_sprite_ext(spr_gate_tv, 0, xx, yy, 1, 1, 0, c_white, 1);
					if anim_t >= 1
					{
						sound_play("event:/modded/sfx/diagopen");
						anim_t = 0;
						state = 2;
					}
				}
				else
				{
					var xx = SCREEN_WIDTH / 2, yy = SCREEN_HEIGHT / 2;
					
					draw_clear_alpha(0, 0);
					anim_t = Approach(anim_t, 1, .05);
					
					var max_curve = get_curve_scale() * 4;
					
					var curve = lerp(1, max_curve, animcurve_channel_evaluate(outback, anim_t));
					
					if curve >= max_curve
						state = 3;
				}
				
				if !surface_exists(clip_surface)
					clip_surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
				surface_set_target(clip_surface);
				
				var scale = state == 1 ? 1 : curve;
				
				draw_clear_alpha(c_white, 1);
				gpu_set_blendmode(bm_subtract);
				draw_sprite_ext(spr_gate_tv, 1, xx, yy, scale, scale, 0, c_white, 1);
				gpu_set_blendmode(bm_normal);
				
				surface_reset_target();
				
				draw_clear_alpha(0, 0);
				draw_sprite_tiled_ext(opt_spr, opt_img, ++x, x, 1, 1, bgcolor, 1);
				
				gpu_set_blendmode(bm_subtract);
				draw_surface(clip_surface, 0, 0);
				gpu_set_blendmode(bm_normal);
				
				draw_sprite_ext(spr_gate_tv, 0, xx, yy, scale, scale, 0, c_white, 1);
				break;
			
			case 3:
				state = 0;
				alpha = 0;
				menu = sel == 0 ? 1 : 2;
				
				if menu == 1
					sel = -1;
				break;
		}
		surface_reset_target();
		
		if state == 0
			draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, image_alpha);
		else
			draw_surface(surface, 0, 0);
		break;
	
	case 1:
		if state != 3
			alpha = Approach(alpha, 1, 0.2);
		else
		{
			alpha = Approach(alpha, 0, 0.2);
			if alpha <= 0
			{
				var xx = SCREEN_WIDTH / 2, yy = SCREEN_HEIGHT / 2;
				anim_t = Approach(anim_t, 0, .05);
				
				var max_curve = get_curve_scale() * 5;
				var curve = lerp(0, max_curve, animcurve_channel_evaluate(incubic, anim_t));
				
				if anim_t > 0
				{
					if !surface_exists(clip_surface)
						clip_surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
					surface_set_target(clip_surface);
					
					draw_clear_alpha(c_white, 1);
					gpu_set_blendmode(bm_subtract);
					draw_sprite_ext(spr_gate_tv, 1, xx, yy, curve, curve, 0, c_white, 1);
					gpu_set_blendmode(bm_normal);
					
					surface_reset_target();
					
					draw_clear_alpha(0, 0);
					draw_sprite_tiled_ext(opt_spr, opt_img, ++x, x, 1, 1, bgcolor, 1);
					
					gpu_set_blendmode(bm_subtract);
					draw_surface(clip_surface, 0, 0);
					gpu_set_blendmode(bm_normal);
					
					draw_sprite_ext(spr_gate_tv, 0, xx, yy, curve, curve, 0, c_white, 1);
				}
				else
					instance_destroy();
				exit;
			}
			anim_t = 1;
		}
		draw_sprite_tiled_ext(opt_spr, opt_img, ++x, x, 1, 1, bgcolor, 1);
		
		#region MODIFIERS
		
		// icons
		var xx = SCREEN_WIDTH / 2, yy = screen_center_y(340);
		var sect = 7;
		var sep = 360 / sect;
		var center = round(sect / 2);
		
		reset_blendmode();
		for(var i = 1; i <= sect; i++)
		{
			var this = i - center + sel;
			if this < -1
				continue;
			if this >= array_length(options_array)
				break;
			
			var icon = 0;
			if this == -1
				icon = sprite_get_number(spr_modifier_icons) - 1;
			else
				icon = options_array[this].icon;
			
			var angle = 270 + -sep * center + i * 360 / sect + xo;
	
			var icon_alpha = self.alpha;
			if angle < 270
				icon_alpha *= (angle % 360) / 270;
			else
				icon_alpha *= 1 - ((angle - 270) / 270);
			
			var draw_x = xx + lengthdir_x(200, angle);
			var draw_y = yy + lengthdir_y(32, angle);
			
			var scale = 1;
			if sel == this
			{
				scale = 2 + sin(current_time / 200) / 5;
				draw_x += random_range(-modif_shake, modif_shake);
				draw_y += random_range(-modif_shake, modif_shake);
			}
			
			draw_sprite_ext(spr_modifier_icons, icon, draw_x - 16 * scale + 2, draw_y - 16 * scale + 4, scale, scale, 0, c_black, icon_alpha * .5);
			draw_sprite_ext(spr_modifier_icons, icon, draw_x - 16 * scale, draw_y - 16 * scale, scale, scale, 0, c_white, icon_alpha);
		}
		
		// text
		var opt;
		if sel == -1
		{
			opt = {
				drawfunc: noone,
				opts: [],
				name: lstr("mod_title_ok"),
				desc: lstr("mod_desc_ok")
			}
		}
		else
			opt = options_array[sel];
		var text_x = SCREEN_WIDTH / 2;
		var text_y = screen_center_y(425);
		
		draw_set_colour(c_white);
		tdp_draw_set_font(lang_get_font("bigfont"));
		draw_set_align(fa_center);
		//draw_text_color_new(2 + text_x, 2 + text_y, string_upper(opt.name), 0, 0, 0, 0, 0.25 * alpha);
		draw_set_alpha(alpha);
		
		var c = c_white;
		if array_length(opt.opts) == 2
			c = opt.value ? merge_color(c_lime, c_white, 0.5) : c_white;
		tdp_draw_text_color(text_x, text_y, string_upper(opt.name), c, c, c, c, draw_get_alpha());
		
		var drawer = 0;
		if is_callable(opt.drawfunc) or opt.drawfunc == noone
			drawer = 1;
		else if is_array(opt.drawfunc) or sequence_exists(opt.drawfunc)
			drawer = 2;
		
		tdp_draw_set_font(lang_get_font("font_small"));
		draw_set_color(c_white);
		//draw_text_ext_color(2 + text_x, 2 + text_y + 40, opt.desc, 18, 600, 0, 0, 0, 0, 0.25 * alpha);
		tdp_draw_text_ext(text_x, text_y + 45, opt.desc, 18, 600);
		draw_set_alpha(1);
		
		tdp_text_commit();
		
		// display
		var xx = SCREEN_WIDTH / 2, wd = width;
		var yy = screen_center_y(140), ht = height;
			
		draw_set_alpha(1);
			
		// DRAW IT
		if sel != -1
		{
			if tv_state != 1
			{
				if !surface_exists(global.modsurf)
					global.modsurf = surface_create(wd, ht);
				
				surface_set_target(global.modsurf);
				draw_clear_alpha(c_black, 0.5);
					
				gpu_set_blendmode(bm_normal);
				pal_swap_set(spr_noisepalette, 1, false);
				if is_callable(opt.drawfunc)
					opt.drawfunc(opt.opts[opt.value][1]);
				else
				{
					draw_set_font(lang_get_font("font_small"));
					draw_set_align(fa_center, fa_middle);
					draw_text(width / 2, height / 2, "Missing preview!");
				}
				pal_swap_reset();
				
				surface_reset_target();
			}
			
			if surface_exists(global.modsurf)
			{
				draw_set_mask(xx - wd / 2, yy - ht / 2 - sprite_get_yoffset(spr_modifiertv), spr_modifiertv, 1, true);
				
				draw_surface_ext(global.modsurf, 3 + xx - wd / 2, 3 + yy - ht / 2, 1, 1, 0, 0, 0.25 * alpha);
				draw_surface_ext(global.modsurf, xx - wd / 2, yy - ht / 2, 1, 1, 0, c_white, alpha);
				
				draw_reset_clip();
				draw_sprite_ext(spr_modifiertv, 0, 3 + xx - wd / 2, 3 + yy - ht / 2, 1, 1, 0, c_black, 0.25 * alpha);
				draw_sprite(tv_state ? spr_modifiertv_switch : spr_modifiertv, tv_img, xx - wd / 2, yy - ht / 2);
			}
		}
		
		var align = 3, xx = 16, yy = 16;
		for(var i = 0, n = ds_list_size(active_modifiers); i < n; i++)
		{
			var xdraw = xx, ydraw = yy;
			if i == n - 1
			{
				xdraw += random_range(-modif_shake, modif_shake);
				ydraw += random_range(-modif_shake, modif_shake);
			}
			if align == 0 or align == 1
				xdraw = SCREEN_WIDTH - 32 - xdraw;
			if align == 1 or align == 2
				ydraw = SCREEN_HEIGHT - 32 - ydraw;
	
			draw_sprite_ext(spr_modifier_icons, active_modifiers[| i], xdraw + 3, ydraw + 3, 1, 1, 0, 0, alpha * 0.25);
			draw_sprite_ext(spr_modifier_icons, active_modifiers[| i], xdraw, ydraw, 1, 1, 0, c_white, alpha);
			
			xx += 38;
			if i % 5 == 4
			{
				xx = 16;
				yy += 38;
			}
		}
		
		#endregion
		break;
	
	case 2:
		instance_destroy();
		break;
}

// fader
draw_set_alpha(fadealpha);
draw_set_colour(c_black);

draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
