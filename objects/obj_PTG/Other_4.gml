if in_saveroom()
	instance_destroy();
if (global.level_minutes > timer)
{
	add_saveroom();
	instance_destroy();
}
if (is_holiday(holiday.halloween))
	sprite_index = spr_PTGhalloween;