function net_pause() {
	// Loy pause stuff fuck you
	with (obj_netclient) {
		paused = true;
		alarm[3] = room_speed;
		
		instance_list = ds_list_create();
		scr_create_pause_image();
		scr_pause_deactivate_objects(false);
	}
}

function net_unpause() {
	with (obj_netclient) {
		paused = false;
		alarm[3] = -1;
		
		if screensprite != noone && sprite_exists(screensprite)
		{
			scr_delete_pause_image();
			screensprite = noone;
		}
		
		scr_pause_activate_objects(false);
		ds_list_destroy(instance_list);
	}
}