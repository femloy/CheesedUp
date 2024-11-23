if instance_exists(obj_genericdeath)
	exit;

if active
{
	if other.character != "N"
	{
		if other.isgustavo && other.brick
		{
			sound_play_3d("event:/sfx/rat/grabeat", x, y);
			other.state = states.ratmountballoon;
			active = false;
			cooldown = 100;
			other.balloonbuffer = 250;
		}
		else if !other.isgustavo
		{
			sound_play_3d("event:/sfx/rat/grab", x, y);
			other.state = states.balloon;
			other.movespeed = other.hsp;
			active = false;
			with other
			{
				if isgustavo
					vsp = -7;
			}
			cooldown = 100;
			other.balloonbuffer = 250;
		}
		create_transformation_tip(lang_get_value("balloontip"), "balloon");
	}
	else
	{
		create_transformation_tip(lang_get_value("balloontipN"), "balloonN");
		sound_play_3d("event:/sfx/rat/grab", x, y);
		other.state = states.balloon;
		other.movespeed = other.hsp;
		other.savedmove = other.xscale;
		active = false;
		cooldown = 100;
		other.balloonbuffer = 100;
		create_particle(x, y, part.genericpoofeffect);
	}
}
