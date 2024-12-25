if in_saveroom() or global.gerome
	instance_destroy();
if global.snickchallenge or global.timeattack
	instance_destroy();

if check_lap_mode(LAP_MODES.april)
{
	if !april
		instance_destroy();
}
else if april
	instance_destroy();
