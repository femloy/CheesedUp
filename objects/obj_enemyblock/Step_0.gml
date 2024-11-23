with obj_baddie
{
	if place_meeting(x + hithsp, y, obj_enemyblock) && thrown
		instance_destroy(instance_place(x + hithsp, y, obj_enemyblock));
	if place_meeting(x, y + hitvsp, obj_enemyblock) && thrown
		instance_destroy(instance_place(x, y + hitvsp, obj_enemyblock));
}
with obj_junk
{
	if place_meeting(x + hsp, y, obj_enemyblock) && thrown
		instance_destroy(instance_place(x + hsp, y, obj_enemyblock));
	if place_meeting(x, y + vsp, obj_enemyblock) && thrown
		instance_destroy(instance_place(x, y + vsp, obj_enemyblock));
}
