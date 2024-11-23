if !sprite_exists(sprite_index)
	exit;

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

pal_swap_player_palette();
draw_sprite(sprite_index, image_index, x - cx, y - cy);
pal_swap_reset();
