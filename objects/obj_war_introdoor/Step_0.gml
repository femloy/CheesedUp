if global.can_timeattack && !global.timeattack && !instance_exists(obj_wartimer)
{
	if !instance_exists(doorID)
	{
		doorID = instance_create(x, y, obj_door);
		with doorID
		{
			sprite_index = spr_blastdooropen;
			targetRoom = other.targetRoom;
		}
	}
	x = -9999;
}
else
{
	instance_destroy(doorID);
	x = xstart;
}
