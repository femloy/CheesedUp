draw_set_alpha(1);
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _revert = embed_value_string(lang_get_value("option_revert"), [timer]);
var _midW = SCREEN_WIDTH / 2, _midH = SCREEN_HEIGHT / 2;

if !restart
{
	tdp_draw_text(_midW, _midH - 70, lang_get_value("option_confirm"));
	tdp_draw_text(_midW, _midH - 30, _revert);
}
else
	tdp_draw_text(_midW, _midH - 70, lstr("option_reboot"));

var c1 = (select == 0 ? c_white : c_gray), c2 = (select == 1 ? c_white : c_gray);
tdp_draw_text_color(_midW - 100, _midH + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
tdp_draw_text_color(_midW + 100, _midH + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
tdp_text_commit();
