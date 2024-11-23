var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

draw_set_alpha(fade);
draw_rectangle_color(cx, cy, cx + SCREEN_WIDTH, cy + SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);

with debrisid
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

shader_set(global.Pal_Shader);
with obj_player
{
	if visible
		draw_player();
}
shader_reset();

if fade <= 0
	instance_destroy();
