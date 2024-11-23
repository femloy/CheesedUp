if (!instance_exists(obj_noiseboss))
{
	instance_destroy(id, false);
	exit;
}
init_collision();
grav = 0.4;
dir = 0;
cooldown = 120;
bounce = 0;
anglespd = 1;
angle = random(360);
depth = obj_noiseboss.depth - 10;
parried = false;
