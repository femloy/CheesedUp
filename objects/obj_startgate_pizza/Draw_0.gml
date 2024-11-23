draw_self();
if SUGARY_SPIRE && sugary
{
	if rank_index >= 1
		draw_sprite(spr_cakehud_crank, image_index, x, y);
	if rank_index >= 2
		draw_sprite(spr_cakehud_brank, image_index, x, y);
	if rank_index >= 3
		draw_sprite(spr_cakehud_arank, image_index, x, y);
	if rank_index >= 4
		draw_sprite(spr_cakehud_srank, image_index, x, y);
}
if state > 0
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	if SUGARY_SPIRE && sugary
		draw_set_font(global.collectfontSP);
	else
		draw_set_font(global.collectfont);
	
	var text_y = 0;
	switch floor(image_index)
	{
		case 1:
		case 2:
		case 3:
			text_y = 1;
			break;
		case 5:
		case 10:
			text_y = -1;
			break;
		case 6:
		case 9:
			text_y = -2;
			break;
		case 7:
			text_y = -3;
			break;
		case 8:
			text_y = -5;
			break;
	}
	
	var str = "0";
	var len = array_length(highscore);
	var num = string_length(str) * len;
	var w = string_width(str) * len;
	var xx = x - (w / 2);
	for (var i = 0; i < len; i++)
	{
		var b = highscore[i];
		var _char = b[0];
		var _char_y = b[1];
		var yy = (((i + 1) % 2) == 0) ? -5 : 0;
		var ty = 0;
		if (_char_y >= y)
			ty = text_y;
		draw_text(xx, ((_char_y + yy) - 56) + ty, _char);
		xx += (w / num);
	}
	
	var xx = x;
	if timed_rank != -1
	{
		var timedx = x;
		if rank_index != -1
		{
			xx = x - 32;
			timedx = x + 32;
		}
		draw_sprite_ext(spr_ranks_hud_timed, timed_rank, timedx, y + 58, rank_scale, rank_scale, 0, c_white, 1);
	}
	
	/*
	if DEATH_MODE && death_rank != -1
	{
		xx = x - 40;
		draw_sprite_ext(spr_ranks_death, death_rank, x + 40, y + 58, rank_scale, rank_scale, 0, c_white, 1);
	}
	*/
	
	if rank_index != -1
	{
		var sprite = REMIX ? spr_ranks_hud_NEW : spr_ranks_hud;
		if SUGARY_SPIRE && sugary
			sprite = spr_ranks_hudSP;
		draw_sprite_ext(sprite, rank_index, xx, y + 58, rank_scale, rank_scale, 0, c_white, 1);
	}
}
