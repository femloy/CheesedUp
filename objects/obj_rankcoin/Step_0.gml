live_auto_call;

if keyboard_check_pressed(ord("R"))
	event_perform(ev_create, 0);

if floor(image_index) != 0
	image_speed = Approach(image_speed, .2, .01);
else if image_speed <= .2
{
	image_index = 0;
	image_speed = 0;
}

switch state
{
	case 0:
		fade = Approach(fade, 1.5, 0.15);
		if fade >= 1.5
		{
			state = 1;
			t = room_speed * 0.8;
		}
		break;
	case 1:
		fade = Approach(fade, 0, 0.15);
		if --t <= 0
			state = 2;
		break;
	case 2:
		if global.pizzacoin_earned > 0
		{
			if --t <= 0
			{
				sound_play_centered("event:/modded/sfx/pizzacoin");
				t = 10 - min(ceil(global.pizzacoin_earned / 5), 6);
				repeat ceil(global.pizzacoin_earned / 30)
					global.pizzacoin_earned--;
				image_speed = Approach(image_speed, 1, 0.5);
				
				if global.pizzacoin_earned <= 0
					t = room_speed;
			}
		}
		else if image_speed == 0 && --t <= 0
			state = 3;
		break;
	case 3:
		fade = Approach(fade, 1.5, 0.15);
		if fade >= 1.5
		{
			state = 4;
			with instance_create_unique(0, 0, obj_genericfade)
			{
				depth = other.depth - 1;
				persistent = true;
				fade = 1;
				fadein = false;
				color = c_white;
				accel = 0.15;
			}
			with obj_rank
				event_user(0);
		}
		break;
}
