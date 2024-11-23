var languageable = false;
switch sprite_index
{
	case spr_duncehat:
	case spr_boobshat:
		languageable = true;
		break;
}

var yy = round(y) - abs(sin(scr_current_time() / 200) * 4);
if languageable
	lang_draw_sprite_ext(sprite_index, image_index, round(x), yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_ext(sprite_index, image_index, round(x), yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
