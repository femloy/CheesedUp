scr_pause_activate_objects();
with pauseID
{
	event_perform(ev_alarm, 3);
	pause = false;
	fadein = false;
}

trace("[loadingscreen] Destroyed");
with obj_fadeout
{
	if fadein && instance_exists(obj_cyop_loader)
		alarm[0] = 1;
}
