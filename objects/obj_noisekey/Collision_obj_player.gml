if other.instakillmove || other.state == states.handstandjump
{
	with other
	{
		hsp = 0;
		vsp = 0;
		flash = true;
		sound_play_3d("event:/sfx/enemies/kill", x, y);
		state = states.gottreasure;
		with instance_create(x, y - 50, obj_noisebigkey)
			alarm[0] = 150;
	}
	shake_camera(5, 10 / room_speed);
	repeat 2
	{
		with create_debris(x, y, spr_slapstar)
			vsp = -irandom_range(5, 11);
	}
	repeat 2
	{
		with create_debris(x, y, spr_baddiegibs)
			vsp = -irandom_range(5, 11);
	}
	sound_play("event:/sfx/misc/secretfound");
	instance_destroy();
	with instance_create(x, y, obj_sausageman_dead)
		sprite_index = spr_playerN_hurtjump;
	if gamesave_open_ini()
	{
		ini_write_real("w3stick", "noisekey", true);
		gamesave_close_ini(true);
		gamesave_async_save();
	}
}
