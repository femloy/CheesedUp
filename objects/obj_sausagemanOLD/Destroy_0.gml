if !in_baddieroom()
{
	obj_tv.image_index = random_range(0, 4);
	add_baddieroom();
	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	if (reset == 0)
	{
		instance_create(x, y, obj_bangeffect);
		if (stomped == 0 && shot == 0)
		{
			if (cigar == 1)
			{
				shake_camera(5, 20 / room_speed);
				create_baddiegibs(x, y);
				create_baddiegibs(x, y);
				create_baddiegibs(x, y);
				with (instance_create(x, y, obj_sausageman_dead))
					cigar = true;
			}
			else
			{
				shake_camera(5, 20 / room_speed);
				create_baddiegibs(x, y);
				create_baddiegibs(x, y);
				create_baddiegibs(x, y);
				instance_create(x, y, obj_sausageman_dead);
			}
		}
		if (stomped == 1 && shot == 0)
		{
			if (cigar == 1)
			{
				with (instance_create(x, y, obj_sausageman_dead))
				{
					shake_camera(5, 20 / room_speed);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					hsp = 0;
					vsp = 0;
					cigar = true;
					sprite_index = spr_sausageman_stomped;
				}
			}
			else
			{
				with (instance_create(x, y, obj_sausageman_dead))
				{
					shake_camera(5, 20 / room_speed);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					hsp = 0;
					vsp = 0;
					sprite_index = spr_sausageman_stomped;
				}
			}
		}
		if (shot == 1 && stomped == 0)
		{
			if (cigar == 1)
			{
				with (instance_create(x, y, obj_sausageman_dead))
				{
					shake_camera(20, 40 / room_speed);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					hsp *= 3;
					vsp *= 3;
					cigar = true;
				}
			}
			else
			{
				with (instance_create(x, y, obj_sausageman_dead))
				{
					shake_camera(20, 40 / room_speed);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					create_baddiegibs(x, y);
					hsp *= 3;
					vsp *= 3;
				}
			}
		}
		global.combo += 1;
		if (global.combo == 1)
			global.collect += 10;
		if (global.combo == 2)
		{
			instance_create(x, y, obj_20);
			global.collect += 20;
		}
		if (global.combo == 3)
		{
			instance_create(x, y, obj_40);
			global.collect += 40;
		}
		if (global.combo >= 4)
		{
			instance_create(x, y, obj_80);
			global.collect += 80;
		}
		global.heattime = 60;
	}
}
