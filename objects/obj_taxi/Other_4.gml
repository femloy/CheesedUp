var escape_logic = escape;
if check_lap_mode(LAP_MODES.april) && global.gerome && !timeattack
	escape_logic = !escape_logic;

if global.panic && !escape_logic
	instance_destroy();
else if !global.panic && escape_logic
	instance_destroy();

if global.timeattack && timeattack
	instance_destroy();
