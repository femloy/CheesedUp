if (((obj_player1.character != "N" && !global.swapmode) || (object_index == obj_gustavofollower && global.swapmode) || object_index == obj_stickfollower || object_index == obj_noisefollower || object_index == obj_noisettefollower)
&& global.panic && !global.exitrank && distance_to_object(obj_player1) <= 300 && ds_list_find_index(global.saveroom, id) == -1)
{
	add_saveroom();
	sound_play("event:/sfx/misc/collecttoppin");
	with (instance_create(x, y, obj_exitfollower))
	{
		walkspr = other.walkspr;
		idlespr = other.idlespr;
		if other.object_index == obj_noisettefollower
			sound_play_3d("event:/sfx/noisette/collect", x, y);
		if other.object_index == obj_gustavofollower
			sound_play_3d("event:/sfx/voice/gusok", x, y);
		if other.object_index == obj_stickfollower && obj_player1.character != "N" && !global.swapmode
			sound_play_3d("event:/sfx/voice/mrstick", x, y);
		if other.object_index == obj_snottyexit
			sound_play_3d("event:/sfx/voice/enemyrarescream", x, y);
		if other.object_index == obj_fakepepfollower
			sound_play_3d("event:/sfx/voice/fakepeppositive", x, y);
		if other.object_index == obj_noisefollower && obj_player1.character != "N"
			sound_play_3d("event:/sfx/voice/noisepositive", x, y);
		if other.object_index == obj_vigilantefollower
			sound_play_3d("event:/sfx/voice/vigiintro", x, y);
		if other.object_index == obj_mortfollowerexit
			sound_play_3d("event:/sfx/mort/mortpickup", x, y);
		if other.object_index == obj_peppermanfollower
			sound_play_3d("event:/sfx/voice/peppermansnicker", x, y);
		if other.object_index == obj_geromeexit
			sound_play_3d("event:/sfx/voice/geromegot", x, y);
		if other.object_index == obj_peppermanfollower
			yoffset = 5;
		else if (other.object_index != obj_stickfollower || obj_player1.character == "N")
		{
			yoffset = 0;
			isgustavo = true;
		}
		if other.object_index == obj_snottyexit
			snotty = true;
		else if (other.object_index == obj_gustavofollower || other.object_index == obj_fakepepfollower)
			isgustavo = true;
		if other.use_palette
		{
			use_palette = true;
			paletteselect = other.paletteselect;
			spr_palette = other.spr_palette;
			palettetexture = other.palettetexture;
		}
	}
	instance_destroy();
}
if global.exitrank
	instance_destroy();
image_speed = obj_player1.image_speed;
