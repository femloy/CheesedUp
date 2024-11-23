with (obj_collect)
{
	if (place_meeting(x, y, other))
	{
		image_speed = 0;
		image_alpha = 0.5;
	}
}
if in_saveroom()
	instance_destroy();
