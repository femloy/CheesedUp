hitboxcreate = false;
reset_pos(false);

if (!global.snickchallenge && (global.laps < 2 or !check_lap_mode(LAP_MODES.laphell)))
or room == timesuproom or room == rank_room or MOD.EasyMode
	instance_destroy();
