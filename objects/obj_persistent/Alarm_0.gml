/// @description lap 4 temp time
if !(global.laps == 2 && check_lap_mode(LAP_MODES.laphell)) or global.in_afom
	exit;

global.lap4time++;
alarm[0] = 60;
