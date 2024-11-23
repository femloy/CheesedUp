/// @description shockwave
with obj_ratblock
{
	if object_index != obj_ratblock && distance_to_object(other) <= 1
		alarm[0] = 5;
}
instance_destroy();
