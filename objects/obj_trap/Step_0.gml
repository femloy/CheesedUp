with (obj_trapghost)
{
	if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold
	&& (state == states.normal or !instance_exists(trapid)
	or ((point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y)
	or (other.object_index == obj_anchortrap && state == states.normal && trapid.object_index == obj_anchortrap))
	&& trapid.object_index != obj_tvtrap)))
	{
		state = states.transition;
		trapid = other.id;
		fmod_event_instance_play(snd_move);
	}
}
