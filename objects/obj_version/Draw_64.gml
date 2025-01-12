if instance_exists(obj_noiseunlocked)
	exit;

draw_set_font(global.smallfont);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

var a = instance_exists(obj_cyop_loader) ? 0 : 1;
with obj_mainmenu
	a = extrauialpha;

var ver_str = concat("CU ", ver);
if !instance_exists(obj_option)
	ver_str += concat("\n", "PT ", lstr("game_version"));

draw_text_color(SCREEN_WIDTH - 8, SCREEN_HEIGHT - 8, ver_str, c_white, c_white, c_white, c_white, a);
