function create_baddiegibsticks(x, y)
{
	if check_lap_mode(lapmodes.april)
		return instance_create(x, y, obj_baddiegibsstick);
	return noone;
}
