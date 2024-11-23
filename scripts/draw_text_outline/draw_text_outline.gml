function draw_text_outline(x, y, str, col = c_black, scale = 1, angle = 0, sep = 1)
{
	var resetcolor = draw_get_colour();
	
	draw_set_color(col);
	if scale == 1 && angle == 0
	{
		draw_text(x - sep, y - sep, str);
		draw_text(x - sep, y + sep, str);
		draw_text(x + sep, y + sep, str);
		draw_text(x + sep, y - sep, str);
		
		draw_set_color(resetcolor);
		draw_text(x, y, str);
	}
	else
	{
		draw_text_transformed(x - sep, y - sep, str, scale, scale, angle);
		draw_text_transformed(x - sep, y + sep, str, scale, scale, angle);
		draw_text_transformed(x + sep, y + sep, str, scale, scale, angle);
		draw_text_transformed(x + sep, y - sep, str, scale, scale, angle);
		
		draw_set_color(resetcolor);
		draw_text_transformed(x, y, str, scale, scale, angle);
	}
}
