if obj_player1.character == "G"
{
	if !instance_exists(obj_gustavoblock)
	{
		var panic = escape;
		if global.panic
			panic = !panic;
		
		with instance_create(x - 14, y + 14, obj_teleporter)
		{
			start = panic ? 0 : 2;
			trigger = noone;
			
			event_perform(ev_other, ev_room_start);
		}
	}
	instance_destroy();
}
