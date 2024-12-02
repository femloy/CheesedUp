live_auto_call;

if !sprite_exists(sprite)
	sprite = default_spr;

var xx = lerp(xprev, x, lerp_time / lerp_time_max), yy = lerp(yprev, y, lerp_time / lerp_time_max);

pal_swap_set(spr_palette, paletteselect);
pattern_set([1, 2], sprite, frame, xscale, yscale, palettetexture);
draw_sprite_ext(sprite, frame, xx, yy, xscale, yscale, 0, c_white, 1);
pal_swap_reset();

draw_set_align(fa_center, fa_bottom);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(global.font_small);
draw_text(xx, yy - sprite_height / 2 - 1, username);
