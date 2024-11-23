if DEATH_MODE
{
	if in_saveroom()
		instance_destroy(id, false);
	with instance_place(x, y, obj_bigcollect)
		instance_destroy(id, false);
	if place_meeting(x, y, obj_secretportal)
		instance_destroy(id, false);
	
	with instance_place(x, y, obj_solid)
	{
		var target_depth = other.depth;
			
		if (object_index == obj_secretbigblock || object_index == obj_secretbigblock2 ||
			object_index == obj_secretblock || object_index == obj_secretblock2 ||
			object_index == obj_secretmetalblock)
		{
		
			// Find the lowest depth (max because depth++ is into the screen)
			for (var i = 0; i < array_length(targettiles); i++)
			{
				if layer_exists(targettiles[i])
					target_depth = max(target_depth, layer_get_depth(targettiles[i]));
			}
		}
		else
			target_depth = max(target_depth, depth);

		other.depth = target_depth + 1;
	}
}
