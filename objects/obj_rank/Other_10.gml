/// @description offload and go
if global.pizzacoin_earned > 0 && !instance_exists(obj_rankcoin)
{
	with instance_create(0, 0, obj_rankcoin)
		depth = other.depth - 1;
}
else
{
	alarm[1] = 1;
	textures_offload(["hubgroup"]);
}
continue_state = 0;
