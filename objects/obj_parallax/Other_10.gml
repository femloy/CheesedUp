/// @description Sucrose BG Events
var _bg = layer_background_get_id("Backgrounds_still1");

/*
var _bg_sprite = layer_background_get_sprite(_bg);
var _index = layer_background_get_index(_bg);
var _frames = sprite_get_number(_bg_sprite);
*/

if global.panic
{
	layer_background_sprite(_bg, bg_sucrose_skyActive);
	layer_background_index(_bg, 0);
	layer_background_speed(_bg, 0.35);
	exit;
}
sucrose_state++;

switch sucrose_state
{
	case 0:
		break;
	case 1:
		layer_background_sprite(_bg, bg_sucrose_skyWakingUp);
		layer_background_index(_bg, 0);
		layer_background_speed(_bg, 0.25);
		break;
	default:
		instance_create_unique(0, 0, obj_hungrypillarflash);
		activate_panic(true);
		layer_background_sprite(_bg, bg_sucrose_skyActive);
		layer_background_index(_bg, 0);
		layer_background_speed(_bg, 0.35);
		break;
}


