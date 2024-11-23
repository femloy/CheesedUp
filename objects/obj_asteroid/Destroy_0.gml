if !in_saveroom()
{
	add_saveroom();
	scr_sound_multiple(global.snd_collect, x, y);
	repeat 2
		sound_play_3d("event:/sfx/misc/breakblock", x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime = 60;
	with obj_camera
		healthshaketime = 30;
	global.collect += 100;
	shake_camera(4, 4 / room_speed);
	with (instance_create(x, y, obj_smallnumber))
		number = string(100);
	notification_push(notifs.levelblock_break, [object_index]);
	var sep = 100;
	repeat (10)
	{
		with (create_debris(irandom_range((x + (sprite_width / 2)) - sep, x + (sprite_width / 2) + sep), irandom_range((y + (sprite_height / 2)) - sep, y + (sprite_height / 2) + sep), spr_meteordebris))
			vsp = irandom_range(-6, -14);
	}
}
