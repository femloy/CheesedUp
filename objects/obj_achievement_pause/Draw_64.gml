draw_sprite_tiled(spr_cheftaskBG, 0, yoffset, yoffset);

tdp_draw_set_halign(fa_center);
tdp_draw_set_valign(fa_top);
tdp_draw_set_font(lang_get_font("creditsfont"));

var xpad = 100;
var xx = (SCREEN_WIDTH - (xpad * 2)) / array_length(achievements);
xx += xpad;

var yy = SCREEN_HEIGHT / 3;
if array_length(achievements) == 1
    xx = SCREEN_WIDTH / 2;

for (var i = 0; i < array_length(achievements); i++)
{
	var ix = achievements[i].image_index;
	draw_sprite_ext(sprite, ix, xx + ((SCREEN_WIDTH / 2 - xx) * i), yy, 1, 1, 0, c_white, i == achievement ? 1 : 0.5);
}

if achievement > -1
{
    var ach = achievements[achievement];
    var txt = concat(ach.name, "\n\n", ach.description);
    tdp_draw_text_color(SCREEN_WIDTH / 2, yy + 75, txt, c_white, c_white, c_white, c_white, 1);
}

tdp_draw_set_font(lang_get_font("bigfont"));
tdp_draw_set_halign(fa_left);
tdp_draw_set_valign(fa_top);

var c = c_white;
if achievement != -1
    c = c_gray;

tdp_draw_text_color(52, 52, lang_get_value("option_back"), c, c, c, c, 1);
tdp_text_commit();
