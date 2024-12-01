live_auto_call;

if !sprite_exists(sprite)
	sprite = default_spr;


draw_sprite_ext(sprite, frame, x, y, xscale, 1, 0, c_white, 1);

tdp_draw_set_align(fa_center, fa_bottom);
draw_set_alpha(1);
draw_set_colour(c_white);
tdp_draw_set_font(lfnt("font_small"));
	
tdp_draw_text(x, y - sprite_height / 2 - 4, username);
tdp_text_commit();