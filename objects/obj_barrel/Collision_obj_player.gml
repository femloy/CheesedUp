if instance_exists(obj_genericdeath)
	exit;

if (active)
{
	if other.character == "V" or other.character == "G"
	{
		// ignore.
	}
	else if (place_meeting(x, y - 1, other) && other.vsp > 1 && other.state != states.barrel && other.state != states.barrelslide && other.state != states.barreljump && other.state != states.barrelclimbwall)
	{
		with (other)
		{
			create_particle(x, y, part.genericpoofeffect);
			movespeed = hsp;
			state = states.barrel;
			image_index = 0;
			create_transformation_tip(lang_get_value("barreltip"), "barrel");
		}
		active = false;
		alarm[0] = 150;
	}
}
