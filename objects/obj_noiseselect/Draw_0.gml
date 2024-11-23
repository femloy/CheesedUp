shader_set(global.Pal_Shader);
var game = scr_get_game();
var pal = game.palette;
var tex = game.palettetexture;
pattern_set(scr_color_array("N"), sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(spr_noisepalette, pal, false);
draw_self();
pattern_reset();
shader_reset();
