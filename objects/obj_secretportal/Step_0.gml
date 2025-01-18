if ((sprite_index == spr_close or sprite_index == spr_secretportal_close) && !touched)
{
	image_speed = 0;
	if (active)
	{
		sprite_index = spr_open;
		image_index = 0;
	}
}
else
	image_speed = 0.35;

if (touched && sprite_index == spr_close && (!DEATH_MODE or (!death or instance_exists(obj_deathportalexit))))
{
	with (playerid)
	{
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
		scale_xs = Approach(scale_xs, 0, 0.05);
		scale_ys = Approach(scale_ys, 0, 0.05);
		fallinganimation = 0;
		if (state == states.mach2 || state == states.mach3)
			state = states.normal;
	}
	with (obj_heatafterimage)
		visible = false;
}

if (floor(image_index) >= (image_number - 1))
{
	switch (sprite_index)
	{
		case spr_open:
			sprite_index = spr_idle;
			break;
		
		case spr_close:
			image_index = image_number - 1;
			if touched
			{
				if targetRoom == room && !secret && !instance_exists(obj_randomsecret) && !instance_exists(obj_cyop_loader)
				{
					targetRoom = choose(entrance_secret3, entrance_secret4, entrance_secret5);
					lang_error($"{room_get_name(room)}: undefined secret (REPORT THIS!)");
				}
				
				if DEATH_MODE && death
				{
					with obj_camera
					{
						lock = false;
						limitcam = [camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])];
						panspeed = 40;
					}
					with obj_deathportalexit
					{
						visible = true;
						active = true;
						image_index = 0;
					}
					instance_destroy();
				}
				else if !instance_exists(obj_fadeout)
				{
					with obj_player
					{
						lastTargetDoor = targetDoor;
						targetDoor = "S";
						if other.soundtest
						{
							lastroom_soundtest = room;
							lastroom_secretportalID = other.id;
						}
						if !other.secret
						{
							set_lastroom();
							targetRoom = other.targetRoom;
							secretportalID = other.ID;
						}
						else
						{
							var condition = other.targetRoom != room;
							if instance_exists(obj_cyop_loader)
								condition = false;
							
							if condition && !instance_exists(obj_randomsecret) // it wasn't set
							{
								targetRoom = other.targetRoom;
								set_lastroom();
							}
							else
							{
								targetRoom = lastroom;
								if (room == tower_soundtest || room == tower_soundtestlevel)
								{
									targetRoom = lastroom_soundtest;
									secretportalID = lastroom_secretportalID;
								}
							}
						}
						with obj_randomsecret
						{
							if !selected
							{
								
							}
						}
						
						with obj_randomsecret
						{
							if !selected
							{
								var len = array_length(levels);
								if len > 0
								{
									var num = irandom(len - 1);
									if MOD.Ordered
										num = 0;
									
									selected_level = levels[num];
									selected = true;
									
									array_delete(levels, num, 1);
								}
								else
									selected_level = secret_entrance;
							}
							if selected_level != noone
								other.targetRoom = selected_level;
						}
					}
					if (!secret && !soundtest && !instance_exists(obj_randomsecret))
						add_saveroom();
					
					instance_create(x, y, obj_fadeout);
				}
			}
			break;
	}
}
