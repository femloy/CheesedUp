global.mods = [];
global.processing_mod = noone;

function scr_modding_load_mods()
{
	array_foreach(global.mods, function(_mod, _ix)
	{
		if _mod.enabled
			_mod.cleanup();
	});
	
	global.mods = [];
	
	var path = exe_folder + "mods";
	for(var file = file_find_first(path + "/*", fa_directory); file != ""; file = file_find_next())
	{
		var mod_root = path + "\\" + file;
		var json_path = mod_root + "/mod.json";
		
		if file_exists(json_path)
		{
			try
			{
				var b = scr_load_file(json_path);
				var j = json_parse(b);
				var s = scr_process_mod(j, mod_root);
				if s != undefined
					array_push(global.mods, s);
			}
			catch (e)
			{
				audio_play_sound(sfx_pephurt, 0, false);
				show_message("The mod " + file + " couldn't load!\n\n" + string(e));
			}
		}
	}
	file_find_close();
}

function scr_modding_init()
{
	// gmlive setup
	var list = scr_modding_disabled_functions();
	while array_length(list)
	{
		var f = array_pop(list);
		live_function_add(f + "()", function()
		{
			// DUMMY
		});
	}
	
	live_variable_add("MOD_PATH*", function()
	{
		if global.processing_mod != noone
			return global.processing_mod.mod_root;
		else
			return "No mod is loaded";
	});
	
	live_variable_add("MOD_GLOBAL*", function()
	{
		if global.processing_mod != noone
			return global.processing_mod.mod_global;
		else
		{
			trace("WARNING: Used MOD_GLOBAL out of scope");
			return global;
		}
	});
	
	live_variable_add("mouse_x*", function() { return mouse_x_hook(); });
	live_variable_add("mouse_y*", function() { return mouse_y_hook(); });
	live_variable_add("mouse_x_gui*", function() { return mouse_x_gui; });
	live_variable_add("mouse_y_gui*", function() { return mouse_y_gui; });
	live_variable_add("states*", function() { return states; });
	live_variable_add("CAMX*", function() { return CAMX; });
	live_variable_add("CAMY*", function() { return CAMY; });
	live_variable_add("CAMW*", function() { return CAMW; });
	live_variable_add("CAMH*", function() { return CAMH; });
	live_variable_add("REMIX*", function() { return REMIX; });
	live_variable_add("SCREEN_WIDTH*", function() { return SCREEN_WIDTH; });
	live_variable_add("SCREEN_HEIGHT*", function() { return SCREEN_HEIGHT; });
	live_variable_add("MODIFIERS*", function() { return MOD; });
	
	live_function_add("sprite_add(fname, imgnumb, removeback, smooth, xorig, yorig)", function(fname, imgnumb, removeback, smooth, xorig, yorig)
	{
		var sprite = sprite_add(fname, imgnumb, removeback, smooth, xorig, yorig);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, sprite);
		
		return sprite;
	});
	live_function_add("sprite_add_ext(fname, imgnumb, xorig, yorig, prefetch)", function(fname, imgnumb, xorig, yorig, prefetch)
	{
		var sprite = sprite_add_ext(fname, imgnumb, xorig, yorig, prefetch);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, sprite);
		
		return sprite;
	});
	live_function_add("sprite_replace(ind, fname, imgnumb, removeback, smooth, xorig, yorig)", function(ind, fname, imgnumb, removeback, smooth, xorig, yorig)
	{
		var free = false;
		var old = scr_modding_find_og_sprite(ind);
		
		if old == undefined
		{
			free = true;
			old = sprite_duplicate(ind);
		}
		
		sprite_replace(ind, fname, imgnumb, removeback, smooth, xorig, yorig);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, { sprite: ind, old: old, free: free });
	});
	live_function_add("sprite_assign(ind, source)", function(ind, source)
	{
		var free = false;
		var old = scr_modding_find_og_sprite(ind);
		
		if old == undefined
		{
			free = true;
			old = sprite_duplicate(ind);
		}
		
		sprite_assign(ind, source);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, { sprite: ind, old: old, free: free });
	});
	live_function_add("sprite_create_from_surface(id, x, y, w, h, removeback, smooth, xorig, yorig)", function(id, x, y, w, h, removeback, smooth, xorig, yorig)
	{
		var sprite = sprite_create_from_surface(id, x, y, w, h, removeback, smooth, xorig, yorig);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, sprite);
		
		return sprite;
	});
	live_function_add("sprite_duplicate(ind)", function(ind)
	{
		var sprite = sprite_duplicate(ind);
		
		if global.processing_mod != noone
			array_push(global.processing_mod.sprite_cache, sprite);
		
		return sprite;
	});
	
	// initialize them
	scr_modding_load_mods();
	array_foreach(global.mods, function(_mod, _ix)
	{
		if _mod.enabled
			_mod.init();
	});
}

function scr_process_mod(mod_json, mod_root)
{
	var struct = new Mod(mod_json, mod_root);
	if struct.format > MOD_FORMAT
	{
		audio_play_sound(sfx_pephurt, 0, false);
		show_message($"The mod \"{struct.name}\" was made for a later version of Cheesed Up.\nIt cannot be loaded.");
		return undefined;
	}
	
	// options
	ini_open(mod_root + "/saveData.ini");
	struct.enabled = ini_read_real("Mod", "enabled", true);
	ini_close();
	
	// icon
	var icon_path = mod_root + "/icon.png";
	if file_exists(icon_path)
		struct.icon = sprite_add(icon_path, 1, false, false, 0, 0);
	
	return struct;
}

function scr_modding_is_standalone()
{
	return array_length(global.mods) == 0;
}

function scr_modding_cleanup()
{
	
}
