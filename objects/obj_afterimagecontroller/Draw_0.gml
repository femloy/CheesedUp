for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with b
	{
		if visible
		{
			b = image_blend;
			var a = other.alpha[identifier];
			var shd = false;
			
			gpu_set_blendmode(bm_normal);
			shader_reset();
			
			if identifier == afterimage.firemouth
			{
				a = alpha;
				shd = true;
				draw_set_flash(make_color_rgb(255 * 0.97, 255 * 0.43, 255 * 0.09));
			}
			else if identifier == afterimage.blue
			{
				a = alpha;
				shd = true;
				
				if dark_blend != noone
				{
					shader_set(shd_mach3effect);
					
					shader_set_uniform_f(other.color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
					shader_set_uniform_f(other.color2, color_get_red(dark_blend) / 255, color_get_green(dark_blend) / 255, color_get_blue(dark_blend) / 255);
					
					b = c_white;
				}
				else
					draw_set_flash(b);
			}
			else if identifier == afterimage.enemy or (identifier == afterimage.heatattack && REMIX)
			{
				a = alpha;
				shd = true;
				draw_set_flash(make_color_rgb(233, 47, 0));
			}
			else if identifier == afterimage.fakepep
			{
				a = alpha;
				shd = true;
				draw_set_flash(c_red);
			}
			else if identifier == afterimage.noise
			{
				a = alpha;
				shd = true;
				shader_set(shd_noise_afterimage);
				
				var pal = 1;
				if playerid.paletteselect == 0
					pal = 5;
				noise_aftimg_set_pal(playerid.spr_palette, playerid.paletteselect, pal);
				noise_aftimg_set_pattern(global.palettetexture, 0);
			}
			else if identifier == afterimage.blur
			{
				a = alpha;
				b = get_dark(other.image_blend, obj_drawcontroller.use_dark, true, x, y);
				
				if obj_drawcontroller.use_dark && SUGARY
				{
					shd = true;
					draw_set_flash(b);
				}
				else if instance_exists(playerid)
				{
					shd = true;
					if playerid.object_index == obj_player1 && check_skin(SKIN.cosmic, playerid.character, playerid.paletteselect)
					{
						b = COSMIC_PURPLE;
						draw_set_flash(b);
					}
					else if playerid.object_index == obj_vigibullet
						pal_swap_player_palette();
					else if playerid.usepalette
					{
						var pal = playerid.spr_palette;
						shader_set(global.Pal_Shader);
						pal_swap_set(pal, playerid.paletteselect, false);
					
						if playerid.object_index == obj_player1
							pal_swap_player_palette();
						else if playerid.object_index == obj_swapmodegrab
							pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, playerid.patterntexture);
					}
				}
			}
			else if identifier == afterimage.mach3effect or identifier == afterimage.simple
			{
				if REMIX or global.force_mach_shader
				{
					shader_set(shd_mach3effect);
					shd = true;
					
					shader_set_uniform_f(other.color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
					shader_set_uniform_f(other.color2, color_get_red(dark_blend) / 255, color_get_green(dark_blend) / 255, color_get_blue(dark_blend) / 255);
					
					b = c_white;
				}
				else
				{
					var pal = 0;
					switch obj_player1.spr_palette
					{
						case spr_peppalette: pal = 58; break;
						case spr_noisepalette: pal = 1; break;
					}
						
					if pal > 0
					{
						shd = true;
						pal_swap_set(obj_player1.spr_palette, pal, false);
					}
						
					if b == global.mach_colors[0]
						b = other.mach_color1;
					if b == global.mach_colors[1]
						b = other.mach_color2;
				}
			}
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a);
			if shd
			{
				cuspal_reset();
				pattern_reset();
				pal_swap_reset();
				draw_reset_flash();
			}
		}
	}
}
