live_auto_call;

if !rectangle_in_rectangle(tilelayer.tiles_bounds.x1, tilelayer.tiles_bounds.y1, tilelayer.tiles_bounds.x2, tilelayer.tiles_bounds.y2, CAMX, CAMY, CAMX + CAMW, CAMY + CAMH)
	exit;

if secrettile
{
	var spotlight = global.secrettiles == SECRETTILE_STYLES.spotlight && !instance_exists(obj_fakeplayer);
	shader_set(shd_secrettile);
	var bounds = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
	var alpha = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");
	var remix = shader_get_uniform(shd_secrettile, "u_remix_flag");
	
	var left = camera_get_view_x(view_camera[0]);
	var top = camera_get_view_y(view_camera[0]);
	var right = left + camera_get_view_width(view_camera[0]);
	var bottom = top + camera_get_view_height(view_camera[0]);
	shader_set_uniform_f(bounds, left, top, right, bottom);
	shader_set_uniform_f(alpha, image_alpha);
	shader_set_uniform_f(remix, spotlight);
	
	if spotlight 
	{
		var clip_distance = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_distance");
		var clip_position = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_position");
		var fade_size = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_size");
		var fade_intensity = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_intensity");
		shader_set_uniform_f(clip_distance, global.secrettile_clip_distance);
		shader_set_uniform_f(clip_position, obj_player1.x, obj_player1.y);
		shader_set_uniform_f(fade_size, global.secrettile_fade_size);
		shader_set_uniform_f(fade_intensity, global.secrettile_fade_intensity);
	}
}

tilelayer.Draw();
shader_reset();
