live_auto_call;

if instance_exists(obj_keyconfig)
	exit;

if SUGARY_SPIRE && check_sugary()
	scr_pausedraw_ss();
else
	scr_pausedraw();
