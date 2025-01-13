live_auto_call;

var _worldinfo = worlds[selected_world];
var str = string_upper(_worldinfo.name);

draw_set_align(fa_center, fa_middle);
draw_set_color(c_white);
draw_set_font(lang_get_font("bigfont"));

/*
var arrows_x = 704 + 100, arrows_y = 288;

if selected_world > 0
	draw_sprite(spr_uparrow, 0, arrows_x, arrows_y - 32);
if selected_level < array_length(_worldinfo.levels) - 1
	draw_sprite_ext(spr_uparrow, 0, arrows_x + 32, arrows_y, 1, 1, -90, c_white, 1); // right
if selected_world < array_length(worlds) - 1
	draw_sprite_ext(spr_uparrow, 0, arrows_x, arrows_y + 32, 1, -1, 0, c_white, 1);
if selected_level > 0
	draw_sprite_ext(spr_uparrow, 0, arrows_x - 32, arrows_y, 1, 1, 90, c_white, 1);

draw_sprite(spr_controlseggplant, 1, 800, 128);
draw_sprite(spr_title, 1, -9, 13);
*/

var _levelinfo = noone;
if selected_level >= 0 && selected_level < array_length(_worldinfo.levels)
{
	_levelinfo = _worldinfo.levels[selected_level];
	str += concat("\n", selected_level + 1, ". ", string_upper(_levelinfo.display_name));
}
else
	str += "\nNO LEVELS";
draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - 100, str);

if _worldinfo.door_index != noone
	draw_sprite(spr_door, _worldinfo.door_index, SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2);

if _levelinfo != noone && is_callable(_levelinfo.draw_func)
	_levelinfo.draw_func();
