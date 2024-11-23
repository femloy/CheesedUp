if GM_build_type == "run"
{
	global.debug_mode = !global.debug_mode;
	show_debug_message("[DEBUG] {0}", global.debug_mode ? "yes" : "no");
}
