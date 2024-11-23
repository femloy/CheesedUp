if SUGARY_SPIRE
{
	// sugary
	if sugary && room == rank_room
	{
		scroll++;
	
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_rankpal, rank, false);
		draw_sprite_tiled(bg_rank_ss, rank, -scroll, scroll);
		pal_swap_reset();
	
		draw_sprite_tiled_ext(bg_rankwait_ss, 0, 0, 0, 1, 1, c_white, rankwait);
	}
}

draw_set_alpha(fadealpha);
draw_set_color(c_white);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);

if !instance_exists(obj_rank)
{
	with obj_player1
	{
		pal_swap_player_palette(sprite_index, image_index, xscale, yscale, id);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	}
	pal_swap_reset();
}
