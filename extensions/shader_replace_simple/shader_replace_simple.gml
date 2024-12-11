#define shader_replace_simple_init
/// ()~
global.g_shader_replace_simple_ready = false;

#define shader_replace_simple
/// (shader, vertex_code, fragment_code)->error_text||""
if (!global.g_shader_replace_simple_ready) {
	var l_info = os_get_info();
	switch (shader_replace_simple_init_raw(
		l_info[?"video_d3d11_device"],
		l_info[?"video_d3d11_context"],
		GM_runtime_version
	)) {
		case -1: show_error("You are trying to use a GMS1 shader_replace_simple DLL with GMS2.", 0); break;
		case 0: show_debug_message("shader_replace_simple DLL failed to load.");
	}
}
return shader_replace_simple_raw(argument0, argument1, argument2);

#define shader_replace_simple_auto
/// (shader, vertex_code, fragment_code)->success?; prints error
var l_result = shader_replace_simple(argument0, argument1, argument2);
if (l_result == "") return true;
show_debug_message(l_result);
return false;