condition = function()
{
    return global.panic;
}
output = function()
{
    var lay_id = layer_get_id("Assets_1")
    var sprite_id = layer_sprite_get_id(lay_id, "graphic_5748A7F1")
    layer_sprite_change(sprite_id, spr_clocktowerexterior_broken)
}
