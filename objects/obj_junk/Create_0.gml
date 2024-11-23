if object_index == obj_junk
{
	if !instance_exists(obj_cyop_loader) or REMIX
	{
		instance_change(obj_junkNEW, false);
		event_perform_object(obj_junkNEW, ev_create, 0);
		exit;
	}
	else
		scr_initenemy();
}

ratgrabbed = false;
grabbed = false;
state = states.normal; // redundant
init_collision();
flash = true;
unpickable = false;
hp = 0;
grounded = true;
state = 0; // not an enum
playerid = obj_player1;
image_speed = 0;
image_index = random_range(0, image_number - 1);
mask_index = spr_player_mask;
depth = -5;
thrown = false;
use_collision = true;
