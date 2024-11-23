SS_CODE_START;

if state = states.grabbed
{
	grabbedby = 1;
	scr_enemy_grabbed()
}

if linethrown
{
	linethrown = false;
	hithsp = clamp(hithsp, -15, 15);
	hsp = clamp(hsp, -15, 15);
}

SS_CODE_END;
