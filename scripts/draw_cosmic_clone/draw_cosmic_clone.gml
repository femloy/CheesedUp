function draw_cosmic_clone(sprite, image, x, y, xscale, yscale, rot, blend, alpha)
{
	if live_call(sprite, image, x, y, xscale, yscale, rot, blend, alpha) return live_result;
	
	// setup
	static surf = -1;
	static surf_size = [100, 100];
	static color1 = undefined;
	if color1 == undefined
		color1 = shader_get_uniform(shd_mach3effect, "color1");
	static color2 = undefined;
	if color2 == undefined
		color2 = shader_get_uniform(shd_mach3effect, "color2");
	static layers = [spr_cosmicclone_layer1, spr_cosmicclone_layer2, spr_cosmicclone_layer3, spr_cosmicclone_layer4];
	
	if self[$ "cosmic_index"] == undefined
		cosmic_index = 0;
	if self[$ "cosmic_scroll"] == undefined
		cosmic_scroll = array_create(array_length(layers), 0);
	
	// scroll
	cosmic_index = (cosmic_index + 0.1) % sprite_get_number(spr_cosmicclone_layer4);
	for (var i = 0; i < array_length(layers); i++)
		cosmic_scroll[i] = (cosmic_scroll[i] + (i * .1)) % sprite_get_width(layers[i]);
	
	// draw
	var sprw = abs(sprite_get_width(sprite) * xscale), sprh = abs(sprite_get_height(sprite) * yscale);
	var xo = abs(sprite_get_xoffset(sprite) * xscale), yo = abs(sprite_get_yoffset(sprite) * yscale);
	
	if sprw <= 0 or sprh <= 0
		exit;
	
	if xscale < 0
		xo = sprw - xo;
	if yscale < 0
		yo = sprh - yo;
	
	if !surface_exists(surf) or surf_size[0] != sprw or surf_size[1] != sprh
	{
		if surface_exists(surf)
			surface_free(surf);
		surf_size = [sprw, sprh];
		surf = surface_create(surf_size[0], surf_size[1]);
	}
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	shader_set(shd_mach3effect);
	shader_set_uniform_f(color1, 1, 1, 1);
	shader_set_uniform_f(color2, 0, 0, 0);
	draw_sprite_ext(sprite, image, xo, yo, xscale, yscale, rot, blend, alpha);
	shader_reset();
	
	surface_reset_target();
	
	var xx = x - xo, yy = y - yo;
	draw_set_mask_texture(xx, yy, surface_get_texture(surf));
	
	for(var i = 0; i < array_length(layers); i++)
	{
		var wd = sprite_get_width(layers[i]), ht = sprite_get_height(layers[i]);
		
		var x_offset = -cosmic_scroll[i] + (-CAMX * (i * .05)) % wd;
		var y_offset = (-CAMY * (i * .05)) % ht;
		
		if x_offset > 0
			x_offset -= wd;
		if y_offset > 0
			y_offset -= ht;
		
		draw_sprite_stretched(layers[i], cosmic_index, floor(xx + x_offset), floor(yy + y_offset), surf_size[0] - x_offset, surf_size[1] - y_offset);
	}
	 
	draw_reset_clip();
}
