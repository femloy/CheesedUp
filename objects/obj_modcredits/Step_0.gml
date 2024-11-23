live_auto_call;

/*
if keyboard_check_pressed(ord("R")) && DEBUG
{
	fmod_event_instance_stop(song, true);
	con = 0;
	t = 0;
	x = 0;
	y = 0;
	image_index = 0;
	flash = 0;
	add_credits();
}
*/

switch con
{
	case 0:
		if t++ >= 60
		{
			con = 1;
			t = 0;
			
			darkcount = 7;
			dark = false;
			darkbuffer = 5;
			
			sound_play("event:/sfx/ui/lightswitch");
		}
		break;
	
	case 1:
		if darkbuffer > 0
			darkbuffer--;
		else
		{
			dark = !dark;
			if darkcount > 0
			{
				darkcount--;
				if dark
					darkbuffer = 2 + irandom(3);
				else
					darkbuffer = 6 + irandom(5);
				if darkcount <= 0
				{
					dark = false;
					darkbuffer = 40;
				}
			}
			else
			{
				con = 2;
				dark = false;
				fmod_event_instance_play(song);
			}
		}
		break;
	
	case 3:
		scr_menu_getinput();
		y += 0.5;
		if key_down
			y += 3;
		
		if !showtext && (key_jump || key_start)
		{
			showtext = true;
			text_buffer = 120;
		}
		else if showtext && (key_jump || key_start)
		{
			instance_destroy();
			instance_create(0, 0, obj_genericfade);
		}
		
		if --text_buffer <= 0
			showtext = false;
		break;
}
