function create_baddiegibsticks(x, y)
{
	if check_lap_mode(LAP_MODES.april)
		return instance_create(x, y, obj_baddiegibsstick);
	return noone;
}
