if (police_buffer > 0)
	police_buffer--;
else
	x += hsp;
if (hsp != 0 && police_buffer <= 0)
{
	dust += 1;
	if (dust == 40)
	{
		dust = 0;
		create_particle(x, y + 43, part.cloudeffect);
	}
}

with instance_place(x, y, obj_doorX)
	other.targetDoor = door;
