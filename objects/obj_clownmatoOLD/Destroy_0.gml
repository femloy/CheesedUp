if !in_baddieroom()
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.deadspr;
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	instance_create(x, y, obj_bangeffect);
	shake_camera(3, 3 / room_speed);
}
