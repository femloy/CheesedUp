function tdp_draw_text(x, y, str)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text(x, y, str);
	else
	{
		var c = draw_get_color();
		var a = draw_get_alpha();
		tdp_text_action_text(x, y, str, c, c, c, c, a);
	}
}
function tdp_draw_text_color(x, y, str, c1, c2, c3, c4, alpha)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text_color(x, y, str, c1, c2, c3, c4, alpha);
	else
		tdp_text_action_text(x, y, str, c1, c2, c3, c4, alpha);
}
function tdp_draw_set_halign(halign)
{
	draw_set_halign(halign);
	if global.tdp_text_enabled
		tdp_text_action_halign(halign);
}
function tdp_draw_set_valign(valign)
{
	draw_set_valign(valign);
	if global.tdp_text_enabled
		tdp_text_action_valign(valign);
}
function tdp_draw_set_font(font)
{
	draw_set_font(font);
	if global.tdp_text_enabled
		tdp_text_action_font(font);
}

// pto
function tdp_draw_text_transformed(x, y, str, xscale, yscale, angle)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text_transformed(x, y, str, xscale, yscale, angle);
	else
	{
		var c = draw_get_color();
		var a = draw_get_alpha();
		tdp_text_action_text(x, y, str, c, c, c, c, a, xscale, yscale, angle);
	}
}
function tdp_draw_text_transformed_color(x, y, str, xscale, yscale, angle, c1, c2, c3, c4, alpha)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text_transformed_color(x, y, str, xscale, yscale, angle, c1, c2, c3, c4, alpha);
	else
		tdp_text_action_text(x, y, str, c1, c2, c3, c4, alpha, xscale, yscale, angle);
}
function tdp_draw_text_ext(x, y, str, sep, w)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text_ext(x, y, str, sep, w);
	else
	{
		var c = draw_get_color();
		var a = draw_get_alpha();
		tdp_text_action_text(x, y, str, c, c, c, c, a, 1, 1, 0, sep, w);
	}
}
function tdp_draw_text_ext_color(x, y, str, sep, w, c1, c2, c3, c4, alpha)
{
	if !global.tdp_text_enabled or !draw_font_is_ttf()
		draw_text_ext_color(x, y, str, sep, w, c1, c2, c3, c4, alpha);
	else
		tdp_text_action_text(x, y, str, c1, c2, c3, c4, alpha, 1, 1, 0, sep, w);
}
