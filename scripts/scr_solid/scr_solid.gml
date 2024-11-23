function scr_solid(_x, _y)
{
	var old_x = x;
	var old_y = y;
	
	// wall
	if check_solid(_x, _y)
		return true;
	
	// flip myself
	x = _x;
	y = _y;
	
	if variable_instance_exists(id, "flip") && flip < 0
		y = old_y - (_y - old_y);
	
	// platform
	var num = instance_place_list(x, y, obj_platform, global.instancelist, false);
	if (num > 0)
	{
		var _collided = false;
		for (var i = 0; i < num; i++)
		{
			var b = ds_list_find_value(global.instancelist, i);
			if (b.image_yscale > 0 && y > old_y) or (b.image_yscale < 0 && y < old_y)
			{
				if (!place_meeting(x, old_y, b) && place_meeting(x, y, b))
					_collided = true;
			}
		}
		ds_list_clear(global.instancelist);
		
		if (_collided)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	
	// platform slopes
	if variable_instance_exists(id, "vsp") && vsp >= 0 && place_meeting(x, y, obj_slope_platform)
	{
		var num = instance_place_list(x, y, obj_slope_platform, global.instancelist, false);
		var _collided = false;
	
		for (i = 0; i < num; i++)
		{
			b = ds_list_find_value(global.instancelist, i);
			if check_slope_platform(b, old_y)
				_collided = true;
		}
		ds_list_clear(global.instancelist);
		
		if (_collided)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	
	// slope
	if (inside_slope(obj_slope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	x = old_x;
	y = old_y;
	return false;
}
function check_solid(_x, _y)
{
	if variable_instance_exists(id, "flip") && flip < 0
		_y = y - (_y - y);
	
	return place_meeting(_x, _y, obj_solid);
}
function check_slope(_x, _y, place = false)
{
	if variable_instance_exists(id, "flip") && flip < 0
		_y = y - (_y - y);
	
	return place ? instance_place(_x, _y, obj_slope_parent) : place_meeting(_x, _y, obj_slope_parent);
}

function inside_slope(slope_object)
{
	var slope = instance_place_list(x, y, slope_object, global.instancelist, false);
	if !slope
		return false;
	
	for(var i = 0; i < slope; i++)
	{
		var arr = slope_bounds(global.instancelist[| i]); // [left, bottom, right, top]
		
		if rectangle_in_triangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1,
		arr[0], arr[1], arr[2], arr[1], arr[2], arr[3])
		{
			ds_list_clear(global.instancelist);
			return true;
		}
	}
	
	ds_list_clear(global.instancelist);
	return false;
}
function check_slope_platform(slope_object, old_y)
{
	var _y = y;
	var slope = instance_place(x, y, slope_object);
	
	if (slope)
	{
		with (slope)
		{
			var object_side = 0;
			var slope_start = 0;
			var slope_end = 0;
			if (image_xscale > 0)
			{
				object_side = other.bbox_right;
				slope_start = bbox_bottom;
				slope_end = bbox_top;
			}
			else
			{
				object_side = other.bbox_left;
				slope_start = bbox_top;
				slope_end = bbox_bottom;
			}
			
			var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			slope = slope_start - round(m * (object_side - bbox_left));
			
			if (other.bbox_bottom >= slope)
			{
				other.y = old_y;
				if other.bbox_bottom <= slope + 2 / abs(m)
				{
					other.y = _y;
					return true;
				}
			}
		}
	}
	
	other.y = _y;
	return false;
}
function scr_solid_slope(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	
	if variable_instance_exists(id, "flip") && flip < 0
		y = old_y - (_y - old_y);
	
	if (inside_slope(obj_slope))
	{
		var inst = instance_place(x, y, obj_slope);
		if (sign(inst.image_xscale) != xscale)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	
	x = old_x;
	y = old_y;
	return false;
}
