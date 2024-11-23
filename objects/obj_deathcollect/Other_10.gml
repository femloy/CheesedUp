if DEATH_MODE
{
	if image_alpha != 1
		exit;

	global.heattime = 60;
	global.combotime = 60;
	sound_play("event:/modded/sfx/deathcollect");
	instance_destroy();
	with obj_deathmode
	    time_fx += 10;
	create_collect(x, y, sprite_index);

	add_saveroom();
}
