shader_set(global.Pal_Shader);
var game = scr_get_game();
var pal = game.palette_player2;
var tex = game.palettetexture_player2;
pattern_set(scr_color_array("P"), sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(spr_peppalette, pal, false);
draw_self();
pattern_reset();
shader_reset();
