SS_CODE_START;

shader_set(global.Pal_Shader);
pal_swap_set(spr_palette, paletteselect, false);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, image_blend, image_alpha);
pal_swap_reset();

SS_CODE_END;
