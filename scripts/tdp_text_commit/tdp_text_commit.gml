function tdp_text_commit(x = 0, y = 0, w = SCREEN_WIDTH, h = SCREEN_HEIGHT, gui = true)
{
	if global.tdp_text_enabled && !ds_queue_empty(global.tdp_text_queue)
	{
		draw_set_alpha(1);
		
		if !surface_exists(global.tdp_text_surface)
			global.tdp_text_surface = surface_create(w, h);
		else
			resize_surface_if_resized(global.tdp_text_surface, w, h);
		
		surface_set_target(global.tdp_text_surface);
		draw_clear_alpha(0, 0);
		while !ds_queue_empty(global.tdp_text_queue)
		{
			var action = ds_queue_dequeue(global.tdp_text_queue);
			switch action.type
			{
				case tdp_text.halign:
					draw_set_halign(action.value);
					break;
				case tdp_text.valign:
					draw_set_valign(action.value);
					break;
				case tdp_text.font:
					draw_set_font(action.value);
					break;
				case tdp_text.text:
					if action.w != -1
						draw_text_ext_transformed_color(action.x - x, action.y - y, action.text, action.sep, action.w, action.xscale, action.yscale, action.angle, action.c1, action.c2, action.c3, action.c4, action.image_alpha);
					else
						draw_text_transformed_color(action.x - x, action.y - y, action.text, action.xscale, action.yscale, action.angle, action.c1, action.c2, action.c3, action.c4, action.image_alpha);
					break;
			}
		}
		surface_reset_target();
		shader_set(shd_outline);
		var _tex = surface_get_texture(global.tdp_text_surface);
		var _w = texture_get_texel_width(_tex);
		var _h = texture_get_texel_height(_tex);
		shader_set_uniform_f(global.tdp_text_shd_size, _w, _h);
		shader_set_uniform_f(global.tdp_text_shd_color, 0, 0, 0);
		var uvs = texture_get_uvs(_tex);
		shader_set_uniform_f(global.tdp_text_shd_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);
		draw_surface(global.tdp_text_surface, x, y);
		if gui
			reset_shader_fix();
		else
			shader_reset();
	}
}
