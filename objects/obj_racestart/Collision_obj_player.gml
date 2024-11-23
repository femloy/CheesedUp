if (!start && !in_saveroom())
{
	start = true;
	sound_play_3d("event:/sfx/misc/racestart", x, y);
	with (obj_horsey)
	{
		hsp = other.hsp * other.spd;
		vsp = other.vsp * other.spd;
		spd = other.spd;
		with (instance_create(x, y, obj_objecticontracker))
		{
			objectID = other.id;
			sprite_index = spr_icon_horsey;
		}
	}
	with (obj_raceend)
		start = true;
	sprite = spr_horsey_start2;
	start_index = 0;
	global.horse = true;
}
