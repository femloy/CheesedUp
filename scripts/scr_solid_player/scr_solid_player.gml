function scr_solid_player(_x, _y)
{
	var old_x = x;
	var old_y = y;
	
	x = _x;
	y = _y;
	
	if flip < 0
		y = old_y - (_y - old_y);
	
	// walls
	ds_list_clear(global.instancelist);
	var num = instance_place_list(x, y, obj_solid, global.instancelist, false);
	
	var _collided = false;
	for (var i = 0; i < num; i++)
	{
		var b = ds_list_find_value(global.instancelist, i);
		if instance_exists(b)
		{
			switch b.object_index
			{
				case obj_ghostwall:
					if (state != states.ghost)
						_collided = true;
					break;
				
				case obj_mach3solid:
					if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost) && (state != states.chainsaw || tauntstoredstate != states.mach3) && (state != states.removed_state && state != states.removed_state))
						_collided = true;
					break;
				
				default:
					_collided = true;
					break;
			}
			
			var par = object_get_parent(b.object_index);
			if par == obj_destructibles || par == obj_bigdestructibles || par == obj_deadjohnparent || par == obj_destroyable3 || par == obj_destroyable
			{
				if vsp >= 0 && (state == states.freefall || state == states.ratmountbounce || state == states.ratmountgroundpound)
				{
	                _collided = false;
	                instance_destroy(b);
					continue;
				}
				if !b.collision
					_collided = false;
            }
		}
		if _collided
			break;
	}
	ds_list_clear(global.instancelist);
	
	if _collided
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	// platforms
	if state != states.ladder && state != states.ratmountladder && place_meeting(x, y, obj_platform)
	{
		var num = instance_place_list(x, y, obj_platform, global.instancelist, false);
		var _collided = false;
		for (var i = 0; i < num; i++)
		{
			var b = ds_list_find_value(global.instancelist, i);
			if (b.image_yscale > 0 && y > old_y) or (b.image_yscale < 0 && y < old_y)
			{
				if (!place_meeting(x, old_y, b) && place_meeting(x, y, b))
				{
	                if (b.object_index == obj_cottonplatform_tiled)
                        _collided = (state == states.removed_state || state == states.removed_state);
					else
						_collided = true;
				}
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
	if vsp >= 0 && state != states.Sjump && state != states.ladder && state != states.ratmountladder && place_meeting(x, y, obj_slope_platform)
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
	
	// grindrails
	if (y > old_y && state == states.grind && !place_meeting(x, old_y, obj_grindrail) && place_meeting(x, y, obj_grindrail))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	// slopes
	if (inside_slope(obj_slope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	// grindrail slopes
	if (state == states.grind && inside_slope(obj_grindrailslope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	x = old_x;
	y = old_y;
	return false;
}
function check_slope_pos(new_x, new_y, slope_obj = obj_slope)
{
	var xx = x, yy = y;
	x = new_x;
	y = new_y;
	var ret = inside_slope(slope_obj);
	x = xx;
	y = yy;
	return ret;
}
