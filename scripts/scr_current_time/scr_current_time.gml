function scr_current_time() {
	return !safe_get(obj_pause, "pause") && REMIX ? ((global.time / 60) * 1000) : current_time;
}
