instance_destroy(other);
if sprite_index == spr_cheesedragon_hurt or sprite_index == spr_cheesedragon_goingup
	exit;

if !lastform
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	
	add_baddieroom();
	sprite_index = spr_cheesedragon_hurt;
	image_index = 0;
	alarm[0] = -1;
	repeat (5)
		create_baddiegibs(x, y);
	repeat (5)
		create_slapstar(x, y);
	shake_camera(10, 30 / room_speed);
	global.combotime = 60;
}
else
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	
	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = spr_cheesedragon_hurt;
		image_index = 4;
	}
	repeat (5)
		create_baddiegibs(x, y);
	repeat (5)
		create_slapstar(x, y);
	shake_camera(10, 30 / room_speed);
	global.combotime = 60;
	instance_destroy();
}
