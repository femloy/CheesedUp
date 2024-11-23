shader_set(global.Pal_Shader);
pal_swap_set(spr_noiseboss_palette, obj_player1.character == "N" ? 1 : 2, false);
draw_self();
shader_reset();
