function draw_secrettiles(_secrettile)
{
	with _secrettile
	{
		shader_reset();
		
		var mario = global.secrettiles && !instance_exists(obj_fakeplayer);
		if !bbox_in_camera(view_camera[0], 32) or (image_alpha <= 0 && !mario) or array_length(tiles) == 0
			exit;

		// setup shader
		if ((!mario && image_alpha < 1) or global.secrettile_clip_distance > 0) && !global.performance
		{
			shader_set(shd_secrettile);
			var bounds = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
			var alpha = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");
			var remix = shader_get_uniform(shd_secrettile, "u_remix_flag");
			var alphafix = shader_get_uniform(shd_secrettile, "u_alphafix");
	
			shader_set_uniform_f(bounds, bbox_left, bbox_top, bbox_right, bbox_bottom);
			shader_set_uniform_f(alpha, image_alpha);
			shader_set_uniform_f(remix, mario);
			shader_set_uniform_f(alphafix, 0.0);
			
			if mario
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

		// draw each tile
		if global.performance
			draw_set_alpha(image_alpha);
		
		var f = function(i) {
			draw_tile(i.tileset, i.tile_data, 0, i.x, i.y);
		};
		array_foreach(tiles, f);
		
		draw_set_alpha(1);
		shader_reset();
	}
}