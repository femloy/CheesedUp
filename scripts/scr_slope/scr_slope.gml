function scr_slope()
{
	live_auto_call;
	
	var f = object_is_ancestor(object_index, obj_player) ? flip : 1;
	y += f;
	
	if inside_slope(obj_slope_parent)
	{
		y -= f;
		return true;
	}
	
	y -= f;
	return false;
}
