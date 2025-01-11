function scr_hub_bg_init(parallax_multiplier = 1)
{
	//bgsprite = spr_gate_entranceBG;
	bgsprite_number = sprite_get_number(bgsprite);
	bgsprite_width = sprite_get_width(bgsprite);
	bgsprite_height = sprite_get_height(bgsprite);
	bgspritepos = 0;
	bgspriteposstart = 0;
	bgalpha = 1;
	bg_useparallax = false;
	bgparallax = [0.65 * parallax_multiplier, 0.75 * parallax_multiplier, 0.85 * parallax_multiplier];
	bgparallax2 = [0.1 * parallax_multiplier, 0.15 * parallax_multiplier, 0.2 * parallax_multiplier];
	bgmask_surface = noone;
	bgclip_surface = noone;
}
function scr_hub_bg_reinit(xoffset, yoffset)
{
	bgsprite_number = sprite_get_number(bgsprite);
	bgsprite_width = sprite_get_width(bgsprite);
	bgsprite_height = sprite_get_height(bgsprite);
	
	for (var i = 0; i < bgsprite_number; i++)
	{
		bgspriteposstart[i] = 0;
		bgspritepos[i] = 0;
		
		if bg_useparallax && i < array_length(bgparallax2)
		{
			var p = bgparallax2[i];
			bgspriteposstart[i] = [xoffset - (xoffset * p) - ((SCREEN_WIDTH / 4) * p), yoffset - (yoffset * p) - ((SCREEN_HEIGHT / 4) * p)];
			bgspritepos[i] = [bgspriteposstart[i][0], bgspriteposstart[i][1]];
		}
	}
}
function scr_hub_bg_step()
{
	for (var i = 0; i < array_length(bgspritepos); i++)
	{
		if !bg_useparallax && i < array_length(bgparallax)
			bgspritepos[i] = (bgspritepos[i] - bgparallax[i]) % bgsprite_width;
		else if i < array_length(bgparallax2)
		{
			var p = bgparallax2[i];
			bgspritepos[i][0] = bgspriteposstart[i][0] + ((camera_get_view_x(view_camera[0]) + (SCREEN_WIDTH / 2)) * p) + ((SCREEN_WIDTH / 5) * p);
			bgspritepos[i][1] = bgspriteposstart[i][1] + ((camera_get_view_y(view_camera[0]) + (SCREEN_HEIGHT / 2)) * p);
		}
	}
}
function scr_hub_bg_draw(x, y, sprite, frame, gui = false)
{
	//if live_call(x, y, sprite, frame, gui) return live_result;
	
	if !sprite_exists(sprite)
		exit;
	if !rectangle_in_rectangle(x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, CAMX, CAMY, CAMX + CAMW, CAMY + CAMH)
		exit;
	
	if (bgalpha < 1 or locked)
	{
		var w = sprite_get_width(sprite);
		var h = sprite_get_height(sprite);
		var x1 = sprite_get_xoffset(sprite);
		var y1 = sprite_get_yoffset(sprite);
		
		// sprite - gate
		// frame - 1 (mask)
		// bgsprite
		// bgspritepos
		
		if locked
		{
			if !surface_exists(bgmask_surface)
			{
				bgmask_surface = surface_create(w, h);
				surface_set_target(bgmask_surface);
				
				draw_clear_alpha(0, 0);
				
				draw_set_flash(#682800);
				draw_sprite(sprite, 0, 3 + x1, y1);
				draw_sprite(sprite, 0, -3 + x1, y1);
				draw_sprite(sprite, 0, x1, 2 + y1);
				draw_reset_flash();
				
				surface_reset_target();
			}
			
			var xpad = 38;
			
			draw_set_mask(x, y, sprite, frame);
			draw_sprite_tiled(spr_gate_lock, 0, x - x1, y - y1);
			draw_surface(bgmask_surface, x - x1, y - y1);
			draw_sprite_stretched(spr_gate_lockbase, 0, x - x1 + xpad, bbox_bottom - 18, w - xpad, 19);
		}
		else
		{
			draw_set_mask(x, y, sprite, frame);
			
			for (var i = 0; i < array_length(bgspritepos); i++)
			{
				if (!bg_useparallax)
				{
					var b = bgspritepos[i];
					draw_sprite_tiled(bgsprite, i, b + x - x1, h + y - y1);
				}
				else
				{
					var bx = bgspritepos[i][0];
					var by = bgspritepos[i][1];
					draw_sprite_tiled(bgsprite, i, bx - x1, (by + h) - y1);
				}
			}
		}
		
		draw_reset_clip();
	}
	if (bgalpha > 0 && !locked)
		draw_sprite_ext(sprite, frame, x, y, image_xscale, image_yscale, image_angle, image_blend, bgalpha);
}
