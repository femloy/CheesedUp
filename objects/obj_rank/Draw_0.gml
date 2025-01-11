if sprite_index == spr_rankNP || sprite_index == spr_rankNPend
	draw_sprite(spr_rankNPbg, 0, x, y);

if brownfade < 1
{
	pal_swap_player_palette();
	scr_draw_rank();
	pal_swap_reset();
}

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

if toppinvisible
{
	for (var i = array_length(toppin) - 1; i >= 0; i--)
	{
		if toppin[i] == 0
			c = c_black;
		else
			c = c_white;
			
		if toppin[i] == 1
		{
			switch i
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
			
			if createmoney[i]
			{
				global.pigtotal_add += 10;
				createmoney[i] = false;
				with instance_create(_x, _y - 50, obj_moneynumber)
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
draw_set_align(fa_left, fa_top);
for (i = 0; i < array_length(text); i++)
{
	var b = text[i];
	if b[0]
		tdp_draw_text_color(48, 48 + (32 * i), b[1], c_white, c_white, c_white, c_white, 1);
}
tdp_text_commit();

if global.swapmode && scorewins_show
{
	var spr = spr_scorewinsP;
	if scorewins == "N"
		spr = spr_scorewinsN;
	draw_sprite(spr, 0, scorepos_x, scorepos_y + floor(Wave(-1, 1, 0.2, 0)));
}
