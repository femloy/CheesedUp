function scr_destroy_tiles(_size, _layer, _spread = 0)
{
	var customlevel = instance_exists(obj_cyop_loader);
	if customlevel
		var lay_id = -1;
	else
		var lay_id = layer_get_id(_layer);
	
	if (lay_id != -1 or customlevel)
	{
		if customlevel
			var map_id = -1;
		else
			var map_id = layer_tilemap_get_id(lay_id);
		
		var w = abs(sprite_width) / _size;
		var h = abs(sprite_height) / _size;
		var ix = sign(image_xscale);
		var iy = sign(image_yscale);
		if (ix < 0)
			w++;
		for (var yy = 0 - _spread; yy < (h + _spread); yy++)
		{
			for (var xx = 0 - _spread; xx < (w + _spread); xx++)
				scr_destroy_tile(x + (xx * _size * ix), y + (yy * _size * iy), map_id);
		}
	}
}
function scr_destroy_tile_arr(_size, _array, _spread = 0)
{
	var customlevel = instance_exists(obj_cyop_loader);
	if customlevel
		scr_destroy_tiles(_size, -1, 0);
	else for (var i = 0, n = array_length(_array); i < n; ++i)
		scr_destroy_tiles(_size, _array[i], _spread);
}
function scr_destroy_tile(x, y, tilemap)
{
	if (tilemap != -1)
	{
		var data = tilemap_get_at_pixel(tilemap, x, y);
		data = tile_set_empty(data);
		tilemap_set_at_pixel(tilemap, data, x, y);
	}
	else if instance_exists(obj_cyop_loader) 
	{
		var xx = floor(x / 32) * 32;
		var yy = floor(y / 32) * 32;
		
		ds_list_add(global.cyop_broken_tiles, $"{xx}_{yy}");
		with obj_cyop_tilelayer
		{
			if !secrettile with tilelayer
			{
				var chunk = chunks[? $"{floor(xx / CYOP_CHUNK_WIDTH)}_{floor(yy / CYOP_CHUNK_HEIGHT)}"];
				if chunk != undefined
					chunk.dirty = true;
			}
		}
	}
}
function scr_solid_line(instance)
{
	if (collision_line(x, y, instance.x, instance.y, obj_solid, false, true) != noone)
		return true;
	if (collision_line(x, y, instance.x, instance.y, obj_slope, false, true) != noone)
		return true;
	return false;
}
function scr_destroy_nearby_tiles()
{
	instance_destroy(instance_place(x + 1, y, obj_tiledestroy));
	instance_destroy(instance_place(x - 1, y, obj_tiledestroy));
	instance_destroy(instance_place(x, y + 1, obj_tiledestroy));
	instance_destroy(instance_place(x, y - 1, obj_tiledestroy));
}

function scr_cutoff()
{
	if global.performance
		exit;
	
	if !global.auto_cutoffs
	{
		scr_cutoff_old();
		exit;
	}
	if place_meeting(x, y, obj_nocutoff)
		exit;
	
	var big = (sprite_width % 64 == 0);
	var smallblock = [0, 0, 0, 0];
	
	with instance_place(x, y + 1, obj_destructibles)
		if (sprite_width % 64 != 0) smallblock[0] = true;
	with instance_place(x + 1, y, obj_destructibles)
		if (sprite_height % 64 != 0) smallblock[1] = true;
	with instance_place(x, y - 1, obj_destructibles)
		if (sprite_width % 64 != 0) smallblock[2] = true;
	with instance_place(x - 1, y, obj_destructibles)
		if (sprite_height % 64 != 0) smallblock[3] = true;
	
	if !collision_point(bbox_left, bbox_bottom, obj_solid, true, true) or !collision_point(bbox_right - 1, bbox_bottom, obj_solid, true, true)
		smallblock[0] = true;
	if !collision_point(bbox_right, bbox_top, obj_solid, true, true) or !collision_point(bbox_right, bbox_bottom - 1, obj_solid, true, true)
		smallblock[1] = true;
	if !collision_point(bbox_left, bbox_top - 1, obj_solid, true, true) or !collision_point(bbox_right - 1, bbox_top - 1, obj_solid, true, true)
		smallblock[2] = true;
	if !collision_point(bbox_left - 1, bbox_top, obj_solid, true, true) or !collision_point(bbox_left - 1, bbox_bottom - 1, obj_solid, true, true)
		smallblock[3] = true;
	
	with obj_cutoffsystem
	{
		// bottom
		var b = big && !smallblock[0], r = (b ? 64 : 32);
		for(var i = 0; i < other.sprite_width / r; i++)
			add_cutoff(other.x + 32 * b + r * i, other.y + other.sprite_height - 1, b, 0);
		
		// right
		var b = big && !smallblock[1], r = (b ? 64 : 32);
		for(var i = 0; i < other.sprite_height / r; i++)
			add_cutoff(other.x + other.sprite_width, other.y + other.sprite_height - 32 * b - r * i, b, 90);
		
		// top
		var b = big && !smallblock[2], r = (b ? 64 : 32);
		for(var i = 0; i < other.sprite_width / r; i++)
			add_cutoff(other.x + other.sprite_width - 32 * b - r * i, other.y + 1, b, 180);
		
		// left
		var b = big && !smallblock[3], r = (b ? 64 : 32);
		for(var i = 0; i < other.sprite_height / r; i++)
			add_cutoff(other.x, other.y + 32 * b + r * i, b, 270);
	}
}

function scr_cutoff_old()
{
	with (instance_place(x, y, obj_cutoff))
		instance_destroy();
	
	var dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]];
	var list = ds_list_create();
	for (var i = 0; i < array_length(dirs); i++)
	{
		var d = dirs[i];
		if (!place_meeting(x + d[0], y + d[1], obj_cutoff))
		{
			
		}
		else
		{
			var num = instance_place_list(x + d[0], y + d[1], obj_cutoff, list, false);
			for (var j = 0; j < ds_list_size(list); j++)
			{
				var b = ds_list_find_value(list, j);
				if (!is_undefined(b) && instance_exists(b))
				{
					with (b)
					{
						if (!place_meeting(x, y, obj_solid))
							instance_destroy();
						else if (other.object_index == obj_tiledestroy || ((object_index != obj_cutoffsmall || other.object_index == obj_secretblock) && (object_index != obj_cutoff || (other.object_index == obj_secretbigblock || other.object_index == obj_secretmetalblock))))
						{
							var a = scr_cutoff_get_angle(b);
							var da = a;
							if (d[0] < 0)
								da = 0;
							else if (d[0] > 0)
								da = 180;
							else if (d[1] < 0)
								da = 270;
							else if (d[1] > 0)
								da = 90;
							if (a == da)
								visible = true;
						}
					}
				}
			}
			ds_list_clear(list);
		}
	}
	ds_list_clear(list);
	ds_list_destroy(list);
}
function scr_cutoff_get_angle(cutoff_instance)
{
	var a = cutoff_instance.image_angle + 90;
	var d = point_direction(0, 0, lengthdir_x(1, a) * cutoff_instance.image_yscale, lengthdir_y(1, a) * cutoff_instance.image_yscale);
	return d;
}
