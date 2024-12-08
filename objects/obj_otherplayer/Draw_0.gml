live_auto_call;

if !sprite_exists(sprite)
	sprite = default_spr;

xx = lerp(xprev, x, lerp_time / lerp_time_max);
yy = lerp(yprev, y, lerp_time / lerp_time_max);

pal_swap_set(spr_palette == noone ? spr_peppalette : spr_palette, paletteselect);
pattern_set([1, 2], sprite, frame, xscale, yscale, palettetexture);
draw_sprite_ext(sprite, frame, xx, yy, xscale, yscale, 0, c_white, global.online_player_opacity);
pal_swap_reset();

draw_set_align(fa_center, fa_bottom);
draw_set_alpha(global.online_name_opacity);
draw_set_colour(net_parse_css_color(name_color));
draw_set_font(global.font_small);
draw_text(xx, yy - sprite_height / 2 + sprite_get_bbox_top(sprite), global.online_streamer_mode ? $"Player {uuid}" : username);
