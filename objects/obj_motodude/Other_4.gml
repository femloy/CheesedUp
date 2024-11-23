var _destroyed = false;
if in_baddieroom()
{
	_destroyed = true;
	instance_destroy();
}
if (escape == 1 && !_destroyed)
{
	instance_deactivate_object(id);
	with (instance_create(x, y, obj_escapespawn))
		baddieID = other.id;
}
