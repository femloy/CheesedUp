function scr_modding_process(object, code)
{
	if !is_instanceof(object, ModObject) && !is_instanceof(object, Mod)
	{
		show_message("ERROR: object is " + string(instanceof(object)));
		return false;
	}
	
	global.processing_mod = object.mod_struct;
	
	var r = false;
	if global.processing_mod.enabled
	{
		if (object.code[$ code] ?? noone) != noone
		{
			r = live_snippet_call(object.code[$ code]);
			if !r
			{
				show_message(concat("Runtime error for object \"", object.name, "\" ", code, " event in mod \"", global.processing_mod.name, "\":\n\n", live_result));
				struct_remove(object.code, code);
			}
		}
	}
	
	global.processing_mod = noone;
	return r;
}
