if !eggplant or !instance_exists(playerid)
	exit;

var xx = playerid.x;
var yy = playerid.y - 100;

lang_draw_sprite(spr_comboend, 0, xx, yy);
var title = floor(combo / 5);
scr_combotitledraw(sprite, xx, yy + 30, title, title_index);

if !global.timeattack && !global.snickchallenge
{
	draw_set_font(global.smallfont);
	draw_set_align(fa_center, fa_top);
	draw_text(xx, yy + (REMIX ? 40 : 60), comboscore);
}
