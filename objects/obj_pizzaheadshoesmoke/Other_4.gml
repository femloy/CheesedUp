var lay_id = layer_get_id("Assets_1");
var pep = layer_sprite_get_id(lay_id, "pep");
var noise = layer_sprite_get_id(lay_id, "noise");
if global.swapmode == false && obj_player1.character != "N"
{
	layer_sprite_alpha(pep, 1);
	layer_sprite_alpha(noise, 0);
}
else
{
	layer_sprite_alpha(pep, 0);
	layer_sprite_alpha(noise, 1);
}
if global.swapmode == false && obj_player1.character != "N"
	instance_destroy();
