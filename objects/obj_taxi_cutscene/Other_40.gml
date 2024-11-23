if (sprite_index == spr_taximove && pickedup)
{
	with (obj_player)
	{
		set_lastroom();
		obj_camera.chargecamera = 0;
		add_saveroom();
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		image_index = 0;
		mach2 = 0;
		if (!instance_exists(obj_fadeout))
			instance_create(x, y, obj_fadeout);
	}
}
