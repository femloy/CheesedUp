live_auto_call;

if DEATH_MODE
{
	if !active or room == timesuproom or room == rank_room
		exit;

	var timeinsecs = floor(time / 60);
	var mins = floor(timeinsecs / 60);
	var secs = timeinsecs % 60;
	if secs < 10
	    secs = concat("0", secs);

	draw_set_font(lang_get_font("bigfont"))
	draw_set_align(fa_left, fa_middle);

	var a = floor(show_time / 20)
	var b = (a % 2) == 1
	if show_time == 0
	    b = 1;

	var xx = SCREEN_WIDTH / 2;
	var yy = round(SCREEN_HEIGHT - 50 - surfy);
	if timeinsecs <= 5
		xx += random_range(-1, 1);

	var wd = string_width(concat(mins, ":", secs));
	draw_set_colour(time == 0 ? c_red : c_white);
	draw_set_alpha(b)
	draw_text_transformed(xx - floor(wd / 2) * (1 + surfscale), yy, concat(mins, ":", secs), 1 + surfscale, 1 + surfscale, 0)

	draw_set_colour(c_white);
	draw_set_alpha(lerp(0, 3, time_fx_y / 15));
	if time_fx_y > 0
	{
		draw_set_font(lang_get_font("smallfont"))
		draw_text(xx + 50 + 14, yy + ybump, ceil(time_fx))
		draw_set_font(lang_get_font("font_small"))
		draw_text(xx + 50, yy + 4 + ybump, "+")
	}
	draw_set_alpha(1);
}
