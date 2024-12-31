function scr_load_file(filename)
{
	if !file_exists(filename)
		return undefined;
	
	var b = buffer_load(filename);
	if b == -1
		return undefined;
	
	var s = buffer_read(b, buffer_text);
	buffer_delete(b);
	return s;
}
