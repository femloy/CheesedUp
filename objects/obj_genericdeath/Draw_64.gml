live_auto_call;

with death
{
	draw_set_alpha(fade * .6);
	draw_set_color(c_black);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);

	var cx = camera_get_view_x(view_camera[0]), cy = camera_get_view_y(view_camera[0]);
	with (obj_player1)
	{
		var xx = x - cx, yy = y - cy, xscale = self.xscale;
		if MOD.Mirror
		{
			xx = SCREEN_WIDTH - xx;
			xscale *= -1;
		}
		
		pal_swap_player_palette(sprite_index, image_index, xscale * scale_xs, yscale * scale_ys, id);
		draw_sprite_ext(sprite_index, image_index, xx, yy, xscale, yscale, image_angle, image_blend, 1);
	}
	pal_swap_reset();
	
	draw_particles();
	
	if other.t >= 220
	{
		var scale = lerp(12, 0, (other.t - 220) / 100);
		draw_sprite_ext(spr_greendemondeath, check_sugary(), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, scale, scale, 0, c_black, clamp((other.t - 220) / 20, 0, 1));
		draw_set_colour(c_black);
		
		if scale > 0
		{
			draw_set_bounds(
				SCREEN_WIDTH / 2 - sprite_get_width(spr_greendemondeath) * scale / 2 + 4,
				SCREEN_HEIGHT / 2 - sprite_get_height(spr_greendemondeath) * scale / 2 + 4,
				SCREEN_WIDTH / 2 + sprite_get_width(spr_greendemondeath) * scale / 2 - 4,
				SCREEN_HEIGHT / 2 + sprite_get_height(spr_greendemondeath) * scale / 2 - 4,
			true);
		
			draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_reset_clip();
		}
		else
			draw_clear(c_black);
	}
}
