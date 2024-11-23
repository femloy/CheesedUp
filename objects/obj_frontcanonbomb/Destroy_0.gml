instance_create(x, y, obj_canonexplosion);
if (room != plage_shiptop)
{
	if (check_solid(x, y + 50))
	{
		if (room != tower_escape9)
		{
			repeat (10)
			{
				with (create_debris(x, y, spr_beachsandparticle))
					vsp = random_range(-7, -11);
			}
		}
		else
		{
			repeat (4)
			{
				with (create_debris(x, y, spr_towerblockdebris, true))
					vsp = random_range(-7, -11);
			}
		}
	}
}
