live_auto_call;

x = SCREEN_WIDTH / 2;
var yy = SCREEN_HEIGHT / 2 - y;

draw_sprite_tiled(bg_credits, image_index, x, -y / 4);
switch image_index
{
	case 2:
		draw_sprite_tiled(bg_basementpillar, 0, 200, -y / 3);
		break;
	case 3:
		draw_sprite_ext(spr_vignette, 0, 
			-SCREEN_WIDTH / 2, -SCREEN_HEIGHT / 2,
			get_screen_xscale() * 2, get_screen_yscale() * 2,
			0, #280040, 1);
		break;
}

draw_set_alpha(flash);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);

flash = Approach(flash, 0, 0.05);
if con >= 1
{
	if !dark
	{
		var timer = floor(current_time / 35) * 35;
		if con < 3
			draw_sprite_ext(spr_cheese, 0, x + random_range(-1, 1), yy + random_range(-1, 1), 1, 1, 0, c_white, 1);
		else
			draw_sprite_ext(spr_cheese, 0, x + random_range(-1, 1), yy + random_range(-1, 1), 1 + sin(timer / 50) * .5, 1 + sin(timer / 60 + pi) * .5, sin(timer / 200 + pi / 2) * 25, c_white, 1);
	}
	draw_sprite_ext(spr_title, 1, x - 395 / 2, yy + 120, 1, 1, 0, c_white, y / 50 - 0.5);
	
	draw_set_align(fa_center);
	draw_set_color(c_white);
	
	for(var i = 0; i < array_length(array); i++)
	{
		var this = array[i];
		if this.y < y - 32
		{
			array_delete(array, i, 1);
			i--;
			continue;
		}
		if this.y > y + SCREEN_WIDTH
			break;
		
		switch this.type
		{
			case 0:
				draw_set_font(lang_get_font("font_small"));
				draw_text(x, this.y - y, this.text);
				break;
			case 1:
				draw_set_font(lang_get_font("creditsfont"));
				draw_text(x, this.y - y, this.text);
				break;
		}
	}
}

if showtext
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_align();
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, skiptext);
}
