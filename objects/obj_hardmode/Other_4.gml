if global.hardmode && !(room == strongcold_endscreen || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect)
	instance_create_unique(obj_player1.x, obj_player1.y, obj_hardmode_ghost);
