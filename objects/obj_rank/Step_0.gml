live_auto_call;

if floor(image_index) == image_number - 1
{
	if sprite_index == spr_rankNPendstart
		image_index = image_number - 3;
	else
	{
		if sprite_index == spr_rankVPend && image_speed > 0
		{
			sound_play_centered(sfx_killenemy);
			sound_play_centered(sfx_shotgunshot);
			
			sprite_index = spr_blackbars;
			x = 0;
			y = 0;
			image_xscale = 960 / 64;
			image_yscale = 540 / 64;
		}
		if sprite_index == spr_rankNPend && image_speed != 0
		{
			shake_camera(2, 3 / room_speed);
			sound_play_3d("event:/sfx/pep/groundpound", x, room_height);
		}
		image_speed = 0;
	}
}
if sprite_index == spr_rankVP
{
	if floor(image_index) == 33 && image_speed == 0.5
	{
		image_speed = 0.35;
		
		shake_camera(6, .1);
		sound_play_centered(sfx_killingblow);
		sound_play_centered(sfx_explosion);
	}
}

if continue_state == 1
{
	if !instance_exists(obj_transfotip)
	{
		with create_transformation_tip(lstr("rankcontinue"), noone, true, true)
		{
			alarm[1] = -1;
			fadeout_speed = 0.2;
		}
	}
	
	scr_menu_getinput();
	if key_jump or key_start
		continue_state = 2;
}

var do_cool_fade = REMIX && global.pizzacoin_earned <= 0;
if do_cool_fade && !do_wait
{
	if alarm[0] <= 8 && alarm[0] > -1
		continue_state = 2;
}
if continue_state == 2
{
	with obj_transfotip
		fadeout = true;
	if do_cool_fade
	{
		with instance_create_unique(0, 0, obj_genericfade)
		{
			depth = other.depth - 10;
			persistent = true;
			fade = 0;
			color = c_white;
			accel = 0.15;
		}
		if !obj_genericfade.fadein && obj_genericfade.fade < 1
		{
			obj_genericfade.fade = 1.2;
			event_user(0);
		}
	}
	else
		event_user(0);
	alarm[0] = -1;
}

if brown
{
	if sprite_index == spr_rankVP
	{
		image_index = 3;
		image_speed = 0.35;
		sprite_index = spr_rankVPend;
	}
	
	brownfade = Approach(brownfade, 1, 0.07);
	if brownfade == 1 && sprite_index == spr_rankNP
	{
		sprite_index = spr_rankNPendstart;
		image_index = 0;
		image_speed = 1;
		alarm[4] = 60;
	}
	
	switch toppin_state
	{
		case states.jump:
			if brownfade < 1
				break;
				
			var spd = 20;
			var yy = (room_height - 62);
			toppin_y[toppin_index] -= spd;
			toppin_yscale[toppin_index] = 1.2;
				
			if toppin_y[toppin_index] <= yy
			{
				if toppin[toppin_index] == 1
				{
					createmoney[toppin_index] = 1;
					if toppinvisible
						sound_play_3d("event:/sfx/misc/kashing", (room_width / 2), (room_height / 2));
				}
				if toppinvisible
					sound_play_3d("event:/sfx/misc/toppingot", (room_width / 2), (room_height / 2));
				toppin_y[toppin_index] = yy;
				toppin_state = states.transition;
				brown = 1;
			}
			break;
			
		case states.transition:
			toppin_yscale[toppin_index] = Approach(toppin_yscale[toppin_index], 1, 0.1);
			if toppin_yscale[toppin_index] == 1
			{
				toppin_index++;
				if toppin_index >= array_length(toppin)
				{
					toppin_state = states.normal;
					alarm[3] = 40;
				}
				else
					toppin_state = states.jump;
			}
			break;
	}
}
if instance_exists(obj_treasureviewer)
	visible = false;
