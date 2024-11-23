function draw_lapflag(x, y, lapflag_index, sugary = false)
{
	//if live_call(x, y, lapflag_index, sugary) return live_result;
	
	//if !REMIX
		exit;
	
	var posx = x - 72, posy = y - 18;
	var text_yo = (-floor(lapflag_index) % 4) + 32;
	var spr = spr_lapflag, font = global.lapfont;
	
	if SUGARY_SPIRE
	{
		if sugary
		{
			text_yo = 30;
			spr = spr_lapflag_ss;
			font = global.lapfont_ss;
		}
	}
	
	draw_sprite(spr, lapflag_index, posx, posy);
	draw_set_colour(c_white);
	draw_set_align(fa_center, fa_middle);
	draw_set_font(font);
	draw_text(posx + 34 - string_length(string(global.laps + 1)), posy + text_yo, string(global.laps + 1));
	draw_set_align(); // reset alignment
}
