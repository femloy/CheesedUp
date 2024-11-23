global.hardmode = MOD.HardMode;
if global.hardmode
{
	global.heatmeter_threshold = floor(global.heatmeter_count / global.heatmeter_threshold_count);
	global.heatmeter_threshold = clamp(global.heatmeter_threshold, 0, global.heatmeter_threshold_max);
}
else
{
	global.heatmeter_threshold = 0;
	global.heatmeter_count = 0;
}

if global.hardmode && !(room == strongcold_endscreen || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect
or instance_exists(obj_titlecard))
	instance_create_unique(obj_player1.x, obj_player1.y, obj_hardmode_ghost);
else
	instance_destroy(obj_hardmode_ghost);
