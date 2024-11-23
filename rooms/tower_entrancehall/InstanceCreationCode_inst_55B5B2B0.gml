var lay = layer_get_id("Tiles_LAP");
if check_lap_mode(lapmodes.normal) or check_lap_mode(lapmodes.april) or !global.panic
{
	with instance_create(x, y, obj_solid)
	{
		image_xscale = 2;
		image_yscale = 3;
	}
}
else
	layer_set_visible(lay, false);
instance_destroy(id, false);
