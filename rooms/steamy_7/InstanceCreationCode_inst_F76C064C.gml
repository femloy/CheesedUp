condition = function()
{
    with obj_player
		return targetDoor == "D";
	return false;
}

output = function()
{
    var lay_id = layer_get_id("Assets_1");
    var sprite_id = layer_sprite_get_id(lay_id, "graphic_601E5554");
    layer_sprite_destroy(sprite_id);
}
