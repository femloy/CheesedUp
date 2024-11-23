function scr_draw_fuel(bx, by, spr, fuel, slots = 3, pad = 2)
{
	if live_call(bx, by, spr, fuel, slots, pad) return live_result;
	
	static uf_fill = noone;
	static uf_uvs = noone;
	
	if uf_fill == noone
		uf_fill = shader_get_uniform(shd_filling, "fill");
	if uf_uvs == noone
		uf_uvs = shader_get_uniform(shd_filling, "uvs");
	
	var old = spr == spr_fuelHUD or spr == spr_bulletHUD;
	var img = old ? 0 : current_time / 50;
	var wd = sprite_get_width(spr);
	var uvs = sprite_get_uvs(spr, img);
	var uvs0 = sprite_get_uvs(spr, 0);
	
	var xx, _max = max(fuel, slots);
	for(var i = 0; i < _max; i++) // TODO reverse when "old"
	{
		xx = bx + (wd * uvs0[6] + pad) * i;
		if i >= floor(fuel)
		{
			var slice = i == floor(fuel) ? lerp(-0.1, 1.1, frac(fuel)) : 0;
			shader_set(shd_filling);
			shader_set_uniform_f(uf_fill, slice);
			shader_set_uniform_f(uf_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);
			draw_sprite(spr, img, xx, by);
			reset_shader_fix();
		}
		else
			draw_sprite(spr, img, xx, by);
	}
	return xx + (wd * uvs0[6] + pad);
}
