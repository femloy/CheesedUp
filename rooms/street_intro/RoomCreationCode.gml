global.roommessage = "THE BIG PIZZA TOWER CITY";
gameframe_caption_text = lang_get_value("caption_street");
with obj_secretbigblock
	particlespr = spr_streetdebris;

var lay_id = layer_get_id("Assets_1");
var pep = layer_sprite_get_id(lay_id, "peppinotv");
switch obj_player1.character
{
	case "N":
		layer_sprite_change(pep, spr_noisetvstreet);
		layer_sprite_x(pep, layer_sprite_get_x(pep) + 50);
		layer_sprite_y(pep, layer_sprite_get_y(pep) + 50);
		break;
	case "G":
		layer_sprite_change(pep, spr_gustavotvstreet);
		break;
}
