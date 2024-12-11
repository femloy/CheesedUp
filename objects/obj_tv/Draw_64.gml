draw_set_font(lang_get_font("bigfont"));
draw_set_align(fa_center, fa_bottom);
draw_set_color(c_white);

if global.hud == hudstyles.debug
{
	
}
else if !hud_is_forcehidden()
{
	if global.hud == hudstyles.old
		scr_tvdraw_old();
	else if global.hud == hudstyles.minimal
		scr_tvdraw_mini();
	else
		scr_tvdraw();
}
