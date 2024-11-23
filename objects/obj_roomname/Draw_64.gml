if yi <= -36
	exit;

var msg = global.roommessage;
var yy = yi, xi = REMIX ? SCREEN_WIDTH / 2 : 500;

if msg == ""
	exit;

draw_set_font(lang_get_font("smallfont"));
draw_set_align(fa_center, fa_middle);
draw_set_color(c_white);

/*
if level && (SUGARY_SPIRE && check_sugary())
{
	xi = 192;
	yy = SCREEN_HEIGHT - yy - 6;
	draw_sprite(spr_roomnamebg_ss, 0, xi, yy);
}
else*/

var yo = 8 - 3;
if draw_font_is_ttf()
	yo += 8;

draw_sprite(spr_roomnamebg, 0, xi, yy);
if level
	tdp_draw_text_ext(xi, yy + yo, msg, 14, 300);
else
	tdp_draw_text(xi, yy + yo, msg);
tdp_text_commit();
