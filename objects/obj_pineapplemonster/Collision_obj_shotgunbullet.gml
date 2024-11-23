instance_destroy();
repeat (3)
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5);
		vsp = random_range(-10, 10);
	}
}
sound_play_3d("event:/sfx/enemies/kill", x, y);
instance_create(x, y, obj_bangeffect);
shake_camera(3, 3 / room_speed);
if !in_baddieroom()
{
	add_baddieroom();
	add_saveroom(id, global.escaperoom);
	//global.combo++;
	global.enemykilled++;
}
global.combotime = 60;
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = spr_monsterpineapple_dead;
