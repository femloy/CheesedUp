event_inherited();
switch (state)
{
	case states.jump:
		if (vsp < 20)
			vsp += grav;
		y += vsp;
		if (y > ystart && vsp > 0)
		{
			y = ystart;
			state = states.normal;
		}
		break;
}

// currently.
if !instance_exists(obj_cyop_loader)
{
	if targetRoom == boss_vigilante
		locked = check_char(["S", "G"]);
	else
		locked = check_char(["S", "G", "V"]);
}
