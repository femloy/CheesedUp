/// @description fills baddielist

if in_saveroom()
{
	instance_destroy();
	state = states.victory;
}
else
{
	with (obj_baddie)
	{
		if (arena)
		{
			ds_list_add(other.baddielist, [wave, id]);
			if (wave > other.maxwave)
				other.maxwave = wave;
			maxhp = hp;
			instance_deactivate_object(id);
		}
	}
	with (obj_arenadoor)
	{
		if (objectlist != noone && (array_length(objectlist) - 1) > other.maxwave)
			other.maxwave = array_length(objectlist) - 1;
	}
}
