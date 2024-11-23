var _active = false;
with obj_wirewall
{
	if trigger == other.trigger
		_active = true;
}

active = _active;
if independant
	active = true;

if active
{
	with obj_player
	{
		if distance_to_object(other) <= 1
			scr_hurtplayer(id);
	}
}
else
	instance_destroy();

//image_index = active;
