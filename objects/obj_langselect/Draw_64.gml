live_auto_call;

var selected = lang[select];
draw_sprite(selected.sprite, -1, SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + Wave(-2, 2, 2, 10));
draw_sprite(spr_lang_left, 0, (SCREEN_WIDTH / 2) - 150 - left_offset, SCREEN_HEIGHT / 2);
draw_sprite(spr_lang_right, 0, (SCREEN_WIDTH / 2) + 150 + right_offset, SCREEN_HEIGHT / 2);

var name_y = (CAMERA_HEIGHT / 2) + 80 + floor(Wave(-1, 1, 0.5, 0));
if selected.spr_name == noone
{
	draw_set_font(global.bigfont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(CAMERA_WIDTH / 2, name_y, selected.name);
}
else
	draw_sprite(selected.spr_name, 0, CAMERA_WIDTH / 2, name_y)
