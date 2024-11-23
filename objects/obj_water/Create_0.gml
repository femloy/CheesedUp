live_auto_call;

depth = 0;
my_solid = instance_create(x, y, obj_platform);
with my_solid
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}
