draw_set_font(fnt_caption);
draw_set_align(fa_left, fa_bottom);

var yy = SCREEN_HEIGHT - 8;
for(var i = 0; i < array_length(text); ++i)
{
	with text[i]
	{
		draw_text_color(8, yy, text, c_red, c_red, c_red, c_red, alpha);
		yy -= 16;
		
		alpha -= 0.025;
		if alpha <= 0
		{
			array_delete(other.text, i, 1);
			i--;
			continue;
		}
	}
}
