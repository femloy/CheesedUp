/// @description draw player name

with obj_player1
{
	tdp_draw_set_align(fa_center, fa_bottom);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	tdp_draw_set_font(lfnt("font_small"));
	
	tdp_draw_text(x, y - sprite_height / 2 + sprite_get_bbox_top(player_sprite()), other.username);
	tdp_text_commit();
}