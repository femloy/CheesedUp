global.roommessage = "GRANNY PIG'S HOUSE";

var lay_id = layer_get_id("Assets_stillBG1")
var gus = layer_sprite_get_id(lay_id, "gustv")

switch obj_player.character
{
	case "N":
		layer_sprite_change(gus, spr_noisetvstreet);
		layer_sprite_x(gus, layer_sprite_get_x(gus) + 50);
		layer_sprite_y(gus, layer_sprite_get_y(gus) + 50);
		break;
}
