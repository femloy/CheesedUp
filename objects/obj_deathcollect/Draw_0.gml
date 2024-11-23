if DEATH_MODE
{
	var r = 3;
	if image_alpha == 1
	{
		gpu_set_blendmode(bm_add);
	    for (var i = 0; i < r; i++)
	    {
	        var my_time = ((scr_current_time() / 800) - i) % r;
	        my_time = max(my_time, 0);
	        var set_cos = (my_time / r) * pi;
	        var a = (-cos(set_cos) + 1) / 2;
	        var alp = (1 - a) * 0.33;
	        draw_sprite_ext(sprite_index, image_index, x, y, 1 + a, 1 + a, 0, c_white, alp);
	    }
	    gpu_set_blendmode(bm_normal);
	}
	draw_self();
}
