live_auto_call;

draw_set_color(c_white);

draw_self();
if sprite_index != spr_snickchallengecomputer
{
	draw_sprite_safe(sprite_index, 1, x, y);
	scr_hub_bg_draw(x, y, sprite_index, 1);
}

// sugary level details
if SUGARY && distance_to_object(obj_player) < 50
{
	var yy = y + 144;
	
	draw_set_font(lang_get_font("smallfont"));
	draw_set_align(fa_center);
	draw_set_color(c_white);
	
	if highscore > 0
	{
		draw_text(x, (yy - 252), embed_value_string(lstr("sugarygate_line1"), [highscore, laps + 1]));
		draw_text(x, (yy - 278), embed_value_string(lstr("sugarygate_line2"), [secret_count, 3]));
	}
	
	// confecti
	for (var i = 0; i < 5; ++i) 
	{
		var x_pos = -100 + (50 * i);
		draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, yy - 328, 1, 1, 0, toppin[i] ? c_white : c_black, 1);
	}
	
	// rank
	var _rankimg = -1;
	switch rank
	{
		case "p": _rankimg = 5; break;
		case "s": _rankimg = 4; break;
		case "a": _rankimg = 3; break;
		case "b": _rankimg = 2; break;
		case "c": _rankimg = 1; break;
		case "d": _rankimg = 0; break;
	}
	
	if _rankimg != -1
		draw_sprite_ext(spr_ranks_hudSP, _rankimg, x - 32 + 34, yy - 218 + 32, 1, 1, 0, c_white, 1);
}
