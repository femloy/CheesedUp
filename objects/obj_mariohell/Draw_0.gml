live_auto_call;

draw_clear(merge_color(c_red, c_black, 1));

if con >= 10
	exit;

if con > 0
{
	if dialog.active && dialog.c > 0 && string_starts_with(dialog.array[dialog.index], "\\eC")
		draw_sprite_ext(spr_mario, 0, x + SCREEN_WIDTH / 2, y + SCREEN_HEIGHT / 2, image_xscale * random_range(0.5, 1.5), image_yscale * random_range(0.75, 1.25), image_angle + random_range(-25, 25), merge_colour(image_blend, c_red, random_range(0.25, 0.75)), image_alpha);
	else if irandom(10) == 5 && con >= 5
		draw_sprite_ext(spr_mario, 0, x + SCREEN_WIDTH / 2, y + SCREEN_HEIGHT / 2, image_xscale * random_range(0.75, 1.25), image_yscale * random_range(0.75, 1.25), image_angle + random_range(-2, 2), merge_colour(image_blend, c_red, random_range(0, 0.5)), image_alpha);
	else
		draw_sprite_ext(spr_mario, 0, x + SCREEN_WIDTH / 2, y + SCREEN_HEIGHT / 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

with dialog
{
	var size = animcurve_channel_evaluate(active ? other.outback : other.incubic, anim_t);
	if size <= 0
		exit;
	
	// box
	var xx = 50 * size;
	var yy = 190 * size;
	var xsiz = (960 / 2) * (1 - size);
	var ysiz = (540 / 2) * (1 - size);
	var yplus = 170;
	var rectsize = 5;

	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_roundrect_ext(xx + xsiz, yy + ysiz + yplus, 960 - xx - xsiz, 540 - yy - ysiz + yplus, 16, 16, false);
	draw_roundrect_ext(xx + xsiz + rectsize, yy + ysiz + rectsize + yplus, 960 - xx - xsiz - rectsize, 540 - yy - ysiz - rectsize + yplus, 16, 16, false);
	draw_set_alpha(1);
	
	if active && c > 0
	{
		// text
		var str = array[index];
		
		draw_set_font(lfnt("font_small"));
		draw_set_colour(c_white);
		draw_set_align();
		
		var xst = 90, yst = 390;
		var xx = xst, yy = yst;
		var color = c_white;
		var effect = 0;
		
		for(var i = 1; i < c; i++)
		{
			var char = string_char_at(str, i);
			switch char
			{
				case "^":
					i++;
					continue;
				case "\n":
					yy += 20;
					xx = xst;
					break;
				case "\\":
					char = string_char_at(str, ++i);
					switch char
					{
						case "c":
							char = string_char_at(str, ++i);
							switch char
							{
								case "R": color = merge_color(c_red, c_white, 0.2); break;
								case "0": color = c_white; break;
							}
							break;
						case "e":
							char = string_char_at(str, ++i);
							switch char
							{
								case "S": effect = 1; break;
								case "0": effect = 0; break;
							}
							break;
					}
					continue;
			}
			
			switch effect
			{
				case 0:
					tdp_draw_text_color(xx, yy, char, color, color, color, color, 1);
					break;
				case 1:
					tdp_draw_text_color(xx + random_range(-1, 1), yy + random_range(-1, 1), char, color, color, color, color, 1);
					break;
			}
			
			// shift next letter
			xx += string_width(char);
		}
		
		if c >= string_length(str)
			tdp_draw_text(880 + sin(current_time / 200) * 3, 490, ">");
		tdp_text_commit();
	}
}
