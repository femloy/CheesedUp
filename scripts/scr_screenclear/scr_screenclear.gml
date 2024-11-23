function scr_screenclear()
{
	var ultrawide = SCREEN_WIDTH > 960 or SCREEN_HEIGHT > 540;
	if ultrawide
	{
		var cam_center = clamp(lerp(obj_camera.camx_real, obj_camera.camx_real + CAMW, 0.5), 960 / 2, room_width - 960 / 2);
		var cam_middle = clamp(lerp(obj_camera.camy_real, obj_camera.camy_real + CAMH, 0.5), 540 / 2, room_height - 540 / 2);
		
		with instance_create(cam_center, cam_middle, obj_screenwipe)
			playerid = other.id;
	}
	
	var c = 0, lag = 20;
	with obj_baddie
	{
		if !supertauntable
			continue;
		
		if (!ultrawide ? point_in_camera(x, y, view_camera[0])
		: point_in_rectangle(x, y, cam_center - 960 / 2, cam_middle - 540 / 2, cam_center + 960 / 2, cam_middle + 540 / 2))
		{
			global.style += 5 + floor(global.combo / 5);
			
			hp = -99;
			scr_hitstun_enemy(id, lag);
			
			if elite
			{
				elitehit = -1;
				mach3destroy = true;
			}
			if destroyable
				c++;
			instance_create(x, y, obj_parryeffect);
			repeat 3
			{
				create_slapstar(x, y);
				create_baddiegibs(x, y);
			}
		}
	}
	shake_camera(10, 30 / room_speed);
}