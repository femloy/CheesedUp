if (global.showcollisions > 1)
{
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_red);
	draw_set_alpha(0.75);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
}
