function Mod(mod_json, mod_root) constructor
{
	name = mod_json[$ "name"] ?? "Unnamed Mod";
	desc = mod_json[$ "desc"] ?? "Add a \"desc\" value to your mod.json!";
	author = mod_json[$ "author"] ?? "Unknown";
	version = mod_json[$ "version"] ?? "1.0";
	
	mod_struct = self; // for scr_modding_process
	self.mod_root = mod_root;
	enabled = true;
	icon = noone;
	options = [];
	lang_map = ds_map_create();
	
	code = 
	{
		init: noone,
		cleanup: noone
	};
	
	objects = 
	{
		
	};
	
	init = function()
	{
		set_enabled(true);
		
		// lang
		var lang_path = mod_root + "/lang/";
		for (var file = file_find_first(concat(lang_path, "*.txt"), 0); file != ""; file = file_find_next())
		{
			var str = buffer_load(concat(lang_path, file));
		
			var list = ds_list_create();
			lang_lexer(list, buffer_read(str, buffer_text));
			buffer_delete(str);
		
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
			var object_struct = new ModObject(object, object_path);
			
			objects[$ object] = object_struct;
			object_struct.mod_struct = self;
			
			live_variable_add(object, method(object_struct, function()
			{
				return self;
			}));
		}
		file_find_close();
		
		// init and cleanup
		var code_path = mod_root + "/init.gml";
		if file_exists(code_path)
		{
			var b = buffer_load(code_path);
			code.init = live_snippet_create(buffer_read(b, buffer_text), "init") ?? noone;
			if code.init == noone
				show_message("Code error for " + code_path + ": \n\n" + live_result);
			buffer_delete(b);
		}
				
		var code_path = mod_root + "/cleanup.gml";
		if file_exists(code_path)
		{
			var b = buffer_load(code_path);
			code.cleanup = live_snippet_create(buffer_read(b, buffer_text), "cleanup") ?? noone;
			if code.cleanup == noone
				show_message("Code error for " + code_path + ": \n\n" + live_result);
			buffer_delete(b);
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
				var gml_path = object_path + "/" + gml;
				
				var b = buffer_load(gml_path);
				var c = live_snippet_create(buffer_read(b, buffer_text), gml_name) ?? noone;
				object_struct.code[$ gml_name] = c;
				
				if c == noone
					show_message("Code error for " + gml_path + ": \n\n" + live_result);
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
	}
	
	cleanup = function()
	{
		// end
		with global
			scr_modding_process(other, "cleanup");
		set_enabled(false);
		
		// lang
		for(var lang = ds_map_find_first(lang_map); lang != undefined; lang = ds_map_find_next(lang_map, lang))
			ds_map_destroy(lang_map[? lang]);
		
		// init and cleanup
		if code.init != noone
			live_snippet_destroy(code.init);
		if code.cleanup != noone
			live_snippet_destroy(code.cleanup);
		
		// objects
		var object_names = struct_get_names(objects);
		while array_length(object_names)
		{
			var object = objects[$ array_pop(object_names)];
			object.cleanup();
		}
	}
	
	set_enabled = function(value)
	{
		enabled = value;
		
		ini_open(mod_root + "/saveData.ini");
		ini_write_real("Mod", "enabled", value);
		ini_close();
	}
}
