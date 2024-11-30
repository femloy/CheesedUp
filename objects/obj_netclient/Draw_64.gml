/// @description Paused
live_auto_call;

if not paused exit;
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, c_black, c_black, c_black, false);
draw_sprite(screensprite, 0, 0, 0);

draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	
draw_set_alpha(1);
draw_set_colour(c_white);
tdp_draw_set_font(lfnt("font_small"));
tdp_draw_set_align(fa_center, fa_middle);

draw_set_alpha(0.75);
tdp_draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 30, "Press Escape to Disconnect");

draw_set_alpha(1);
draw_text_ext_transformed((SCREEN_WIDTH / 2) + random_range(-1, 1), SCREEN_HEIGHT / 2, reconnecting_text + "\n", 16, SCREEN_WIDTH / 2, 2, 2, 0);
	
tdp_text_commit();
	
// reset align
	draw_set_align();