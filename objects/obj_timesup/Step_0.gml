live_auto_call;

if !grounded
	image_speed = 0;
else if floor(image_index) != image_number - 1
	image_speed = 0.35;
else
	image_speed = 0;
scr_collide();

var checkpoint = is_struct(global.checkpoint_data);
if instance_exists(obj_genericfade)
{
	if obj_genericfade.fade >= 1
	{
		if checkpoint
			load_checkpoint();
		else with obj_pause
		{
			roomtorestart = global.leveltorestart;
			event_perform(ev_alarm, 5);
		}
	}
}
else
{
	wait--;
	if do_wait && wait <= 0 && global.leveltorestart != noone && global.leveltorestart != -1
	{
		if obj_player1.key_taunt2
		{
			fmod_event_instance_stop(snd, true);
			with instance_create(0, 0, obj_genericfade)
			{
				persistent = true;
				depth = -1000;
				fade = 0;
			}
		}
		else if obj_player1.key_slap2
		{
			do_wait = false;
			alarm[1] = 1;
			
			obj_player1.state = states.dead;
			obj_player1.y = room_height * 2;
		}
	}
}
