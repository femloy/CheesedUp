if !_object_exists(content)
	exit;

if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
{
	if array_length(baddieid) < baddie_max
		refresh--;
	
	for (var i = 0; i < array_length(baddieid) - 1; i++)
	{
		if !instance_exists(baddieid[i])
		{
			array_delete(baddieid, i, 1);
			i--;
		}
	}
}

if refresh <= 0
{
	image_speed = 0.35;
	if floor(image_index) == 5
	{
		with _instance_create(x, y - 35, content)
		{
			state = states.stun;
			stunned = 50;
			vsp = -5;
			array_push(other.baddieid, id);
			important = true;
		}
		refresh = 100;
	}
}
