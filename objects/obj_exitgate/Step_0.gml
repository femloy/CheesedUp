if (global.panic || random_secret || (instance_exists(obj_wartimer) && room != war_1)) && room != sucrose_1
&& !(place_meeting(x, y, obj_player1) && obj_player1.state == states.comingoutdoor)
{
	if global.modifier_failed or (global.leveltosave == "dragonlair" && !global.giantkey)
	{
		if uparrow
		{
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			
			uparrow = false;
			instance_destroy(uparrowID);
		}
		
		if SUGARY_SPIRE && sugary
			sprite_index = spr_sugarygateclosed;
		else
			image_index = 0;
	}
	else
	{
		if SUGARY_SPIRE && sugary
			sprite_index = spr_sugarygateopen;
		else
			image_index = 1;
	
		if !uparrow
		{
			uparrowID = scr_create_uparrowhitbox();
			uparrow = true;
		}
	}
}
else if (uparrow)
{
	uparrow = false;
	instance_destroy(uparrowID);
}
if drop && (global.panic or (SUGARY_SPIRE && sugary))
{
	if SUGARY_SPIRE && sugary
	{
		// sucrose snowstorm gate
		if !scr_solid(x, y + sign(vsp))
	    {
	        y += vsp;
	        vsp += grav;
	    }
	    if y >= drop_y
	    {
	        y = drop_y;
	        drop_state = states.idle;
	        sound_play_3d("event:/sfx/pep/groundpound", x, y);
	        shake_camera(15, 30 / room_speed);
			
			drop = false;
	    }
	}
	else
	{
		if (dropstate == states.grabbed)
		{
			sprite_index = global.blockstyle != blockstyles.old ? spr_exitgategrabbed : spr_exitgategrabbed_old;
			if (snd == 0)
			{
				sound_play_3d("event:/sfx/pep/hitwall", x, y);
				snd = true;
			}
		}
		else
			sprite_index = global.blockstyle != blockstyles.old ? spr_exitgate : spr_exitgate_old;
	
		switch (dropstate)
		{
			case states.normal:
				if (distance_to_object(obj_player1) < 300)
				{
					dropstate = states.hook;
					handsprite = spr_grabbiehand_fall;
					hand_y = camera_get_view_y(view_camera[0]) - 100;
				}
				break;
		
			case states.hook:
				if (hand_y < (y - 128))
					hand_y += 6;
				else
				{
					handsprite = spr_grabbiehand_catch;
					handindex = 0;
					dropstate = states.grabbed;
				}
				break;
		
			case states.grabbed:
				depth = 150;
				var _ty = drop_y - 100;
				y = Approach(y, _ty, 3);
				hand_y = y - 128;
				if (y == _ty && distance_to_object(obj_player1) < 200)
				{
					dropstate = states.fall;
					handindex = 0;
					handsprite = spr_grabbiehand_release;
					vsp = 0;
				}
				break;
		
			case states.fall:
				if (vsp < 20)
					vsp += grav;
				y += vsp;
				if (y >= drop_y)
				{
					depth = 50;
					sound_play_3d("event:/sfx/pep/groundpound", x, y);
					y = drop_y;
					dropstate = states.idle;
					handsprite = spr_grabbiehand_idle;
					shake_camera(5, 3 / room_speed);
				}
				break;
		
			case states.idle:
				hand_y -= 6;
				break;
		}
		if (handsprite == spr_grabbiehand_release && floor(handindex) == (sprite_get_number(handsprite) - 1))
			handindex = sprite_get_number(handsprite) - 1;
		handindex += 0.35;
	}
}
if (sprite_index == spr_sugarygateclosing && floor(image_index) == (image_number - 1))
    sprite_index = spr_sugarygateclosed;
