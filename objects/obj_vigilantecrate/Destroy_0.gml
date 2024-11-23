instance_create(x, y, obj_canonexplosion);
repeat (5)
	create_debris(x, y, spr_wooddebris);
if (cow)
{
	with (instance_create(x, y - 21, obj_vigilantecow))
	{
		vsp = -16;
		bounce = 4;
		if (check_solid(x, y))
		{
			while (check_solid(x, y))
			{
				if (x < (room_width / 2))
					x++;
				else
					x--;
			}
		}
	}
}
else
{
	with (instance_create(x, y, obj_junk))
		vsp = -6;
}
sound_play_3d("event:/sfx/pep/groundpound", x, y);
