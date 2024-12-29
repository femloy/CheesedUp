live_auto_call;

draw_set_color(c_white);
draw_set_align();

var get_y = function(pos)
{
	if pos < 0
		pos = 0;
	return (string_height(lstr("default_letter")) + 8) * pos;
}
scroll = lerp(scroll, get_y(sel), 0.1);

var xx = 64;
var base_y = SCREEN_HEIGHT / 2 - 32;

var c = -1 == sel ? c_white : c_gray;

draw_set_font(lfnt("bigfont"));
tdp_draw_text_color(42, base_y - 64 - scroll, lstr("option_back"), c, c, c, c, 1);
tdp_text_commit();

draw_set_font(global.bigfont);
for(var i = 0; i < array_length(mods); i++)
{
	var yy = base_y + get_y(i) - scroll;
	if yy > -32
	{
		var c = i == sel ? c_white : c_gray;
		
		draw_set_align(fa_left);
		draw_text_color(xx, yy, string_upper(mods[i].name), c, c, c, c, 1);
		
		if mods[i].enabled != 2
		{
			draw_set_align(fa_right);
			draw_text_color(xx + 450, yy, lstr(mods[i].enabled ? "option_on" : "option_off"), c, c, c, c, 1);
		}
	}
	if yy > SCREEN_HEIGHT
		break;
}

if sel >= 0
{
	var right_center = SCREEN_WIDTH - 232;
	var right_middle = SCREEN_HEIGHT / 2 - 16;
	
	var icon = spr_modicon;
	if mods[sel].icon != noone
		icon = mods[sel].icon;
	draw_sprite_stretched(icon, mods[sel].icon_img, right_center - 128, right_middle - 128, 256, 256);
	
	draw_set_font(lfnt("font_small"));
	draw_set_align(fa_center);
	draw_text_ext(right_center, right_middle + 150, mods[sel].desc, 16, 300);
}
