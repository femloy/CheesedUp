if (state != states.transition && state != states.actor)
	draw_self();
else if (state == states.transition)
{
	draw_set_alpha(orangealpha);
	with (playerid)
	{
		draw_set_flash(make_colour_rgb(255 * 0.97, 255 * 0.43, 255 * 0.09));
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_reset_flash();
	}
	draw_set_alpha(1);
	with (obj_firemouthflame)
		draw_self();
}
else if (state == states.actor)
{
	draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + SCREEN_WIDTH, camera_get_view_y(view_camera[0]) + SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
	with (playerid)
	{
		shader_set(global.Pal_Shader);
		pal_swap_player_palette(sprite_index, image_index, xscale, yscale, id);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		if (global.noisejetpack)
		{
			cuspal_reset();
			pattern_reset();
			
			pal_swap_set(spr_palette, 2, false);
			draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
		pal_swap_reset();
	}
	with (obj_firemouthflame)
		draw_self();
}
