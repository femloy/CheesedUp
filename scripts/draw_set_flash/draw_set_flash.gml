//global.__FLASH_BLENDMODE = [bm_src_alpha, bm_inv_src_alpha];
//global.__FLASH_SHADER = -1;

function draw_set_flash(col = (REMIX ? c_white : merge_colour(c_red, c_white, 0.9)))
{
	//global.__FLASH_BLENDMODE = gpu_get_blendmode_ext();
	//global.__FLASH_SHADER = shader_current();
	
	//if global.__FLASH_BLENDMODE[0] == bm_one
	//	gpu_set_blendmode(bm_normal);
	//shader_reset();
	gpu_set_fog(true, col, 0, 1);
}
function draw_reset_flash()
{
	if gpu_get_fog()[0]
	{
		//gpu_set_blendmode_ext(global.__FLASH_BLENDMODE[0], global.__FLASH_BLENDMODE[1]);
		//shader_set(global.__FLASH_SHADER);
	
		gpu_set_fog(0, 0, 0, 0);
	}
}
