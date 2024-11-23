live_auto_call;

if con != 0
{
	// pto pause background
	var s = 72;
	x = (x + 0.25) % s;
	
	if !surface_exists(bordersurf)
	{
		bordersurf = surface_create(s * 2, s * 2);
		surface_set_target(bordersurf);
		draw_clear(c_black);
		draw_set_colour(make_colour_hsv((257 / 360) * 255, (39 / 100) * 255, (23 / 100) * 255));
		draw_roundrect_ext(0, 0, s - 1, s - 1, 16, 16, false);
		draw_roundrect_ext(s, s, s + s - 1, s + s - 1, 16, 16, false);
		surface_reset_target();
	}
	draw_surface_tiled(bordersurf, x, x);
	
	// surface
	var w = 720, h = 400;
	if !surface_exists(surf)
		surf = surface_create(w, h);
	
	surface_set_target(surf);
	draw_clear(c_black);

	// do it
	draw_set_font(lfnt("dos"));
	draw_set_colour(c_ltgray);
	draw_set_align();

	while string_height_ext(output + input + "_", 16, w) > h // delete lines out of bounds
		output = string_delete(output, 1, string_pos("\n", output));

	var str = string(output) + string(input);
	if input_mode != 0 && blink <= 15
		str += "_";
	draw_text_ext(0, 0, str, 16, w);

	if input_mode != 0
		blink = ++blink % 30;

	// draw the result
	surface_reset_target();
	gpu_set_texfilter(true);
	var xx = (SCREEN_WIDTH - w) / 2, yy = (SCREEN_HEIGHT - h) / 2;
	draw_surface(surf, xx, yy);
	gpu_set_texfilter(false);
}

// fadeout
if con == 0
{
	fade += 0.1;
	if fade >= 1.5
		con = 1;
}
if con == 1
{
	fade -= 0.1;
	if fade <= 0
		con = 2;
}

if con < 2
{
	draw_set_colour(c_black);
	draw_set_alpha(fade);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
}
