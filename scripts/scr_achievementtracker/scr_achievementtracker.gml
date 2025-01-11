function add_achievement_update(_name, _update_rate, _creation_code, _update_func, _local = true, _savesection = noone, _savename = noone)
{
	var q = 
	{
		name: _name,
		update_rate: _update_rate,
		frames: 0,
		update_func: noone,
		creation_code: noone,
		variables: ds_map_create(),
		unlocked: false
	};
	q.update_func = method(q, _update_func);
	
	if _creation_code != noone
	{
		q.creation_code = method(q, _creation_code);
		q.creation_code();
	}
	
	if _local == false
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		if ini_read_real(_savesection, _savename, false) == true
		{
			//trace(_savename, " already unlocked");
			q.unlocked = true;
			ini_close();
			exit;
		}
		ini_close();
	}
	array_push(obj_achievementtracker.achievements_update, q);
	return q;
}
function add_achievement_notify(_name, _creation_code, _func, _local = true, _savesection = noone, _savename = noone)
{
	var q = 
	{
		name: _name,
		creation_code: noone,
		func: noone,
		unlocked: false,
		variables: ds_map_create()
	};
	q.func = method(q, _func);
	if _creation_code != noone
	{
		q.creation_code = method(q, _creation_code);
		q.creation_code();
	}
	if !_local
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		if ini_read_real(_savesection, _savename, false)
		{
			//trace(_savename, " already unlocked");
			q.unlocked = true;
			ini_close();
			exit;
		}
		ini_close();
	}
	array_push(obj_achievementtracker.achievements_notify, q);
	return q;
}
function notification_push(notif, array)
{
	//trace("Pushing notification: ", notif, " ", array);
	with obj_achievementtracker
		ds_queue_enqueue(notify_queue, [notif, array]);
}
function achievement_add_variable(_name, _value, _save = false, _resettable = false)
{
	var q = 
	{
		init_value: _value,
		value: _value,
		save: _save,
		resettable: _resettable
	};
	ds_map_add(variables, _name, q);
	return q;
}
function achievement_get_variable(_name)
{
	return ds_map_find_value(variables, _name);
}
function achievement_get_all_variables()
{
	var arr = [];
	var key = ds_map_find_first(variables);
	var size = ds_map_size(variables);
	for (var i = 0; i < size; i++)
	{
		array_push(arr, ds_map_find_value(variables, key));
		key = ds_map_find_next(variables, key);
	}
	return arr;
}
function achievement_unlock(_name, _display_name, _sprite, _index = 0)
{
	var b = achievement_get_struct(_name);
	with b
	{
		if !unlocked
		{
			trace("Achievement unlocked! ", _name, " ", _display_name);
			unlocked = true;
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("achievements", name, true);
			obj_savesystem.ini_str = ini_close();
			notification_push(notifs.unlocked_achievement, [name]);
			obj_achievementtracker.alarm[0] = 2;
			ds_queue_enqueue(obj_achievementtracker.unlock_queue, [_sprite, _index]);
		}
	}
	scr_steam_unlock_achievement(_name);
	
	with obj_achievementviewer
		event_perform(ev_other, ev_room_start);
}
function scr_steam_unlock_achievement(_achievement)
{
	/*
	if global.steam_api
	{
		var steamach = ds_map_find_value(global.steam_achievements, _achievement);
		if !is_undefined(steamach)
		{
			trace("Steam achievement unlocked! ", steamach);
			if !steam_get_achievement(steamach)
				steam_set_achievement(steamach);
		}
		else
			trace("Could not find steam achievement! ", _achievement);
	}
	else
		trace("Steam API not initialized!");
	*/
}
function palette_unlock(_achievement, _palettename, _paletteselect, _texture = noone, _character = "P")
{
	if global.sandbox && !array_contains(scr_sandbox_unlocks().palettes, _palettename)
		exit;
	
	ini_open_from_string(obj_savesystem.ini_str_options);
	var _unlocked = ini_read_real("Palettes", _palettename, false);
	ini_write_real("Palettes", _palettename, true);
	obj_savesystem.ini_str_options = ini_close();
	gamesave_async_save_options();
	
	var b = achievement_get_struct(_achievement);
	with b
	{
		if !unlocked && !_unlocked
		{
			unlocked = true;
			with instance_create(0, 0, obj_cheftask)
			{
				achievement_spr = noone;
				sprite_index = spr_newclothes;
				character = _character;
				paletteselect = _paletteselect;
				texture = _texture;
			}
		}
		if _unlocked
			unlocked = true;
	}
}
function achievement_reset_variables(achievement_array)
{
	for (var i = 0; i < array_length(achievement_array); i++)
	{
		var b = achievement_array[i];
		with b
		{
			var size = ds_map_size(variables);
			var key = ds_map_find_first(variables)
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if q.resettable
					q.value = q.init_value;
				key = ds_map_find_next(variables, key);
			}
		}
	}
}
function achievement_save_variables(achievement_array)
{
	for (var i = 0; i < array_length(achievement_array); i++)
	{
		var b = achievement_array[i];
		ini_open_from_string(obj_savesystem.ini_str);
		with b
		{
			var size = ds_map_size(variables);
			var key = ds_map_find_first(variables);
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if q.save
					ini_write_real("achievements_variables", key, q.value);
				key = ds_map_find_next(variables, key);
			}
		}
		obj_savesystem.ini_str = ini_close();
	}
}
function achievement_get_steam_achievements(achievement_array)
{
	/*
	for (var i = 0; i < array_length(achievement_array); i++)
	{
		var b = achievement_array[i];
		ini_open_from_string(obj_savesystem.ini_str);
		with (b)
		{
			if ini_read_real("achievements", name, 0)
				scr_steam_unlock_achievement(name);
		}
		obj_savesystem.ini_str = ini_close();
	}
	*/
}
function achievements_load(achievement_array)
{
	for (var i = 0; i < array_length(achievement_array); i++)
	{
		var b = achievement_array[i];
		with b
		{
			unlocked = ini_read_real("achievements", name, false);
			var size = ds_map_size(variables);
			var key = ds_map_find_first(variables);
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if q.save
					q.value = ini_read_real("achievements_variables", key, q.init_value);
				key = ds_map_find_next(variables, key);
			}
		}
	}
}
function achievement_get_struct(_name)
{
	var l = obj_achievementtracker.achievements_update;
	var b = noone;
	for (var i = 0; i < array_length(l); i++)
	{
		var q = l[i];
		if q.name == _name
		{
			b = q;
			break;
		}
	}
	if b == noone
	{
		l = obj_achievementtracker.achievements_notify;
		for (i = 0; i < array_length(l); i++)
		{
			q = l[i];
			if q.name == _name
			{
				b = q;
				break;
			}
		}
	}
	return b;
}
