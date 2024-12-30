function scr_modding_process(object, code, args = [], code_struct_name = "code")
{
	if !is_instanceof(object, ModObject) && !is_instanceof(object, Mod)
	{
		show_message("ERROR: object is " + string(instanceof(object)));
		return false;
	}
	
	if is_instanceof(object, Mod)
		global.processing_mod = object;
	else
	{
		global.processing_mod = object.parent_mod;
		
		if !is_instanceof(global.processing_mod, Mod)
		{
			show_message("ERROR: object.parent_mod is " + string(instanceof(global.processing_mod)));
			return false;
		}
	}
	
	if object[$ code_struct_name] == undefined
	{
		show_message(concat("ERROR: object doesn't contain code_struct_name \"", code_struct_name, "\""));
		return false;
	}
	
	var r = false;
	if global.processing_mod.enabled
	{
		if (object[$ code_struct_name][$ code] ?? noone) != noone
		{
			r = live_snippet_call_array(object[$ code_struct_name][$ code], args);
			if !r
			{
				show_message(concat("Runtime error for object \"", object.name, "\" ", code, " event in mod \"", global.processing_mod.name, "\":\n\n", live_result));
				struct_remove(object[$ code_struct_name], code);
			}
		}
	}
	
	global.processing_mod = noone;
	return r;
}
