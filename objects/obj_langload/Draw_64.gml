draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);

var p = tex_max - (tex_max - tex_cur);
var t = (p / tex_max) * 100;

draw_healthbar(0, SCREEN_HEIGHT - 6, SCREEN_WIDTH, SCREEN_HEIGHT, t, 0, c_white, c_white, 0, false, false);
draw_sprite_stretched_ext(spr_gradient, 0, 0, SCREEN_HEIGHT - 16, (p / tex_max) * SCREEN_WIDTH, 10, c_white, 0.15);

draw_set_colour(c_white);
draw_set_font(lang_get_font("font_small"));
draw_set_align(fa_left, fa_bottom);
draw_text(4, SCREEN_HEIGHT - 8, $"{text} ({p}/{tex_max})");
draw_set_align();
