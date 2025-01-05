function scr_load_file(filename)
{
	if global.processing_mod != noone
	{
		var bound = string_starts_with(filename, global.processing_mod.mod_root);
		if !bound
		{
			filename = global.processing_mod.mod_root + "\\" + filename;
			filename = string_replace(filename, "\\\\", "\\");
			filename = string_replace(filename, "\\/", "\\");
			filename = string_replace(filename, "//", "\\");
			bound = file_exists(filename);
		}
		if !bound
		{
			show_message($"{global.processing_mod.name}: You can't load files outside of your mod's folder.");
			return undefined;
		}
	}
	
	if !file_exists(filename)
		return undefined;
	
	var b = buffer_load(filename);
	if b == -1
		return undefined;
	
	var s = "";
	if buffer_get_size(b) > 0
		s = buffer_read(b, buffer_text);
	buffer_delete(b);
	return s;
}
