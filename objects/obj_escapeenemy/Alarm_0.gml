add_baddieroom();
with (instance_create(x, y, content))
{
	image_xscale = other.image_xscale;
	instance_create(x, y, obj_pizzaportalfade);
}
instance_destroy();
