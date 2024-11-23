draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
with (obj_player1)
{
	pal_swap_player_palette(sprite_index, image_index, xscale * scale_xs, yscale * scale_ys, id);
	draw_sprite_ext(sprite_index, image_index, x - cx, y - cy, xscale, yscale, image_angle, image_blend, 1);
}
pal_swap_reset();

draw_particles();

draw_set_alpha(fade2);
draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
