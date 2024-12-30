function scr_load_gml(filename, name = "snippet")
{
	var str = scr_load_file(filename);
	if str == undefined
		return noone;
	
	var snippet = live_snippet_create(str, name) ?? noone;
	if snippet == noone
		show_message("Code error for " + filename + ": \n\n" + live_result);
	
	return snippet;
}
