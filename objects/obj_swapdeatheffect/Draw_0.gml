shader_set(global.Pal_Shader);

if obj_player1.character == "N"
	spr_palette = spr_peppalette;
else
	spr_palette = spr_noisepalette;

if spr_palette == spr_noisepalette
	pal_swap_supernoise(room == boss_pizzaface && instance_exists(obj_pizzaface_thunderdark));

pal_swap_set(spr_palette, paletteselect, false);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
pattern_reset();
shader_reset();
