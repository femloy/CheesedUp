live_auto_call;

if (instance_exists(obj_pizzafaceboss_p3intro) || instance_exists(obj_blackoutline) || instance_exists(obj_pizzahead_finalecutsceneN))
	exit;
if (image_alpha <= 0)
	exit;

switch (state)
{
	case states.arenaintro:
		if (arenastate < 3)
		{
			draw_set_alpha(1);
			draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
			if playersprshadow == noone
				draw_sprite_ext(playerspr, image_index, playerx, SCREEN_HEIGHT, 1, 1, 0, c_black, 1);
			else
				draw_sprite_ext(playersprshadow, image_index, playerx, SCREEN_HEIGHT, 1, 1, 0, c_white, 1);
			draw_sprite_ext(bossspr, image_index, bossx, SCREEN_HEIGHT, 1, 1, 0, c_black, 1);
			draw_set_alpha(whitefade);
			draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		else
		{
			draw_sprite_tiled(spr_versusflame, image_index, 0, flamey);
			var c_player = c_white;
			var sx = irandom_range(-introshake, introshake);
			var sy = irandom_range(-introshake, introshake);
			var _index = 0;
			var _xs = 1;
			var _ys = 1;
			if (bossspr == spr_vspizzaface)
			{
				if (glitchbuffer > 0)
				{
					glitchalpha = 1;
					glitchbuffer--;
				}
				else if (glitchalpha > 0)
				{
					glitchalpha -= 0.1;
					_index = 1;
				}
				else
					glitchbuffer = 120;
			}
			
			var px = min(playerx + sx, 0);
			var py = max(SCREEN_HEIGHT + sy, SCREEN_HEIGHT);
			var bx = max(bossx + sy, SCREEN_WIDTH);
			var by = max(SCREEN_HEIGHT + sy, SCREEN_HEIGHT);
			
			pal_swap_player_palette(playerspr, 0, 1, 1);
			draw_sprite_ext(playerspr, image_index, px, py, 1, 1, 0, c_player, 1);
			cuspal_reset();
			
			if (bossspr == spr_vsfakepep || bossspr == spr_vsfakepep2)
			{
				var palinfo = get_pep_palette_info();
				var ps = palinfo.paletteselect;
				pattern_set(global.Base_Pattern_Color, bossspr, 0, _xs, _ys, palinfo.patterntexture);
				pal_swap_set(spr_peppalette, ps, false);
			}
			else
			{
				pattern_reset();
				pal_swap_set(spr_peppalette, 0, false);
			}
			
			draw_sprite_ext(bossspr, 0, bx, by, _xs, _ys, 0, c_player, 1);
			pal_swap_reset();
			
			if (_index == 1)
				draw_sprite_ext(bossspr, _index, bx, by, _xs, _ys, 0, c_player, glitchalpha);
			
			var xx = irandom_range(-1, 1) + sx;
			var yy = irandom_range(-1, 1) + sy;
			
			draw_sprite(vstitle, image_index, xx, yy);
			draw_sprite(vstitleplayer, image_index, xx, yy);
		}
		break;
	
	case states.normal:
	case states.victory:
		if (!global.option_hud)
		{
			
		}
        else
        {
			shader_set(global.Pal_Shader);
			scr_bosscontroller_draw_health(player_hpsprite, player_rowmax, player_columnmax, player_hp, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad, player_index, image_alpha, obj_player1.spr_palette, obj_player1.paletteselect, global.palettetexture);
			
			var bpal = boss_palette;
			var bpalsel = noone;
			var btex = noone;
			if (boss_hpsprite == spr_bossfight_fakepephp)
			{
				var palinfo = get_pep_palette_info();
                bpal = spr_peppalette;
                bpalsel = palinfo.paletteselect;
                btex = palinfo.patterntexture;
			}
			else if (bossspr == spr_vsdoise)
            {
                bpal = spr_noiseboss_palette;
                bpalsel = 1;
            }
			else if (bossspr == spr_vssnotty)
            {
                bpal = spr_vigipalette;
				bpalsel = SKIN_SNOTTY;
            }
			scr_bosscontroller_draw_health(boss_hpsprite, boss_rowmax, boss_columnmax, boss_prevhp, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, boss_index, image_alpha, bpal, bpalsel, btex);
			
			for (var i = 0; i < ds_list_size(particlelist); i++)
			{
				var b = ds_list_find_value(particlelist, i);
				with (b)
				{
					if (type == 0)
					{
						x += hsp;
						y += vsp;
						
						if vsp < 20
							vsp += 0.5;
						
						if y > SCREEN_HEIGHT + sprite_get_height(sprite_index)
						{
							ds_list_delete(other.particlelist, i--);
							continue;
						}
						
						if palettetexture != -4
							pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, palettetexture);
						pal_swap_set(spr_palette, paletteselect, false);
						draw_sprite(sprite_index, image_index, x, y);
					}
					else if (type == 1)
	                {
	                    if (image_index > sprite_get_number(sprite_index) - 1)
	                        ds_list_delete(other.particlelist, i--);
	                    else
	                    {
	                        image_index += image_speed;
	                        pal_swap_set(spr_palette, paletteselect, 0);
	                        draw_sprite(sprite_index, image_index, x, y);
	                    }
	                }
				}
			}
		}
		pal_swap_reset();
		break;
}
