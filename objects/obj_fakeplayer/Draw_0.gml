shader_set(global.Pal_Shader);
pal_swap_set(spr_peppalette, 1, false);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, 0, c_white, 1);
shader_reset();

draw_set_font(lang_get_font("font_small"));
draw_set_align(fa_center);
draw_set_colour(c_white);
var yy = clamp(sprite_get_bbox_top(sprite_index) + y - 75, 0, room_height - 16);
draw_text(x, yy, name);
draw_set_align();
