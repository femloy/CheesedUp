if (destroy)
{
	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	if (global.panic && !in_baddieroom())
	{
		add_baddieroom();
		notification_push(notifs.monster_dead, [object_index]);
	}
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	instance_create(x, y, obj_bangeffect);
	shake_camera(3, 3 / room_speed);
	//global.combo++;
	global.enemykilled++;
	global.combotime = 60;
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.spr_dead;
}
