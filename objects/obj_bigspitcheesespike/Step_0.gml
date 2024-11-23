if (vsp < 12)
	vsp += grav;
image_speed = 0;
x += hsp;
y += floor(vsp);

if scr_solid(x, y)
{
	if !SUGARY
	{
		with (instance_create(x, y - 15, obj_spitcheesespike))
		{
			hsp = -5;
			vsp = -6;
		}
		with (instance_create(x, y - 15, obj_spitcheesespike))
		{
			hsp = 5;
			vsp = -6;
		}
	}
	instance_destroy();
}
