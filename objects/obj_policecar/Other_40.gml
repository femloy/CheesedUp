if (state != states.policetaxi)
	exit;
if (!instance_exists(obj_fadeout))
{
	sound_play("event:/sfx/misc/door");
	with (instance_create(x, y, obj_fadeout))
		roomreset = true;
}
