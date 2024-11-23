y += vsp;
if (vsp < 20)
	vsp += grav;
if (vsp > 0 && check_solid(x, y + vsp))
{
	while (!check_solid(x, y + sign(vsp)))
		y += sign(vsp);
	instance_destroy();
}
