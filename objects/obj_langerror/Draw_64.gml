draw_set_font(fnt_caption)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_text_color(8, (SCREEN_HEIGHT - 8), text, c_red, c_red, c_red, c_red, alpha)

alpha -= 0.025;
if alpha <= 0
	instance_destroy();
