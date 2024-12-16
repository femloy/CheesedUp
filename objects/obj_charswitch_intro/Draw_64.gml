var xx = SCREEN_X, yy = SCREEN_Y, xscale = get_screen_xscale(), yscale = get_screen_yscale();
draw_sprite_ext(sprite_index, image_index, xx, yy + shakey, xscale, yscale, 0, c_white, 1);

if state == states.normal
{
	draw_sprite(spr, 0, 0, 0);
	switch spr
	{
		case spr_backtonoise:
		    lang_draw_sprite_ext(spr_backtonoise_text, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
		case spr_backtopeppino:
		    lang_draw_sprite_ext(spr_backtopeppino_text, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
		case spr_backtovigilante:
		    lang_draw_sprite_ext(spr_backtovigilante_text, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
		case spr_noise_intro:
		    lang_draw_sprite_ext(spr_noise_introtext, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
		case spr_gustavo_intro:
		    lang_draw_sprite_ext(spr_gustavo_introtext, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
		case spr_mort_intro:
		    lang_draw_sprite_ext(spr_mort_introtext, 0, xx, yy, xscale, yscale, 0, c_white, 1);
		    break;
	}
}
