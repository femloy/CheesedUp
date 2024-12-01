/// @description Sucrose BG Events
if sucrose_state >= 2
	exit;

var _bg = layer_background_get_id("Backgrounds_still1");
switch ++sucrose_state
{
	case 1:
		layer_background_sprite(_bg, bg_sucrose_skyWakingUp);
		layer_background_index(_bg, 0);
		layer_background_speed(_bg, 0.25);
		break;
	case 2:
		instance_create_unique(0, 0, obj_hungrypillarflash);
		activate_panic(true);
		layer_background_sprite(_bg, bg_sucrose_skyActive);
		layer_background_index(_bg, 0);
		layer_background_speed(_bg, 0.35);
		break;
}
