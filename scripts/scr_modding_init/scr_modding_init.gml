global.mods = [];
global.processing_mod = noone;

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
		return global.processing_mod.mod_root;
	});
	
	// find mods
	var path = exe_folder + "mods";
	var file = file_find_first(path + "/*", fa_directory);
	
	while file != ""
	{
		var mod_root = path + "\\" + file;
		var json_path = mod_root + "/mod.json";
		
		if file_exists(json_path)
		{
			try
			{
				var b = buffer_load(json_path);
				var j = json_parse(buffer_read(b, buffer_text));
				var s = scr_process_mod(j, mod_root);
				array_push(global.mods, s);
			}
			catch (e)
			{
				audio_play_sound(sfx_pephurt, 0, false);
				show_message("The mod " + file + " couldn't load!\n\n" + string(e));
			}
		}
		file = file_find_next();
	}
	file_find_close();
	
	// initialize them
	array_foreach(global.mods, function(_mod, _ix)
	{
		if _mod.enabled
			_mod.init();
	});
}

function scr_process_mod(mod_json, mod_root)
{
	var struct = new Mod(mod_json, mod_root);
	
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
