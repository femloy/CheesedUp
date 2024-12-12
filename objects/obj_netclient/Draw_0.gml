ptt {

with obj_player1
{
	draw_set_align(fa_center, fa_bottom);
	draw_set_alpha(1);
	draw_set_color(net_parse_css_color(other.name_color));
	draw_set_font(lfnt("font_small"));
	
	draw_text(x, y - sprite_height / 2 + sprite_get_bbox_top(player_sprite()), other.username);
}

}
