with obj_player
{
	if (place_meeting(x - 1, y, other) or place_meeting(x + 1, y, other))
	&& state == states.cheeseball
		instance_destroy(other);
}
