if global.timeattack
{
	instance_destroy();
	exit;
}

if MOD.FromTheTop
	instance_destroy();
else if check_lap_mode(LAP_MODES.april)
{
	instance_change(obj_gerome, true);
	
	april = true;
	event_perform_object(obj_gerome, ev_other, ev_room_start);
	
	repeat room_height
	{
		if scr_solid(x, y + 1)
			break;
		y++;
	}
	exit;
}

if array_contains(base_game_levels(), global.leveltosave) && !global.sandbox
{
	ini_open_from_string(obj_savesystem.ini_str);
	if ini_read_real("Highscore", global.leveltosave, 0) == 0 && !ini_read_real("Tutorial", "lapunlocked", false)
		sprite_index = spr_outline;
	ini_close();
}

if global.in_afom
{
	if inlaps
		global.afom_lapmode = LAP_MODES.infinite;
	else
	{
		global.afom_lapmode = LAP_MODES.laphell;
		if global.laps >= clamp(maxlaps, 1, 3)
			instance_destroy();
	}
}

if check_lap_mode(LAP_MODES.laphell)
{
	if global.laps >= (global.in_afom ? 3 : 2)
		instance_destroy();
}
else if DEATH_MODE
{
	if MOD.DeathMode
		instance_destroy();
}

if check_lap_mode(LAP_MODES.normal) && global.lap
	instance_destroy();

if global.snickchallenge
	instance_destroy();
