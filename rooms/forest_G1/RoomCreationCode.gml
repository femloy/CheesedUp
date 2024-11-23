global.roommessage = "OH YEA!";

var lay_id = layer_get_id("Assets_1");
var gus = layer_sprite_get_id(lay_id, "graphic_606CD6FF");
switch obj_player1.character
{
	case "N":
		layer_sprite_change(gus, spr_noisetutorialsign);
		global.roommessage = "WOAG !";
		break;
	case "V":
		layer_sprite_change(gus, spr_morttutorialsign);
		global.roommessage = "YES.";
		break;
}
