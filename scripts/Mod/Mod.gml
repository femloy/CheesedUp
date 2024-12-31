function Mod(_mod_json, _mod_root) constructor
{
	name = _mod_json[$ "name"] ?? "Unnamed Mod";
	desc = _mod_json[$ "desc"] ?? "Add a \"desc\" value to your mod.json!";
	author = _mod_json[$ "author"] ?? "Unknown";
	version = _mod_json[$ "version"] ?? "1.0";
	
	mod_root = _mod_root;
	enabled = true;
	icon = noone;
	lang_map = noone;
	conditions = scr_load_gml(_mod_root + "/conditions.gml");
	
	code = 
	{
		init: noone,
		cleanup: noone,
		settings: noone
	};
	
	objects =
	{
		
	};
	
	hooks =
	{
		
	};
	
	sprite_cache = [];
	
	set_enabled = function(value)
	{
		enabled = value;
		
		ini_open(mod_root + "/saveData.ini");
		ini_write_real("Mod", "enabled", value);
		ini_close();
	}
	
	init = method(self, function()
	{
		set_enabled(true);
		
		// Loading different FMOD projects is impossible
		/*
		var bank_path = mod_root + "/sound";
		if !directory_exists(bank_path)
			bank_path += "/Desktop";
		for (var file = file_find_first(concat(bank_path, "/*.bank"), 0); file != ""; file = file_find_next())
		{
			var bank = scr_load_bank(concat(bank_path, "/", file));
			if is_string(bank)
				show_message(bank);
			else
			{
				array_push(bank_cache, bank);
				trace(fmod_bank_get_events(bank));
			}
		}
		file_find_close();
		*/
		
		// lang
		lang_map = ds_map_create();
		
		var lang_path = mod_root + "/lang/";
		for (var file = file_find_first(concat(lang_path, "*.txt"), 0); file != ""; file = file_find_next())
		{
			var str = scr_load_file(concat(lang_path, file));
			
			var list = ds_list_create();
			lang_lexer(list, str);
			
			var map = lang_exec(list);
			var lang = map[? "lang"];
			
			if ds_map_exists(lang_map, lang)
				lang_exec(list, lang_map[? lang]);
			else
				ds_map_set(lang_map, lang, map);
			
			ds_list_destroy(list);
		}
		file_find_close();
		
		// prepare objects + constants for them
		for(var object = file_find_first(mod_root + "/objects/*", fa_directory); object != ""; object = file_find_next())
		{
			if asset_get_index(object) != -1
			{
				show_message("Invalid (already taken) object name \"" + object + "\" (from mod \"" + name + "\")");
				continue;
			}
			
			var object_path = mod_root + "/objects/" + object;
			var object_struct = new ModObject(object, object_path, self);
			objects[$ object] = object_struct;
			
			live_variable_add(object, method(object_struct, function()
			{
				return self;
			}));
		}
		file_find_close();
		
		// main code
		code.init = scr_load_gml(mod_root + "/init.gml");
		code.cleanup = scr_load_gml(mod_root + "/cleanup.gml");
		code.settings = scr_load_gml(mod_root + "/settings.gml");
		
		// hooks
		var hook_names = scr_modding_hooks();
		while array_length(hook_names)
		{
			var h = array_pop(hook_names);
			hooks[$ h] = scr_load_gml(concat(mod_root, "/hooks/", h, ".gml"));
		}
		
		// add code to objects
		var object_names = struct_get_names(objects);
		while array_length(object_names)
		{
			var object_struct = objects[$ array_pop(object_names)];
			var object_path = object_struct.path;
			
			for(var gml = file_find_first(object_path + "/*.gml", fa_none); gml != ""; gml = file_find_next())
			{
				var gml_name = filename_change_ext(gml, "");
				object_struct.code[$ gml_name] = scr_load_gml(object_path + "/" + gml);
			}
			file_find_close();
		}
		
		// remove the constants
		var object_names = struct_get_names(objects);
		while array_length(object_names)
			live_variable_delete(array_pop(object_names));
		
		// start
		with global
			scr_modding_process(other, "init");
	});
	
	cleanup = method(self, function()
	{
		// end
		with global
			scr_modding_process(other, "cleanup");
		set_enabled(false);
		
		// banks
		/*
		while array_length(bank_cache)
			fmod_bank_unload(array_pop(bank_cache));
		*/
		
		// lang
		for(var lang = ds_map_find_first(lang_map); lang != undefined; lang = ds_map_find_next(lang_map, lang))
			ds_map_destroy(lang_map[? lang]);
		ds_map_destroy(lang_map);
		
		// init and cleanup
		if code.init != noone
			live_snippet_destroy(code.init);
		if code.cleanup != noone
			live_snippet_destroy(code.cleanup);
		if code.settings != noone
			live_snippet_destroy(code.settings);
		
		// objects
		var object_names = struct_get_names(objects);
		while array_length(object_names)
		{
			var object = objects[$ array_pop(object_names)];
			object.cleanup();
		}
		
		// sprite cache
		var old_sprites = [];
		while array_length(sprite_cache)
		{
			var sprite = array_pop(sprite_cache);
			if is_struct(sprite)
			{
				sprite_assign(sprite.sprite, sprite.old);
				if sprite.free
					array_push(old_sprites, sprite.old);
			}
			else if sprite_exists(sprite)
				sprite_delete(sprite);
		}
		while array_length(old_sprites)
			sprite_delete(array_pop(old_sprites));
	});
}
