with obj_player
{
	if ghostdash && ghostpepper >= 3 && distance_to_object(other) <= 1
		instance_destroy(other);
}
