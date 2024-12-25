ensure_order;

image_alpha = 0;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
if instance_exists(obj_player1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
treasure = instance_exists(obj_treasure);
if room == rank_room
	instance_destroy();

// lap 3
if global.laps >= 2 && global.chasekind == CHASE_KINDS.slowdown
{
	// from "LAP HELL - Pizza Pursuit" by TheCyVap
	var pepspeed = 8;
	var noisespeed = 8;
	
	switch room
	{
		case graveyard_7:
			pepspeed = 5.5;
		    noisespeed = 5.5;
			break;
		
		case graveyard_9b:
			pepspeed = 6;
			noisespeed = 7;
			break;
		
		case farm_4:
			pepspeed = 6;
			noisespeed = 7;
			break;
		
		case forest_lap:
			pepspeed = 7;
			noisespeed = 7;
			break;
		
		// secrets
		case street_secret1:
			pepspeed = 5;
			break;
		
		case space_secret3:
			pepspeed = 5;
			break;
		
		case kidsparty_secret2:
			pepspeed = 6;
			break;
		
		case street_secret2:
			pepspeed = 5;
			break;
		
		case sewer_secret1:
			pepspeed = 5;
			break;
		
		case saloon_secret2:
			pepspeed = 4;
			break;
		
		case sewer_secret2:
			pepspeed = 5;
	        noisespeed = 6;
			break;
		
		case dungeon_secret3:
			pepspeed = 5;
			break;
		
		case graveyard_secret2:
			pepspeed = 5;
			break;
		
		case farm_secret1:
			pepspeed = 5;
	        noisespeed = 6;
			break;
		
		case farm_secret2:
			pepspeed = 5;
			break;
		
		case forest_secret1:
			pepspeed = 5;
			break;
		
		case freezer_secret3:
			pepspeed = 5;
			break;
	}
	
	if CHAR_BASENOISE
		maxspeed = noisespeed;
	else
		maxspeed = pepspeed;
	if global.swapmode
		maxspeed = min(pepspeed, noisespeed);
	
	image_speed = maxspeed < 7 ? 0.2 : 0.35;
	sprite_index = maxspeed < 7 ? spr_haywire : spr_idle;
}
