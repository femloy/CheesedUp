if global.hardmode && safe_get(obj_camera, "visible")
{
	var spr = SPRITES[? "spr_heatmeter" + string(global.heatmeter_threshold + 1)];
	if spr != undefined
	{
		var xx = SCREEN_WIDTH / 2, yy = 76;
		var _perc = (global.heatmeter_count / global.heatmeter_threshold_count) - global.heatmeter_threshold;
		
		if global.heatmeter_threshold == global.heatmeter_threshold_max && _perc >= 1
		{
			xx += random_range(-1, 1);
			yy += random_range(-1, 1);
		}
		
		draw_sprite(spr, 0, xx, yy);
		draw_sprite_part(spr, 1, 0, 0, 164 * _perc, 200, xx - 82, yy - 100);
	}
}
