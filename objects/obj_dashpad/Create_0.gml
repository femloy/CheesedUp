image_speed = 0.5;
init_collision();
buffer = 0;
depth = 0;
rail = instance_exists(obj_railparent);

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		sprite_index = spr_dashpad_ss;
		grav = 0;
	}
}

initial_xscale = image_xscale;
if panic_flip && global.panic
	image_xscale *= -1;
