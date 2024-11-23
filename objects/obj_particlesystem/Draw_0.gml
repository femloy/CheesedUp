if global.performance
	exit;

if !ds_list_empty(global.debris_list)
{
	if obj_drawcontroller.use_dark && SUGARY
		draw_set_flash(get_dark(c_white, true));
	for (var i = 0; i < ds_list_size(global.debris_list); i++)
	{
		var q = global.debris_list[| i];
		if !is_struct(q)
			continue;
		if !point_in_rectangle(q.x, q.y, CAMX - 100, CAMY - 100, CAMX + CAMW + 100, CAMY + CAMH + 100)
			continue;
		
		var b = get_dark(c_white, obj_drawcontroller.use_dark);
		draw_sprite_ext(q.sprite_index, q.image_index, q.x, q.y, 1, 1, q.image_angle, b, q.alpha);
	}
	draw_reset_flash();
}

if !global.option_hud
	exit;
if !ds_list_empty(global.collect_list)
{
	for (i = 0; i < ds_list_size(global.collect_list); i++)
	{
		var b = ds_list_find_value(global.collect_list, i);
		if is_struct(b)
		{
			var cx = camera_get_view_x(view_camera[0]);
			var cy = camera_get_view_y(view_camera[0]);
			if b.spr_palette != noone
			{
				shader_set(global.Pal_Shader);
				pal_swap_set(b.spr_palette, b.paletteselect, false);
			}
			draw_sprite_ext(b.sprite_index, b.image_index, b.x + cx, b.y + cy, 1, 1, 0, c_white, 1);
			pal_swap_reset();
		}
	}
}
