if !global.option_hud
	exit;
if eggplant or global.hud == hudstyles.april or global.hud == hudstyles.old
	exit;

var xx = x, yy = y;
draw_set_color(c_white);

lang_draw_sprite(spr_comboend, 0, xx, yy);
var title = floor(combo / 5);
scr_combotitledraw(sprite, xx, yy + 30, title, title_index);

if !global.timeattack && !global.snickchallenge
{
	draw_set_font(global.smallfont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(xx, yy + 70, comboscoremax);
}
