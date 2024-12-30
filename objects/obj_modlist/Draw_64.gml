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

var curve = animcurve_channel_evaluate(incubic, anim_t);
var xx = lerp(150, 72, curve);
var base_y = SCREEN_HEIGHT / 2 - 32;
var c = -1 == sel ? c_white : c_gray;

draw_set_font(lfnt("bigfont"));
tdp_draw_text_color(xx, base_y - get_y(1) - scroll, lstr("option_back"), c, c, c, c, 1);
tdp_text_commit();

draw_set_font(global.bigfont);
for(var i = 0; i < array_length(mods); i++)
{
	var yy = base_y + get_y(i) - scroll;
	if yy > -32
	{
		var m = mods[i];
		var c = i == sel ? c_white : c_gray;
		
		var wd = string_width(string_upper(m.name));
		var xscale = min(wd, lerp(SCREEN_WIDTH - 400, 380, curve)) / wd;
		
		draw_set_align(fa_left);
		draw_text_transformed_color(xx, yy, string_upper(m.name), xscale, 1, 0, c, c, c, c, 1);
		
		if m.can_enable or m.can_disable
		{
			if !((m.enabled && m.can_disable) or (!m.enabled && m.can_enable))
				c = c_dkgray;
			draw_set_align(fa_right);
			draw_text_color(lerp(SCREEN_WIDTH - 150, xx + 450, curve), yy, lstr(m.enabled ? "option_on" : "option_off"), c, c, c, c, 1);
		}
	}
	if yy > SCREEN_HEIGHT
		break;
}

if sel >= 0
	mod_sel_safe = sel;
if mod_sel_safe >= 0
{
	var right_center = lerp(SCREEN_WIDTH + 500, SCREEN_WIDTH - 220, curve);
	var right_middle = SCREEN_HEIGHT / 2 - 16;
	
	var icon = spr_modicon;
	if mods[mod_sel_safe].icon != noone
		icon = mods[mod_sel_safe].icon;
	draw_sprite_stretched(icon, mods[mod_sel_safe].icon_img, right_center - 128, right_middle - 128, 256, 256);
	draw_sprite(spr_modiconframe, 0, right_center - 128, right_middle - 128);
	
	draw_set_font(lfnt("font_small"));
	draw_set_align(fa_center);
	draw_text_ext(right_center, right_middle + 170, mods[mod_sel_safe].desc, 16, 400);
}

anim_t = Approach(anim_t, sel >= 0 ? 1 : 0, 0.1);
