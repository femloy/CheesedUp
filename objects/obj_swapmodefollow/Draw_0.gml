shader_set(global.Pal_Shader);
pal_swap_supernoise();
pattern_set(color_array, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
pal_swap_set(spr_palette, paletteselect, false);
event_inherited();
pal_swap_reset();

if room == boss_pizzaface && instance_exists(obj_pizzaface_thunderdark) && character == "N"
{
	shader_set(shd_supernoise);
	draw_sprite_ext(sprite_index, image_index, x, y + yoffset, image_xscale, image_yscale, image_angle, image_blend, obj_player1.supernoisefade);
	shader_reset();
}
