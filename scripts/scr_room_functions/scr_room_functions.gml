function room_get_tile_layers()
{
	with obj_persistent
	{
		if !array_length(room_tiles)
			event_user(0);
		return room_tiles;
	}
}
function room_get_bg_layers()
{
	with obj_persistent
	{
		if !array_length(room_bgs)
			event_user(0);
		return room_bgs;
	}
}

// dynamic layer workarounds
#macro layer_create_base layer_create
#macro layer_create layer_create_fix
#macro layer_get_name_base layer_get_name
#macro layer_get_name layer_get_name_fix

function layer_create_fix(depth, name = "")
{
	var lid = layer_create_base(depth, name);
	with obj_persistent
	{
		if name != "" && lid != -1
			ds_map_add(dynamic_layers, string(lid), name);
	}
	return lid;
}
function layer_get_name_fix(layer_id)
{
	var name = layer_get_name_base(layer_id);
	with obj_persistent
	{
		if name == ""
		{
			name = ds_map_find_value(dynamic_layers, string(layer_id));
			if name == undefined
				return "";
		}
	}
	return name;
}

#macro layer_tilemap_create_base layer_tilemap_create
#macro layer_tilemap_create layer_tilemap_create_fix
#macro layer_background_create_base layer_background_create
#macro layer_background_create layer_background_create_fix
#macro layer_tilemap_get_id_base layer_tilemap_get_id
#macro layer_tilemap_get_id layer_tilemap_get_id_fix
#macro layer_background_get_id_base layer_background_get_id
#macro layer_background_get_id layer_background_get_id_fix

function layer_tilemap_create_fix(layer_id, x, y, tileset, width, height)
{
	var lid = layer_tilemap_create_base(layer_id, x, y, tileset, width, height);
	with obj_persistent
	{
		if lid != -1
			ds_map_add(dynamic_layers, concat("tm-", string(layer_id)), lid);
	}
	return lid;
}
function layer_background_create_fix(layer_id, sprite)
{
	var lid = layer_background_create_base(layer_id, sprite);
	with obj_persistent
	{
		if lid != -1
			ds_map_add(dynamic_layers, concat("bg-", string(layer_id)), lid);
	}
	return lid;
}
function layer_tilemap_get_id_fix(layer_id)
{
	var lid = layer_tilemap_get_id_base(layer_id);
	with obj_persistent
	{
		if lid == -1
		{
			lid = ds_map_find_value(dynamic_layers, concat("tm-", string(layer_id)));
			if lid == undefined
				return -1;
		}
	}
	return lid;
}
function layer_background_get_id_fix(layer_id)
{
	var lid = layer_background_get_id_base(layer_id);
	with obj_persistent
	{
		if lid == -1
		{
			lid = ds_map_find_value(dynamic_layers, concat("bg-", string(layer_id)));
			if lid == undefined
				return -1;
		}
	}
	return lid;
}
