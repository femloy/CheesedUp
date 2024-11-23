live_auto_call;

if !init
	exit;

draw_set_align();
draw_set_colour(c_white);

// animation
if anim_con == 0
{
	curve = animcurve_channel_evaluate(outback, anim_t);
	anim_t = Approach(anim_t, 1, 0.035);
}
if anim_con == 1 or anim_con == 2
{
	curve = animcurve_channel_evaluate(incubic, anim_t);
	anim_t = Approach(anim_t, 0, 0.06);
}

// background
bg_pos = (bg_pos + 0.5) % 400;

var spotlight_size = get_curve_scale() * 560 * curve;
if curve < 1
	draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, spotlight_size);

toggle_alphafix(false);

switch object_index
{
	default:
		var do_pal = mixingfade > 0 && mixingfade < 1 && curve >= 1;
		if do_pal
			pal_swap_set(spr_dresserbg_pal, mixingfade);
		draw_sprite_tiled_ext(spr_dresserbg, mixingfade >= 1 ? 1 : 0, bg_pos, bg_pos, 1, 1, c_white, 0.75);
		if do_pal
			pal_swap_reset();
		break;
	
	case obj_cosmeticchoice:
		draw_sprite_tiled_ext(spr_cosmeticbg, 0, bg_pos, bg_pos, 1, 1, c_white, 0.75);
		break;
	
	case obj_songchoice:
		draw_sprite_tiled_ext(spr_jukeboxbg, 0, bg_pos, bg_pos, 1, 1, c_white, 0.75);
		break;
}

/*
draw_set_alpha(0.75)
draw_set_color();
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
draw_set_color(c_white);
*/

// draw content
draw_set_colour(c_white);
if is_method(draw)
	draw(curve);
shader_reset();

// post draw content
if is_method(postdraw)
	postdraw(curve);

while surface_get_target() != obj_screensizer.gui_surf
	surface_reset_target();

draw_reset_clip();
toggle_alphafix(true);

with obj_transfotip
{
	if visible
	{
		draw_set_colour(c_black);
		
		var xx = SCREEN_WIDTH / 2;
		var yy = SCREEN_HEIGHT - 50;
		var s = text_size;
		
		xx -= (s[0] / 2);
		yy -= s[1];
		
		draw_set_alpha(fade / 3);
		draw_roundrect(xx - 16, yy - 10, xx + s[0] + 16, yy + s[1], false);
		draw_set_alpha(1);
	}
}
