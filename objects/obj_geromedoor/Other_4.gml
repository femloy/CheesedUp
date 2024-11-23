if place_meeting(x, y, obj_player)
	visited = true;
if in_saveroom() or visited
	image_index = image_number - 1;

if global.snickchallenge or global.timeattack
	instance_destroy(id, false);
