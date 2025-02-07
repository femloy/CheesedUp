global.auto_cutoffs = !(instance_exists(obj_cyop_loader) or instance_exists(obj_cutoff) or array_contains(base_game_levels(), global.leveltosave));
if room == dungeon_1
	global.auto_cutoffs = true;
