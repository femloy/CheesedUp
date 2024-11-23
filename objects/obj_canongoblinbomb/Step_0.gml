hsp = image_xscale * 10;
if check_solid(x + hsp, y)
{
	instance_create(x, y, obj_canonexplosion);
	instance_destroy();
}
scr_collide();
