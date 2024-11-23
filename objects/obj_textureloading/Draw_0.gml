//draw_sprite_stretched_ext(spr_splashscreen, 0, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, image_alpha);
if instance_exists(obj_langload)
	exit;

var p = tex_max - array_length(tex_list);
var t = (p / tex_max) * 100;
var tt = p / tex_max;
var spr_w = sprite_get_width(spr_loadingscreen);
var spr_h = sprite_get_height(spr_loadingscreen);
var xx = floor((SCREEN_WIDTH / 2) - (spr_w / 2));
var yy = floor((SCREEN_HEIGHT / 2) - (spr_h / 2));
draw_sprite_part_ext(spr_loadingscreen, 0, spr_w * tt, 0, spr_w, spr_h, xx + spr_w * tt, yy, 1, 1, c_white, image_alpha);
draw_sprite_part_ext(spr_loadingscreen, 1, 0, 0, spr_w * tt, spr_h, xx, yy, 1, 1, c_white, image_alpha)

if image_alpha < 1
	exit;
draw_healthbar(0, SCREEN_HEIGHT - 6, SCREEN_WIDTH, SCREEN_HEIGHT, t, 0, c_white, c_white, 0, false, false);
draw_sprite_stretched_ext(spr_gradient, 0, 0, SCREEN_HEIGHT - 16, (p / tex_max) * SCREEN_WIDTH, 10, c_white, 0.15);

draw_set_colour(c_white);
draw_set_font(lang_get_font("font_small"));
draw_set_align(fa_left, fa_bottom);
draw_text(4, SCREEN_HEIGHT - 8, $"{text} ({p}/{tex_max})");
draw_set_align();
