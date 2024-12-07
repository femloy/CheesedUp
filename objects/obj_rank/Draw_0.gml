if (sprite_index == spr_rankNP || sprite_index == spr_rankNPend)
	draw_sprite(spr_rankNPbg, 0, x, y);

if (brownfade < 1)
{
	pal_swap_player_palette();
	scr_draw_rank();
	pal_swap_reset();
}

#region SUGARY

if SUGARY_SPIRE && sugary
{
	if brown
	{
		draw_set_alpha(brownfade);
		afterimagesetup();
		draw_rectangle_color(CAMX, CAMY, CAMX + CAMW, CAMY + CAMH, c_white, c_white, c_white, c_white, false);
		scr_draw_rank();
		shader_reset();
		draw_set_alpha(1);
	}
	
	// clipboard
	draw_sprite_ext(spr_rankclipboard, 0, 716, 271 + clipy, 1, 1, 0, c_white, 1);
	lang_draw_sprite_ext(spr_rankclipboard_text, 0, 716, 271 + clipy, 1, 1, 0, c_white, 1);
	
	// D C B A S P
	var r = obj_endlevelfade.rank;
	if global.rank == "p"
	{
		if check_sugarychar()
			r = 7;
		else
			r = 6;
	}
	draw_sprite_ext(spr_rankletter, r, 725, 108 + clipy, 1, 1, 0, c_white, 1);
	
	// secret cards
	cardimg += 0.35;
	draw_sprite_ext(global.secretfound >= 1 ? spr_rankcardflipped : spr_rankcard, cardimg, 649, 325 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(global.secretfound >= 2 ? spr_rankcardflipped : spr_rankcard, cardimg, 723, 325 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(global.secretfound >= 3 ? spr_rankcardflipped : spr_rankcard, cardimg, 798, 327 + clipy, 1, 1, 0, c_white, 1);
	
	// gerome
	if global.treasure
		draw_sprite_ext(spr_rankrudejanitor, 0, 558, 88 + clipy, 1, 1, 0, c_white, 1);
	
	// rank cake
	draw_sprite_ext(spr_rankcake, obj_endlevelfade.rank - 1, 499, 430 + clipy, 1, 1, 0, c_white, 1);
	
	// confectis
	draw_sprite_ext(spr_confecti1rank, global.shroomfollow, 514, 190 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_confecti2rank, global.cheesefollow, 594, 186 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_confecti3rank, global.tomatofollow, 677, 187 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_confecti4rank, global.sausagefollow, 754, 195 + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_confecti5rank, global.pineapplefollow, 828, 199 + clipy, 1, 1, 0, c_white, 1);
	
	// SCORE
	var i = 0;
	var _string = round(string(global.collect));
	var _string_length = string_length(_string);
	
	draw_set_font(global.candlefont);
	draw_set_alpha(1);
	draw_set_align(1);
	
	for (i = 0; i < _string_length; i++)
	{
		var _xx = 750 + -string_width(_string) / 2 + ((string_width(_string) / _string_length) * i);
		
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_palcandle, colors[i], false);
		draw_text(_xx, 385 + (i % 2 == 0 ? -4 : 0) + clipy, string_char_at(_string, i + 1));
		shader_reset();
	}
}
else

#endregion
{
	if brown
	{
		draw_set_alpha(brownfade);
		shader_set(shd_rank);
		draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
		scr_draw_rank();
		shader_reset();
		draw_set_alpha(1);
	}

	var c = c_white;
	var xx = 523;
	var cash_y = 0;
	var sep = 89;
	if (toppinvisible)
	{
		for (var i = array_length(toppin) - 1; i >= 0; i--)
		{
			if (toppin[i] == 0)
				c = c_black;
			else
				c = c_white;
			
			if (toppin[i] == 1)
			{
				switch (i)
				{
					case 0:
						cash_y = -60;
						break;
					case 1:
						cash_y = -40;
						break;
					case 2:
						cash_y = -22;
						break;
					case 3:
						cash_y = -52;
						break;
					case 4:
						cash_y = -46;
						break;
				}
				var _x = xx + (sep * i);
				var _y = toppin_y[i] + cash_y;
				draw_sprite_ext(spr_ranktoppins_cash, 0, _x, _y, 1, toppin_yscale[i], 0, c, 1);
				if (createmoney[i])
				{
					global.pigtotal_add += 10;
					createmoney[i] = false;
					with (instance_create(_x, _y - 50, obj_moneynumber))
					{
						number = "$10";
						depth = other.depth - 1;
					}
				}
			}
			draw_sprite_ext(spr_ranktoppins, i, xx + (sep * i), toppin_y[i], 1, toppin_yscale[i], 0, c, 1);
		}
	}
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (i = 0; i < array_length(text); i++)
	{
		var b = text[i];
		if b[0]
			tdp_draw_text_color(48, 48 + (32 * i), b[1], c_white, c_white, c_white, c_white, 1);
	}
	tdp_text_commit();
}
if global.swapmode && scorewins_show
{
	var spr = spr_scorewinsP;
	if scorewins == "N"
		spr = spr_scorewinsN;
	draw_sprite(spr, 0, scorepos_x, scorepos_y + floor(Wave(-1, 1, 0.2, 0)));
}
