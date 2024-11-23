if grounded
{
	if bounce == 0
	{
		sound_play_3d("event:/sfx/pep/groundpound", x, y);
		shake_camera(3, 5 / room_speed);
		with (instance_create(x, y, obj_explosioneffect))
		{
			sprite_index = spr_groundpoundeffect;
			image_speed = 0.4;
		}
	
		vsp = -6;
		alarm[1] = 15;
		bounce = 1;
	}
	else if bounce == 1
	{
		sound_play_3d("event:/sfx/pep/groundpound", x, y);
		with instance_create(x, y, obj_explosioneffect)
		{
			sprite_index = spr_landcloud;
			image_speed = 0.4;
		}
		bounce = 2;
	}
}
scr_collide();
