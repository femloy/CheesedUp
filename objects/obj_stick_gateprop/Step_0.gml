y = Approach(y, y_to, 2);
x = xstart;
if (y == y_to)
{
	if (room != tower_5)
	{
		with (instance_create(x, y, obj_bossdoor))
		{
			sprite_index = other.sprite_index;
			bgsprite = other.bgsprite;
			targetRoom = other.targetRoom;
			group_arr = other.group_arr;
			event_perform(ev_other, ev_room_start);
		}
	}
	else
	{
		with (instance_create(x, y, obj_door))
		{
			sprite_index = spr_pizzafacedoor;
			targetRoom = other.targetRoom;
		}
	}
	instance_destroy();
}
shake_camera(3, 5 / room_speed);
sound_instance_move(snd, x, y);
