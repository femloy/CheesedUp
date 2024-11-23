if global.swapmode
	swap_create();

if !instance_exists(obj_cyop_loader)
	scr_start_game(global.currentsavefile);
