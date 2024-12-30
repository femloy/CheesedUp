function scr_load_file(filename)
{
	if !file_exists(filename)
		return undefined;
	var b = buffer_load(filename);
	var s = buffer_read(b, buffer_text);
	buffer_delete(b);
	return s;
}
